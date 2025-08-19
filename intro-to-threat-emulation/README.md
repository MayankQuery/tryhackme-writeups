# Intro to Threat Emulation — TryHackMe (SOC Level 2)

> **Room:** Intro to Threat Emulation
> **Difficulty:** Medium
> **Est. Time:** 60 min
> **Status:** ✅ Room completed (100%)
> **Module Fit:** Cyber Defence Frameworks, Cyber Threat Intelligence
> **Room Link:** *(add your THM link here)*

---

## Repository Structure

```
intro-to-threat-emulation/
├─ README.md                    # You are here
├─ notes/
│  ├─ key_takeaways.md          # Concepts & summaries per task
│  └─ references.md             # Curated links & docs
├─ emulation/
│  ├─ emulation_plan.md         # Objectives, scope, rules of engagement
│  ├─ atomic_tests.md           # Atomic Red Team mapping & test cards
│  ├─ caldera_ops.md            # MITRE Caldera op notes & plugins
│  └─ op_checklist.md           # Pre/during/post run checklist
├─ detections/
│  ├─ sigma_rules/              # Sigma drafts (YAML)
│  ├─ splunk_queries.md         # SPL queries for detections
│  ├─ elastic_kql.md            # KQL/ES|QL examples
│  └─ edr_hunts.md              # EDR hunt ideas/queries
├─ artifacts/
│  ├─ screenshots/              # Lab screenshots (redact sensitive data)
│  ├─ logs/                     # Test logs/pcaps (sanitized)
│  └─ payloads/README.md        # Pointers only (no malware binaries)
├─ report/
│  ├─ Threat_Emulation_Report_Template.md # Executive/technical template
│  └─ findings_register.md      # Finding IDs, status, owners
├─ templates/
│  ├─ roa.md                    # Rules of engagement template
│  ├─ test_card.md              # Test case template
│  └─ risk_register.md          # Risk register template
└─ LICENSE
```

---

## Learning Objectives (from room)

* Understand what **Threat Emulation** is.
* Identify **frameworks** used in Threat Emulation.
* Understand how to **plan, execute, and report** emulation exercises.

### Prerequisites

* Review modules/rooms on **Cyber Defence Frameworks** and **Cyber Threat Intelligence**.

---

## Quick Start

1. **Clone** this repo and make it your own:

   ```bash
   git init && git add . && git commit -m "init: THM Intro to Threat Emulation write-up"
   git branch -M main
   git remote add origin <your_repo_url>
   git push -u origin main
   ```
2. Drop your screenshots into `artifacts/screenshots/` and logs/pcaps into `artifacts/logs/` (sanitize first).
3. Use the **templates** to document your ROE, test cards, and risks.
4. Capture detections (SPL/KQL/Sigma) in `detections/` as you emulate.
5. Summarize outcomes in `report/Threat_Emulation_Report_Template.md`.

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

Log and screenshot each step; document expected vs. observed detections.

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

## Reporting Template (drop into `report/Threat_Emulation_Report_Template.md`)

```
# Threat Emulation Report

## Executive Summary
- Objective & scope
- Key outcomes (coverage %, MTTD/MTTR, critical gaps)

## Methodology
- Frameworks, tools, data sources
- ROE summary & constraints

## Detailed Findings
| ID | Technique | Severity | Status | Owner | Due |
|----|-----------|----------|--------|-------|-----|
| TE-001 | T1059 PowerShell flags | Medium | Open | SecOps | 2025-09-15 |

## Detections & Telemetry
- Rules, dashboards, sample event JSON

## Recommendations
- Quick wins, strategic improvements

## Appendices
- Test cards, screenshots, logs (sanitized)
```

---

## Room Tasks & Notes (Fill As You Work)

* **Task 1 – Introduction:** *No answer needed.*
* **Task 2 – What is Threat Emulation?**
  *Your summary & any Q/A here.*
* **Task 3 – Emulation Methodologies**
  *List chosen approach & tools.*
* **Task 4 – Process I (Plan)**
  *Objectives, ROE, metrics.*
* **Task 5 – Process II (Execute)**
  *Atomics/Caldera steps & artifacts.*
* **Task 6 – Process III (Report)**
  *Findings & remediation.*
* **Task 7 – Conclusion**
  *What improved? What’s next?*

> **No spoilers**: This repo is structured to document learning without posting proprietary room answers. Keep content original and educational.

---

## References (add to `notes/references.md`)

* MITRE ATT\&CK
* Atomic Red Team
* MITRE Caldera
* Detection Engineering fundamentals (Sigma, SPL, KQL)

---

## Contributing

PRs welcome! Focus on:

* Better test cards & mappings
* Detection-as-code examples
* Clean screenshots & sanitized logs

---

## License

MIT

---

### Badges (optional)

Add your TryHackMe badge or completion proof to `artifacts/screenshots/` and embed below.

```markdown
![THM Badge](artifacts/screenshots/thm_badge.png)
```

---
