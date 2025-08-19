# Intro to Threat Emulation — TryHackMe (SOC Level 2)

> **Room:** Intro to Threat Emulation
> **Difficulty:** Medium
> **Est. Time:** 60 min
> **Status:** ✅ Room completed (100%)
> **Module Fit:** Cyber Defence Frameworks, Cyber Threat Intelligence
> **Room Link:** *(add your THM link here)*

---

## Learning Objectives 

* Understand what **Threat Emulation** is.
* Identify **frameworks** used in Threat Emulation.
* Understand how to **plan, execute, and report** emulation exercises.

### Prerequisites

* Review modules/rooms on **Cyber Defence Frameworks** and **Cyber Threat Intelligence**.

---

## What is Threat Emulation? (Task 2)

Threat emulation is the **controlled recreation of real-world adversary behaviors** (mapped to frameworks like MITRE ATT\&CK) in a target environment to measure detection, response, and resilience—**without** the unpredictability of full penetration tests. It’s goal-driven, repeatable, and evidence-based.

**Key traits**

* Uses **intelligence-led TTPs** (threat-informed defense).
* Is **scoped & consented** via ROE.
* Drives **measurable outcomes** (detection coverage, MTTD/MTTR, control efficacy).
* Produces **actionable reports** for blue team improvements.

---

## Emulation Methodologies (Task 3)

* **MITRE ATT\&CK** mapping (tactics → techniques → procedures).
* **Atomic Red Team** tests for minimal, safe, reproducible TTPs.
* **MITRE Caldera** for automated ops and adversary profiles.
* **Purple Teaming** cycles (Plan → Execute → Detect → Tune → Re-test).
* **NIST/NICE / CBEST / TIBER-EU** style threat-led approaches (where applicable).

**Tooling examples**

* Adversary simulation: Caldera, Prelude, SCYTHE (commercial).
* Test libraries: Atomic Red Team.
* Telemetry: Sysmon, Windows Eventing, Linux auditd.
* SIEM: Splunk, Elastic.
* Detection-as-code: Sigma → backend queries.

---

## Threat Emulation Process I–III (Tasks 4–6)

### I. Plan

* **Define objectives**: e.g., “Detect and respond to credential dumping (T1003) within 5 minutes.”
* **Scope & ROE**: in-/out-of-scope systems; blast radius limits; allow-lists.
* **Threat selection**: pick an adversary/TTP set (e.g., Initial Access → Priv Esc → Lateral Movement → Exfiltration).
* **Success metrics**: coverage %, MTTD/MTTR targets, true/false positive rates.

### II. Execute

* **Prepare telemetry**: ensure logging baselines (Sysmon config, audit policies).
* **Run tests**: start with Atomics; escalate to Caldera ops.
* **Capture artifacts**: timestamps, hostnames, command lines, hashes, network IOCs.

### III. Measure & Report

* **Detection results**: which events fired, which missed.
* **Control gaps**: misconfigurations, missing logs, rule tuning needs.
* **Remediation plan**: prioritized backlog with owners and due dates.
* **Executive summary**: what risk was reduced; what remains.

---

## Sample Mini Emulation (ATT\&CK-Mapped)

> *Use in a lab only, with ROE and approvals.*

| Phase                 | Goal                                | Example Procedure                                                     | ATT\&CK     |
| --------------------- | ----------------------------------- | --------------------------------------------------------------------- | ----------- |
| Initial Access        | Simulate phishing payload execution | Run a harmless script via `powershell -nop -w hidden -enc < benign >` | T1059/T1204 |
| Execution             | Command/script execution telemetry  | Sysmon Event ID 1 verification                                        | T1059       |
| Credential Access     | Simulate LSASS access (safe)        | Query handles/blocked access (no dump)                                | T1003       |
| Discovery             | Enumerate local users/services      | `whoami /all`, `net user`, `sc query`                                 | T1087/T1033 |
| Lateral Movement      | Test admin share connection         | `net use \\host\C$` (no write)                                        | T1021       |
| Exfiltration (benign) | Compress sample log                 | `tar -cf logs.tar .\sample_logs`                                      | T1560       |

---

## Detections & Hunts (Examples)

* **Splunk (SPL)**

  ```
  index=win* (EventCode=1 OR EventCode=4688)
  | stats count by host, user, ParentImage, Image, CommandLine
  | where like(CommandLine, "% -nop %") OR like(CommandLine, "%Encod%")
  ```
* **Elastic (KQL)**

  ```
  process where event.type=="start" and
  process.command_line : ("* -nop *" or "*EncodedCommand*")
  ```
* **Sigma idea**: Detect suspicious PowerShell flags (`-nop`, `-w hidden`, `-enc`).

Document tuned versions per your environment in `detections/`.

---

## References 

* MITRE ATT\&CK
* Atomic Red Team
* MITRE Caldera
* Detection Engineering fundamentals (Sigma, SPL, KQL)

---

### Badges 

```markdown
![THM Badge](https://github.com/MayankQuery/tryhackme-writeups/blob/main/intro-to-threat-emulation/images/intro-to-threat-emulation-completion.png)
```

---
