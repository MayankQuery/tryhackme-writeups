## Quick Start

1. **Clone**

   ```bash
   git clone https://github.com/<your-username>/thm-threat-hunting-foothold.git
   cd thm-threat-hunting-foothold
   ```
2. **Use detections** in your SIEM (Sigma → convert w/ your backend; SPL/KQL provided).
3. **Run helpers** (optional):

   ```bash
   # Python: flag high fanout domains in DNS CSV (fields: timestamp, src_ip, query, domain)
   python3 scripts/parse_dns_fanout.py sample-data/dns_logs_sample.csv --threshold 25

   # PowerShell: make a simple parent/child process timeline from Sysmon EventID 1
   powershell -ExecutionPolicy Bypass -File scripts/timeline_parent_child.ps1 -Path C:\Logs\sysmon.json
   ```

---

## Hunting Methodologies by Tactic

### Initial Access

* Look for **numerous failed logons** followed by **one success** (same src IP → account).
* **Web app intrusions** → w3wp.exe/Apache child spawns, webshell artifacts, unusual file drops in web roots.
* **Mail clients** (Outlook) downloading **unusual** attachments / temp files.
* **Correlate post‑success activity**: new processes, file writes, lateral movement attempts.

**Key Windows Event IDs:** 4625/4624 (logon), 4648 (explicit creds), 4776 (NTLM), 4688 (process creation, if enabled), Sysmon 1/3/7/11/22.

### Execution

* **Excessive** `cmd.exe` / `powershell.exe`, suspicious flags (`-nop -w hidden -enc`).
* **LOLBAS**: `rundll32`, `regsvr32`, `mshta`, `wmic`, `bitsadmin`, `certutil`, `installutil`, `cscript/wscript`.
* **Abused dev tools**: Python, Node, GCC, PowerShell ISE, VS Code on servers.
* **Parent/child** relationships: *who launched the launcher?*

### Defense Evasion

* **Security product disablement** (service stops, tamper events).
* **Log clear** attempts (Event ID 1102, `wevtutil cl`).
* **Process injection** indicators (Sysmon 8/10/11/12/13, unusual memory permissions).

### Persistence

* **Scheduled Tasks** creation/modification.
* **Registry Run/RunOnce**, **Services**, **WMI subscriptions**, **Startup folders**.
* Pivot to **parent process** and **first execution** after creation.

### Command & Control

* **High unique subdomain fan‑out** on one base domain.
* **Unusual egress** to cloud apps / pastebins / storage (OneDrive, Dropbox, GDrive) from servers.
* **Outbound bursts** to **unfamiliar domains**.
* Always tie **network** back to the **originating process**.

---

## Detections

### Sigma

> Drop these into your Sigma repo; convert to your SIEM backend.

#### `detections/sigma/win_failed_then_success_logon_burst.yml`

```yaml
title: Failed Logon Burst Followed by Success (Same Source)
id: 7c1c4f5b-ia-burst
status: experimental
description: Detects multiple 4625s from same src to an account followed by a 4624 within a short window.
logsource:
  product: windows
  service: security
  category: authentication
attack:
  - technique: T1110
    tactic: credential-access
level: high
selection_failed:
  EventID: 4625
selection_success:
  EventID: 4624
condition: selection_failed | near selection_success
fields:
  - IpAddress
  - TargetUserName
  - LogonType
  - SubjectLogonId
falsepositives:
  - User lockout testing, VPN flaps
```

#### `detections/sigma/win_lolbas_susp_exec.yml`

```yaml
title: Suspicious LOLBAS Execution Patterns
id: 9f2a7d3e-lolbas
status: experimental
logsource:
  product: windows
  category: process_creation
attack:
  - technique: T1204
    tactic: execution
  - technique: T1059
    tactic: execution
detection:
  selection:
    Image|endswith:
      - '\\rundll32.exe'
      - '\\regsvr32.exe'
      - '\\mshta.exe'
      - '\\wmic.exe'
      - '\\bitsadmin.exe'
      - '\\certutil.exe'
      - '\\installutil.exe'
      - '\\cscript.exe'
      - '\\wscript.exe'
  condition: selection
fields:
  - CommandLine
  - ParentImage
  - ParentCommandLine
level: medium
```

#### `detections/sigma/win_av_tamper.yml`

```yaml
title: Security Product Tamper or Disablement
id: 1b0f1a2c-av-tamper
status: experimental
logsource:
  product: windows
  service: security
attack:
  - technique: T1562
    tactic: defense-evasion
detection:
  selection:
    EventID:
      - 7036 # Service state changes (System log via Winlogbeat mapping)
      - 1116 # AV detection disabled (provider dependent)
      - 5007 # Windows Defender settings changed
  condition: selection
fields:
  - ProviderName
  - ServiceName
  - Message
level: high
```

#### `detections/sigma/win_persistence_schtasks_runkeys.yml`

