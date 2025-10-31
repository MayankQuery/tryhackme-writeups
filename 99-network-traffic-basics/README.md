# TryHackMe — Network Traffic Basics (Repository)

**Room:** Network Traffic Basics  
**Platform:** TryHackMe  
**Estimated time:** 60 min  
**Difficulty:** Beginner / Introductory  
**Room link:** _(add TryHackMe link here)_

---

## Overview
This repository contains notes, a quick cheatsheet, and task writeups for the TryHackMe room **Network Traffic Basics**. The room introduces fundamental Network Traffic Analysis (NTA) concepts: what network traffic is, what can be observed, the common sources/flows, and tools & techniques to inspect traffic.

---

## Learning objectives
- Define Network Traffic Analysis and its purpose.
- Identify what network traffic artifacts can be observed (packets, flows, metadata).
- Learn common traffic sources and flows (client-server, P2P, north-south, east-west).
- Observe traffic using common tools (Wireshark, tcpdump, tshark, Zeek, NetFlow/NetFlow-like flows).
- Understand basic filtering and investigative steps.

---

## Repository structure
- `README.md` — this file  
- `NOTES.md` — walkthrough, concepts, and detection ideas  
- `CHEATSHEET.md` — quick commands and filters for common tools  
- `TASKS.md` — answers and suggested outputs to paste into TryHackMe

---

## Tools referenced
- Wireshark (GUI) / tshark (CLI)  
- tcpdump  
- Zeek (Bro) / Suricata (optional)  
- NetFlow/IPFIX collectors (e.g., nfdump)  
- ss / netstat for local sessions

---

## How to use
1. Create a new repo and add the files below.  
2. Use `NOTES.md` while completing the lab to follow the conceptual flow.  
3. Use `CHEATSHEET.md` during hands-on exercises.  
4. Copy answers from `TASKS.md` into TryHackMe where required (adjust examples for lab IPs and times).

**Author:** Mayank Pathak — GitHub: `MayankQuery`
