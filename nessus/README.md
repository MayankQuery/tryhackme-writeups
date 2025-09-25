
# Nessus - TryHackMe


**Room:** Nessus (Learn)
**Difficulty:** Beginner
**Estimated time:** 45 min


## Room Summary
Learn how to set up and use **Nessus**, a commercial/enterprise-grade vulnerability scanner. This room walks through installing Nessus (or using the provided scanner), configuring scans, running host and web application scans, and interpreting the results.


## Objectives
- Install or access Nessus
- Configure and run host and web application scans
- Identify key plugin results (server fingerprinting, sensitive files, config backups, etc.)
- Understand scan output and map it to web vulnerabilities (e.g., clickjacking)


## Target Machine
- **Title:** DVWA_BruteForce_Instance--badr
- **Target IP:** `10.201.60.200`


> Note: The VM shown in the room expires — don't forget to add more time if you need it.


## Quick Start
1. Start AttackBox or use your Kali VM.
2. Ensure you have network access to `10.201.60.200` (AttackBox is usually configured).
3. Open Nessus and create a new scan -> choose appropriate template (Basic Network Scan or Web Application Tests / Web App Scan).
4. Configure target as `10.201.60.200` and run the scan.
5. Wait for scan to finish; review plugin findings and map them to questions in the tasks.


## Files in this repo
- `README.md` - This file
- `NOTES.md` - Detailed observation & commands
- `TASKS.md` - Step-by-step answers for room tasks
- `CHEATSHEET.md` - Quick commands & tips


---