```yaml
title: Persistence via Scheduled Tasks and Run Keys
id: 2d9e55ab-persist
status: experimental
logsource:
  product: windows
  category: registry_event
attack:
  - technique: T1053.005
    tactic: persistence
  - technique: T1547.001
    tactic: persistence
detection:
  selection_run_keys:
    TargetObject|contains:
      - '\\Software\\Microsoft\\Windows\\CurrentVersion\\Run'
      - '\\RunOnce'
  condition: selection_run_keys
level: medium
```

#### `detections/sigma/net_dns_c2_suspicious_subdomain_fanout.yml`

```yaml
title: DNS C2 — High Unique Subdomain Fan-Out
id: 65e1af01-dns-fanout
status: experimental
logsource:
  product: dns
attack:
  - technique: T1071.004
    tactic: command-and-control
detection:
  selection:
    QueryName|re: '^[a-z0-9]{6,}\\.[a-z0-9\\.-]+$'
  condition: selection
falsepositives:
  - CDNs, telemetry domains
level: medium
```

---

### Splunk SPL

#### `detections/splunk/initial_access_failed_then_success.spl`

```spl
| tstats count WHERE index=winevent* (EventCode=4625 OR EventCode=4624) BY _time, host, user, src, EventCode
| bin _time span=5m
| stats sum(eval(EventCode=4625)) AS failed sum(eval(EventCode=4624)) AS success BY _time, user, src
| where failed>=5 AND success>=1
| sort - _time
```

#### `detections/splunk/lolbas_exec.spl`

```spl
index=endpoint (Image IN ("*rundll32.exe","*regsvr32.exe","*mshta.exe","*wmic.exe","*bitsadmin.exe","*certutil.exe","*installutil.exe","*cscript.exe","*wscript.exe"))
| table _time host user parent_process process_name CommandLine
```

#### `detections/splunk/defense_evasion_tamper.spl`

```spl
index=winevent* (EventCode=5007 OR EventCode=1116 OR EventCode=7036)
| stats values(Message) AS details BY _time, host, user, EventCode, Provider_Name, Service_Name
```

#### `detections/splunk/persistence_artifacts.spl`

```spl
index=winregistry TargetObject="*\\CurrentVersion\\Run*" OR TargetObject="*\\RunOnce*"
| stats values(Details) AS value BY _time, host, user, TargetObject
```

#### `detections/splunk/c2_dns_anomaly.spl`

```spl
index=dns  | bin _time span=15m
| eval base_domain=replace(query, "^.*?([^.]+\\.[^.]+)$", "\\1")
| stats dc(query) AS unique_subdomains BY _time, src_ip, base_domain
| where unique_subdomains>25
| sort - unique_subdomains
```

---

### Elastic (KQL / EQL)

#### `detections/elastic/initial_access_burst.kql`

```kql
(event.code : 4625 or event.code : 4624)
| bucket by 5m
| stats sum(case(event.code==4625,1,0)) as failed, sum(case(event.code==4624,1,0)) as success by user.name, source.ip
| where failed >= 5 and success >= 1
```

#### `detections/elastic/lolbas_exec.eql`

```eql
process where process.name in ("rundll32.exe","regsvr32.exe","mshta.exe","wmic.exe","bitsadmin.exe","certutil.exe","installutil.exe","cscript.exe","wscript.exe")
```

#### `detections/elastic/tamper_defender.kql`

```kql
(event.code : 5007 or event.code : 1116 or event.code : 7036)
```

#### `detections/elastic/persistence_registry.kql`

```kql
registry.path : *\\Software\\Microsoft\\Windows\\CurrentVersion\\Run* or registry.path : *\\RunOnce*
```

#### `detections/elastic/dns_c2_outliers.kql`

```kql

// Assumes fields: dns.question.name, source.ip
// Use Lens to aggregate dc(dns.question.name) over 15m by base domain; threshold > 25

```

> ⚠️ Field names vary by datasource. Adjust `index`, `provider`, and `field` names to your environment.

---

## Playbooks

* **PB‑IA‑001** — *Failed‑Then‑Success Account Triage*

  1. Confirm auth source IP/ASN & geo. 2) Check account login map last 30 days. 3) Correlate first 10 mins post‑success: processes, file writes, lateral attempts. 4) Reset creds + tokens, invalidate sessions.

* **PB‑EXE‑002** — *LOLBAS Process Tree*
  Build tree from parent (e.g., `w3wp.exe`, `outlook.exe`, `explorer.exe`). Flag hidden windows, encoded commands, script host usage. Hash + VT/CTI enrich.

* **PB‑DEF‑003** — *Security Tamper*
  Look for services stopped/disabled, Defender config changes, `wevtutil cl`. Collect ETW/EDR artifacts. If confirmed, isolate host.

* **PB‑PER‑004** — *Scheduled Tasks & Run Keys*
  Pull task XML, author, triggers, binary paths. Review Run/RunOnce entries and first execution time.

* **PB‑C2‑005** — *DNS Fan‑Out & Cloud Apps*
  Aggregate by base domain; threshold anomalies; check user‑agent, parent process, and data size. Block or sinkhole if malicious.
