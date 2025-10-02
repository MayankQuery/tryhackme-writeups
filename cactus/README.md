# TryHackMe — Cactus (Walkthrough & Repo)

**Room:** Cactus  
**Time:** ~60 min  
**Difficulty:** Medium  
**Description:**  
This room focuses on CVE-2022-46169 — an unauthenticated remote code execution (RCE) and authentication bypass vulnerability impacting Cacti versions < 1.2.3. The lab covers exploitation concepts (auth bypass, command injection), detection via logs/SIEM, and mitigation best-practices.

---

## Goals / Learning Objectives
- Understand the impact and risk of CVE-2022-46169 (Cacti RCE / auth bypass).
- Perform safe enumeration against the target machine (open ports, web service).
- Demonstrate an authentication-bypass and command-injection concept (in a legal lab environment).
- Extract and analyze logs using Kibana (SIEM) to detect malicious activity.
- Recommend mitigation, hardening, and detection strategies.

---

## Lab Setup
1. Start the target VM in TryHackMe (`Start Machine`).
2. Start your AttackBox if you need a pre-configured Kali/attack environment.
3. Credentials provided in-room:
   - **Username:** user  
   - **Password:** tryhackme  
   - **IP:** `MACHINE_IP` (use the IP shown in the room)

> Work only within the provided TryHackMe environment. Do not attempt these techniques on unauthorized systems.

---

## Tools you will use
- nmap, nikto, curl, gobuster/ffuf (enumeration)
- a browser (inspect web app, forms)
- SSH (for connecting to the target when needed)
- Kibana (port 5601) — SIEM / log analysis
- Text editor (vim, nano) for notes

---

## Structure of this repo
- `README.md` — overview & setup (this file)  
- `NOTES.md` — commands run & findings (copy/paste friendly)  
- `CHEATSHEET.md` — quick lookups, detection rules, important tips  
- `TASKS.md` — task answers (ready to paste to TryHackMe answers)

---

## Important safety note
This repo contains **educational** information and lab walkthrough content only. It purposely omits direct exploit payloads or step-by-step offensive payloads that could be used outside of a legal training environment. Use this repo only in the TryHackMe lab or other authorized test environments.

---
