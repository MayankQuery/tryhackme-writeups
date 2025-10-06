# Threat Hunting: Foothold — TryHackMe Write‑Up & Detections

> Hunting suspicious activities indicating initial user or host compromise (SOC Level 2). Room: **Threat Hunting: Foothold** | Difficulty: **Medium** | Est. time: **120 min**

![badge](https://img.shields.io/badge/TryHackMe-Threat_Hunting%3A_Foothold-red) ![badge](https://img.shields.io/badge/SOC-Level_2-blue) ![badge](https://img.shields.io/badge/Focus-Initial_Access%2C_Execution%2C_Evasion%2C_Persistence%2C_C2-green)

---

## Repository Purpose

This repo is a compact, ready‑to‑use companion for TryHackMe’s **Threat Hunting: Foothold** room. It includes:

* Structured **notes** and **methodologies** for each tactic
* **Detection content** (Sigma rules, Splunk SPL, Elastic EQL/KQL) you can drop into your SIEM
* **Hunting playbooks**, **cheat‑sheets**, and **enrichment tips**
* Lightweight **parsers/scripts** to triage Windows logs and DNS quickly

---

## Overview

**Goal:** Build a mental model and practical detections for early‑stage compromises: *Initial Access → Execution → Defense Evasion → Persistence → C2*.

**What you’ll get here**

* Opinionated queries and rules that surface the most common foothold patterns
* Parent/child process correlation, LOLBAS flags, endpoint tamper attempts
* DNS/C2 oddities and cloud app exfil checks

---

## Cheat‑Sheets

### Windows Event IDs (short list)

* **4625/4624** Auth fail/success
* **4688** Process creation (enable via audit)
* **1102** Audit log cleared
* **5007** Defender settings changed
* **7036** Service state change (System)
* **Sysmon**: 1 (process), 3 (network), 7/11 (image load/file create), 8/10/12/13 (injection/registry)

### Quick Commands

```powershell
# Who modified Defender?
Get-WinEvent -FilterHashtable @{LogName='Microsoft-Windows-Windows Defender/Operational'; ID=5007} | Select TimeCreated,Message

# Recent Scheduled Tasks
schtasks /query /fo LIST /v | findstr /i "TaskName Next RunTime Task To Run Author"

# Run/RunOnce keys
reg query HKCU\Software\Microsoft\Windows\CurrentVersion\Run
reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Run
```

---

## Sample Data & Parsers

### `scripts/parse_dns_fanout.py`

```python
#!/usr/bin/env python3
import csv, sys, argparse
from collections import defaultdict

parser = argparse.ArgumentParser()
parser.add_argument('path')
parser.add_argument('--threshold', type=int, default=25)
args = parser.parse_args()

base = lambda d: '.'.join(d.split('.')[-2:]) if '.' in d else d
counts = defaultdict(set)
with open(args.path, newline='') as f:
    for row in csv.DictReader(f):
        q = row.get('domain') or row.get('query') or ''
        src = row.get('src_ip') or row.get('client_ip') or 'unknown'
        counts[(src, base(q))].add(q)

alerts = [(src, bd, len(subs)) for (src, bd), subs in counts.items() if len(subs) > args.threshold]
for src, bd, n in sorted(alerts, key=lambda x: -x[2]):
    print(f"ALERT: {src} -> {bd} unique_subdomains={n}")
```

### `scripts/timeline_parent_child.ps1`

```powershell
param(
  [Parameter(Mandatory=$true)][string]$Path
)
# Expects Sysmon JSON lines with fields: UtcTime, Image, ParentImage, CommandLine, ParentCommandLine, ProcessGuid
Get-Content $Path | ForEach-Object {
  $o = $_ | ConvertFrom-Json
  "$( $o.UtcTime )`t$( Split-Path $o.ParentImage -Leaf ) -> $( Split-Path $o.Image -Leaf )`t$( $o.ParentCommandLine )`t$( $o.CommandLine )"
}
```

---

## MITRE ATT\&CK Mapping

* **Initial Access**: T1190 Exploit Public‑Facing App, T1566 Phishing, T1110 Brute Force
* **Execution**: T1059 Command & Scripting Interpreter, T1204 User Execution, LOLBAS (various)
* **Defense Evasion**: T1562 Impair Defenses, T1070 Indicator Removal
* **Persistence**: T1053.005 Scheduled Task, T1547.001 Registry Run Keys
* **Command & Control**: T1071.004 DNS, T1090 Proxy

---

## Screenshots / Artifacts
![Room Completion](https://github.com/MayankQuery/tryhackme-writeups/blob/main/threat-hunting-foothold/images/threat-hunting-foothold-completion.png)

---
