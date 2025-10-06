# AD: Basic Enumeration — TryHackMe Repo

**Room:** AD: Basic Enumeration  
**Platform:** TryHackMe  
**Duration:** ~60 minutes  
**Difficulty:** Intermediate (requires Windows/AD fundamentals)  
**Goal:** Learn how to enumerate an Active Directory environment and get initial access using common reconnaissance and credential-guessing techniques.

---

## Learning Objectives
- Map the target domain and network topology.  
- Enumerate domain users, groups, and computers.  
- Perform SMB-based enumeration and identify exposed configuration files and credentials.  
- Perform password spraying to obtain initial valid credentials.  
- Understand safe lab practices when testing AD environments.

---

## Prerequisites
- Knowledge of Windows and Active Directory basics (users, groups, GPOs).  
- Familiarity with Linux command line.  
- Basic networking knowledge.  
- Recommended TryHackMe rooms: *Windows & AD Fundamentals*, *Command Line*, *Networking*.

---

## Lab Setup
1. **Start the TryHackMe network** (Start button) and wait for the network to fully boot.  
2. Use the **AttackBox** or connect via the provided VPN (`Jr-Pentester-AD-v01.ovpn`).  
   - If using VPN locally: `sudo openvpn <your_config.ovpn>`  
3. Verify connectivity: `ip route` or `route` should show the lab subnets (e.g., `10.211.11.0/24`).  
4. Use the AttackBox split-screen or your own isolated VM. Do **not** run AD attacks on networks you don’t own/authorize.

---

## Repo Files
- `README.md` — this file  
- `NOTES.md` — detailed notes & walkthrough  
- `CHEATSHEET.md` — quick commands & useful flags  
- `TASKS.md` — tasks and suggested answers you can paste into TryHackMe

---

## Usage
1. Read `NOTES.md` for conceptual guidance and step-by-step commands.  
2. Use `CHEATSHEET.md` during hands-on lab for quick commands.  
3. Copy-paste answers from `TASKS.md` into the TryHackMe answer boxes where required.

---

## Author
MayankPathak (GitHub: `MayankQuery`)
