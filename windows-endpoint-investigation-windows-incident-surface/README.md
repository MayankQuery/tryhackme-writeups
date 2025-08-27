# TryHackMe: Windows Incident Surface

## Room Overview
**Windows Incident Surface** is part of the *Advanced Endpoint Investigations* module on [TryHackMe](https://tryhackme.com).  
This room focuses on learning and applying **DFIR (Digital Forensics & Incident Response)** techniques to analyze key **Windows forensic artefacts** during an investigation.

- **Difficulty:** Medium  
- **Duration:** ~180 minutes  
- **Module:** Advanced Endpoint Investigations → Windows Endpoint Investigation  

---

## Skills Learned
- Understanding the **reliability and limitations** of Windows system tools  
- Profiling a Windows system using forensic artefacts  
- Identifying **user accounts and sessions** during investigations  
- Analyzing **network scope** for suspicious activity  
- Reviewing **startup items and registry keys** for persistence techniques  
- Examining **services and scheduled tasks** for attacker footholds  
- Investigating **processes and directories** to detect anomalies  

---

## Repository Content
- `Tasks/` -> Write-ups for each task in the room  
- `Notes/` -> General notes on Windows incident artefacts and investigation methodology  
- `Findings/` -> Summaries of discovered artefacts and attack correlations  

---

## Key Takeaways
1. **System Tools** -> Always cross-check results, as built-in tools may hide or skip malicious entries.  
2. **User Sessions** -> Suspicious or unexpected accounts can be an entry point.  
3. **Network Scope** -> Connections to unusual IPs or ports reveal lateral movement.  
4. **Registry & Startup** -> Common persistence mechanisms attackers abuse.  
5. **Processes & Directories** -> Malicious executables often masquerade as legitimate Windows files.  

---

## Room Completion
- Room completed: **100%**  
- Certificate of completion available on TryHackMe profile.  

![Room Completion](https://github.com/MayankQuery/tryhackme-writeups/blob/main/windows-endpoint-investigation-windows-incident-surface/images/windows-endpoint-investigation-windows-incident-surface-completion.png)

---

## Author
Created as part of my **DFIR learning journey** on TryHackMe.  
GitHub: [MayankQuery](https://github.com/MayankQuery)  
