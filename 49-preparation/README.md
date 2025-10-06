## Incident Response: Preparation — TryHackMe (SOC Level 2)

A practical notebook + templates repo for the Preparation phase of Incident Response (IR), based on the TryHackMe room.

Room: Incident Response → Preparation
Level: Medium | Time: ~60 min | Track: SOC Level 2
Scenario: You’re the IR lead at SwiftSpend Financial (SSF). Logging exists, but documentation and IR readiness are incomplete. Your job: prepare the people, process, and technology to respond effectively.

---

## Learning Objectives

- Understand why an organization needs an IR capability
- Prepare people, process, and technology for IR
- Improve visibility via logging, baselining, and centralization

---

## Quick Start

1. Clone repo & adjust org details (replace SSF with your org)
2. Complete 01-people-and-docs (policy → plan → roles → comms → playbooks)
3. Roll out 02-technology-prep (Sysmon, audit policy, WEF, SIEM, EDR)
4. Map 03-visibility (assets, logging matrix, KPIs)
5. Capture 99-tryhackme-notes while doing the room

---

## People & Documentation (Task 3)

IR Policy (excerpt)
- Scope: Enterprise-wide (users, endpoints, servers, SaaS, cloud)
- Objectives: Rapid detection, containment, eradication, recovery, lessons learned
- Authority: CISO → IR Lead empowered to isolate hosts, suspend accounts, engage legal
- Reporting: 24/7 hotline + ticket queue

## IR Plan (table-of-contents)
1. Preparation
2. Identification
3. Containment (short/long)
4. Eradication
5. Recovery
6. Post-Incident (lessons learned, metrics)

## Roles & RACI (sample)

Function | Primary | Backup | R | A | C | I
IR Lead | IR Manager | SOC Lead | R | A | CISO, Legal | Exec
Comms   | Corp Comms | PMO | R | A | Legal | All
Forensics | DFIR | Sec Eng | R | A | SOC | I

Communications Plan (essentials)
- Channels: War-room (Teams/Slack), Out-of-band (phone bridge)
- Message templates: Internal alert, Customer advisory, Regulator notification
- Press: Spokesperson + legal review

Playbooks (Phishing, Malware Execution, Ransomware)
- Each with triggers, triage, containment steps, artefact collection, comms

---

## Technology Preparation (Task 4)

Windows: Confirm PowerShell v5
$PSVersionTable.PSVersion

Enable Sysmon
.\Sysmon64.exe -accepteula -i .\Sysmon\sysmon-config.xml

Audit Policy (baseline)
auditpol /get /category:*
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System\Audit" /v ProcessCreationIncludeCmdLine_Enabled /t REG_DWORD /d 1 /f

Windows Event Forwarding (Collector)
wecutil qc

Ensure WinRM enabled on endpoints
winrm quickconfig

SIEM Onboarding Checklist
- Forward Security, Sysmon, PowerShell, TaskScheduler, Application logs
- Normalize hostnames, time sync (NTP)
- Alerts for: new admin user, unsigned PowerShell, LOLBins, WMI process spawn

Linux Logging (baseline)
- auditd rules for auth, kernel mods, file watches
- Sysmon for Linux or osquery for telemetry
- Forward logs via rsyslog/syslog-ng/Vector/Fluent Bit

EDR Readiness
- Deployment coverage, tamper protection, isolation test, API integration

---

## Visibility (Task 5)

Logging Matrix (sample)

Data Source | Critical? | Retention | In SIEM | Notes
Windows Security | Yes | 180d | Yes | 4624/4625/4672/4688/4769
Sysmon | Yes | 180d | Yes | Proc, netconn, image loads
O365 Audit | Yes | 180d | Yes | Sign-in, mailbox, DLP
EDR Telemetry | Yes | 365d | Yes | Raw + alerts

KPIs
- MTTD, MTTC, MTTR
- Detection coverage vs ATT&CK
- % endpoints with Sysmon/EDR
- % critical assets onboarded to SIEM

---

## Triage Snippets

Windows Sysmon process creation
Get-WinEvent -FilterHashtable @{LogName="Microsoft-Windows-Sysmon/Operational"; Id=1} | Select TimeCreated, @{n="Image";e={$_.Properties[5].Value}}, @{n="CommandLine";e={$_.Properties[10].Value}}

Local admin discovery
Get-LocalGroupMember -Group "Administrators"

Windows network connections
Get-NetTCPConnection | Sort-Object -Property State

Linux triage
last -a
journalctl -xe
ss -tupan
ps auxf

---

## TryHackMe Room Mapping

Task 1 — Introduction: Rationale for IR and SSF scenario
Task 2 — IR Capability: Policy, plan, authority, reporting
Task 3 — People & Documentation: Roles, comms, playbooks
Task 4 — Technology Preparation: Logging, WEF/Sysmon, SIEM, EDR
Task 5 — Visibility: Baselines, asset inventory, logging matrix
Task 6 — Conclusion: Maturity steps & next actions

---

## Screenshots
![Room Completion](https://github.com/MayankQuery/tryhackme-writeups/blob/main/incident-response-preparation/images/incident-response-preparation-completion.png)
![Room Practice](https://github.com/MayankQuery/tryhackme-writeups/blob/main/incident-response-preparation/images/incident-response-preparation-practice.png)

---

## Short Notes

IR-Policy.md
Purpose: Define framework enabling SSF to detect, contain, recover
Scope: All users, endpoints, servers, cloud workloads, SaaS
Authority: IR Lead authorized to isolate assets, disable accounts
Principles: Preserve evidence, communicate early and accurately
Review: Annually or post-major incident

Windows-Logging-Baseline.md
- PowerShell v5+
- Enable Script Block Logging & Module Logging
- Deploy Sysmon with enterprise config
- Forward Security, Sysmon, PowerShell, TaskScheduler, Application logs
- Ensure time sync, hostnames, asset tags

---

## Disclaimer

This repository is for educational use aligned with the TryHackMe room. Adapt to your organization’s policies, legal requirements, and risk appetite.
