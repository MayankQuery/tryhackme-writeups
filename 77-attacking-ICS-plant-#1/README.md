# Attacking ICS Plant #1 — TryHackMe
**Room:** Attacking ICS Plant #1  
**Platform:** TryHackMe  
**Estimated time:** 45 min  
**Room difficulty:** Intro / Intermediate (OT/ICS focused)  
**Completed:** ✅ (Use this repo as your lab notes & summary)

---

## Overview
This repository contains notes, tasks, and a cheat sheet for the TryHackMe room *"Attacking ICS Plant #1"*. The room teaches how to discover and interact with ICS/SCADA devices using the Modbus protocol (Modicon / Schneider Electric) in a controlled lab environment.

**Learning goals**
- Understand core OT/ICS components (SCADA, PLC, RTU, HMI).
- Learn Modbus basics (TCP vs RTU), registers, and function codes.
- Discover ICS devices on a network.
- Read from and (in a lab) write to Modbus registers to understand impact.
- Practice safe, lawful experimentation in an isolated lab.

---

## Structure
README.md
Notes.md
Tasks.md
Cheatsheet.md

---

## Requirements / Prerequisites
- Basic networking knowledge (IP, ports).
- Linux / Kali or similar environment.
- Tools (suggested): `nmap`, `wireshark`, `modpoll` / `qmodbus`, `pymodbus` (Python), `scapy`.
- A safe, isolated lab (TryHackMe AttackBox or a local VM) — **do not** run Modbus attacks against production or third-party systems.

---

## Usage
1. Clone this repo into your lab environment.
2. Open `Notes.md` for theory and step-by-step concepts.
3. Follow `Tasks.md` to work through the room exercises.
4. Keep `Cheatsheet.md` handy for quick commands and reference.

---

## Legal & Safety
This repo is for educational use in isolated lab environments (e.g., TryHackMe, local VMs). Modbus devices control physical processes — writing to real devices without explicit permission is illegal and dangerous. Always have authorization and use controlled testbeds.

---
