# TryHackMe — Windows Forensics 1

**Room:** Windows Forensics 1 — TryHackMe  
**Focus:** Windows Registry forensics, offline hive analysis, data acquisition, common artifacts for DFIR.

---

## Objective
This repository contains my documented steps, artifact examples, and commands from completing the TryHackMe *Windows Forensics 1* room.  
The focus is on acquiring and analyzing Windows Registry hives to identify user/system activity, program execution, and USB device usage.

---

## Lab Environment
- **Platform:** TryHackMe VM (Windows target + AttackBox)
- **Host:** VirtualBox / VMware (as per TryHackMe)
- **Tools used:**  
  - FTK Imager / `dd` (disk imaging)  
  - KAPE (artifact triage collection)  
  - Regripper (Registry parsing)  
  - PowerShell / `reg.exe`  
  - EZTools, plaso (optional)

---

## Key Learnings
- Locate & extract offline Registry hives: `SAM`, `SYSTEM`, `SOFTWARE`, `SECURITY`, `NTUSER.DAT`
- Enumerate system/user info: accounts, SIDs, logon data
- Identify program execution: UserAssist, MUICache, AmCache, ShimCache
- Detect USB device connections: MountedDevices, USBSTOR keys
- Automate extraction with KAPE & Regripper

---

## Screenshots
![Room Completion](https://github.com/MayankQuery/tryhackme-writeups/blob/main/windows-forensics-1/images/windows-forensics-1-completion.png)
![Room Practice 1](https://github.com/MayankQuery/tryhackme-writeups/blob/main/windows-forensics-1/images/windows-forensics-1-completion.png)
![Room Practice 2](https://github.com/MayankQuery/tryhackme-writeups/blob/main/windows-forensics-1/images/windows-forensics-1-practice2.png)

---
