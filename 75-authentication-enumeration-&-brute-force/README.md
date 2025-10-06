# Enumeration & Brute Force — TryHackMe

Room: Enumeration & Brute Force (Web Application Pentesting)

Estimated time: 30 minutes

Difficulty: Easy — Intermediate

Overview This repository contains copy-paste-ready files for documenting your walkthrough of the TryHackMe room Enumeration & Brute Force. Use these files as the basis for a GitHub repository that organizes your notes, tasks, and quick-reference cheatsheet.

## Files in this repo

- README.md (this file)

- NOTES.md — Detailed walkthrough and observations

- TASKS.md — Task-by-task answers and commands

- CHEATSHEET.md — Quick commands & tips for enumeration and brute force

## How to use

- Start the target machine on TryHackMe and note the assigned IP.

- Add the target to your /etc/hosts as shown in the room instructions (example below):
```markdown
MACHINE_IP    enum.thm
```
- Open the machine in your AttackBox or a VPN-connected VM and follow the tasks. Copy the contents of NOTES.md and TASKS.md into your GitHub repository files (or paste into separate files) so you can reference them later.

## Objectives covered

- Authentication enumeration techniques

- Identifying usernames from verbose errors

- Abusing weak password reset logic

- Exploiting HTTP Basic Authentication

- Using OSINT to augment username discovery

## PRE-REQUISITES

- Basic HTTP/HTTPS knowledge (requests, status codes)

- Familiarity with Burp Suite

- Comfortable with Linux command line

- Tools: curl, nmap, gobuster/dirb, wfuzz/gobuster, hydra, wfuzz, Burp


--- NOTES ON ETHICS --- This lab is intended for authorized, legal learning only. Do not use these techniques on systems you do not own or have explicit permission to test.
