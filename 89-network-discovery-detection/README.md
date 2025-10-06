# Network Discovery Detection — TryHackMe Repo

**Room:** Network Discovery Detection  
**Platform:** TryHackMe  
**Duration:** ~60 minutes  
**Difficulty:** Beginner → Intermediate  
**Goal:** Understand how attackers discover assets in a network and how to detect that activity.

---

## Learning Objectives
- Define network discovery and why attackers perform it.
- Distinguish external vs internal scanning.
- Understand horizontal vs vertical scanning.
- Learn the mechanics of commonly used scanning tools and techniques.
- Learn detection strategies: network telemetry, IDS/IPS signatures, logging and alerting.

---

## Prerequisites
- Completed: *Network Security Essentials*, *Linux Fundamentals Module* (recommended)
- Basic Linux command line familiarity
- A Kali Linux (or similar) environment and a target VM (TryHackMe target machine)
- Wireshark / tcpdump and a basic IDS/monitoring tool (Suricata/Snort) are helpful for detection exercises

---

## Lab Setup
1. Start the Target Machine on TryHackMe (it may take ~3 minutes to boot).
2. Use the right-side VM pane (or an external VM) to run tools (nmap, netdiscover, arp-scan).
3. If using local VMs, set networking according to the lab instructions (NAT/Host-only as required).

---

## Repository Files
- `README.md` — this file
- `NOTES.md` — detailed notes & walkthrough
- `CHEATSHEET.md` — quick commands, filters and detection signatures
- `TASKS.md` — tasks and suggested answers you can paste into TryHackMe

---

## Usage
1. Read `NOTES.md` for theory and step-by-step commands.
2. Use `CHEATSHEET.md` during hands-on lab for quick reference.
3. Paste relevant answers from `TASKS.md` into the TryHackMe answer boxes.

---

## Author
MayankPathak (GitHub: `MayankQuery`) — TryHackMe writeup format.

