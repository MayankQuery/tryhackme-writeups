# File and Hash Threat Intel


**TryHackMe Room:** File and Hash Threat Intel


**Estimated time:** 60–90 minutes


**Difficulty:** Intermediate (focus: SOC triage / CTI enrichment)


---


## Overview


This room teaches how to enrich file and hash artefacts using threat intelligence sources. The goal is to transform raw file paths and hash values into contextual intelligence for SOC triage.


By completing this repo you'll have:
- Step-by-step notes and commands for generating and validating file hashes.
- A triage checklist for L1/L2 analysts.
- Quick commands for Windows/Linux hash generation and YARA basics.
- Example mappings of sandbox telemetry to MITRE ATT&CK.


---


## Learning Objectives


- Interpret suspicious file paths and filenames using heuristics.
- Generate and validate file hashes (MD5, SHA-1, SHA-256).
- Use VirusTotal and MalwareBazaar to enrich binary artefacts.
- Extract behaviour from sandbox telemetry and map it to MITRE ATT&CK.


---


## Prerequisites


- Basic Windows and Linux shell knowledge.
- Intro to Cyber Threat Intelligence fundamentals.
- Access to the TryHackMe lab (AttackBox / VM) and the target IP if provided.


---


## How to use this repo


1. Clone this repository to your local machine.
2. Start the room on TryHackMe and follow the tasks in `TASKS.md`.
3. Use `NOTES.md` as your reference during the lab.
4. Keep `CHEATSHEET.md` open for quick commands.


---


## Lab Info


Target machine: `FileHash_ThreatIntel_2025_v3` (example)
Target IP: `10.201.115.41` (as shown in the lab)


---


## Contributing & License


This repo is for personal lab notes and learning. Use the content for learning, and do not publish sensitive sample binaries.
