# TryHackMe — Linux Threat Detection 1 (Repository)

**Room:** Linux Threat Detection 1  
**Platform:** TryHackMe  
**Estimated time:** 60 min  
**Difficulty:** Intermediate (beginner-friendly for SOC analysts)  
**Room link:** _(add TryHackMe link here)_

---

## Overview
This repository contains notes, a quick cheatsheet, and task writeups for the TryHackMe room **Linux Threat Detection 1**. The room focuses on common Initial Access techniques against Linux hosts and how to detect them using logs and process analysis.

---

## Learning objectives
- Understand the role and risk of SSH in Linux environments.
- Detect common initial access techniques (SSH brute force, credential reuse, service exploitation).
- Use process-tree analysis to identify attack origin.
- Practice using Linux logging sources (syslog, auth.log, journalctl, auditd) to detect intrusions.

---

## Contents
- `README.md` — repo overview
- `NOTES.md` — walkthrough, concepts, detection logic
- `CHEATSHEET.md` — quick commands & detection recipes
- `TASKS.md` — answers and sample investigative steps to paste into TryHackMe

---

## Prerequisites
- Complete **Linux Logging for SOC** or equivalent knowledge of Linux logs.
- Basic Linux command line skills.
- Familiarity with MITRE ATT&CK concepts (Initial Access, Persistence, Execution).

---

## Tools used
- `ssh`, `ss`/`netstat`, `ps`, `pstree`, `ps aux`, `grep`, `awk`, `journalctl`, `ausearch`, `auditctl`/`auditd`, `flock`, `strace` (for investigation), `tcpdump` (optional).

---

## How to use this repo
1. Create a new repository and paste each file from this folder.
2. Use `NOTES.md` while doing the lab to follow investigative steps.
3. Use `CHEATSHEET.md` during the lab to run quick commands.
4. Copy answers from `TASKS.md` to TryHackMe where needed (adjust outputs to match the lab machine).

---

**Author:** Mayank Pathak — GitHub: `MayankQuery`
