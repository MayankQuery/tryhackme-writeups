# TryHackMe — Intro to Detection Engineering (SOC Level 2)

- **Room:** Intro to Detection Engineering
- **Track:** SOC Level 2 → Detection Engineering
- **Difficulty:** Easy
- **Est. Time:** 60 min
- **Status:** Room completed (100%)
- **Users in Room:** 23,579
- **Created:** \~802 days ago
- **Copyright:** © TryHackMe 2018–2025

---

## Repo Purpose

A structured write‑up of the TryHackMe room **Intro to Detection Engineering**, including:

* Task‑by‑task notes & learnings
* Example **ADS Framework artifacts** (PowerShell unusual host & Privileged Group changes)
* Lab validation steps
* Detection content (Sigma, SPL, KQL)
* Reflection for SOC Level 2 skill growth

---

## Room Link

* **TryHackMe → Intro to Detection Engineering**: *(insert room link here)*

---

## What You’ll Learn

* What **Detection Engineering** is and why it matters
* Frameworks for designing effective detections
* How to structure detections with **ADS (Attack Detection Strategy)**
* Hands‑on scenario: detecting changes to **Active Directory privileged groups**

---

## Tasks & Notes

### Task 1 — Introduction

Detection engineering is the structured process of designing, validating, and maintaining security detections.

### Task 2 — What is Detection Engineering?

It combines threat intel, telemetry understanding, and security analytics to reliably detect adversary behavior.

### Task 3 — Detection Engineering Methodologies

Lifecycle: **Hypothesis → Instrumentation → Author → Validate → Deploy → Measure → Iterate.**

### Task 4 — Detection Engineering Frameworks 1

Frameworks like **ADS** ensure repeatable, structured detections.

### Task 5 — Detection Engineering Frameworks 2

Helps categorize detections, identify blind spots, map to ATT\&CK, and plan response.

### Task 6 — Detection Detective

**Scenario:** Detect changes to *privileged and administrative groups/accounts* in AD.
Approach: Leverage Windows security logs (47xx series), focus on critical groups, enrich alerts with context, validate via lab.

---

## Screenshot
![Room Completion](https://github.com/MayankQuery/tryhackme-writeups/blob/main/intro-to-detection-engineering/images/intro-to-detection-engineering-completion.png)
![Room Practice]()

---

## ADS Framework Examples

### Unusual PowerShell Host Process

**Goal:** Detect when PowerShell loads in unusual host processes.
**Category:** Execution / PowerShell
**Strategy:** Monitor module loads, detect unusual DLL host processes.
**Context:** PowerShell DLL can be injected into non-native processes → attacker OPSEC tactic.
**Validation:** Run sample commands provided in room.
**Response:** Compare to whitelist, validate signatures, analyze binary behavior.

### Privileged Group Membership Changes

**Goal:** Detect changes to privileged groups/accounts in AD.
**Category:** Privilege Escalation / Account Manipulation
**Events:** 4728/4729 (Global), 4732/4733 (Domain Local), 4756/4757 (Universal).
**Groups:** Domain Admins, Enterprise Admins, Schema Admins, etc.
**Validation:** Add/remove test account → verify logs/alerts.
**Response:** Confirm with change tickets; if unauthorized → revert, investigate, and hunt.

---

## Validation

Lab test steps:

```powershell
# Copy powershell.exe to unusual host
Copy-Item C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -Destination C:\windows\temp\unusual-test.exe -Force

# Execute unusual PowerShell host
Start-Process C:\windows\temp\unusual-test.exe -ArgumentList '-NoProfile','-NonInteractive','-Windowstyle Hidden','-Command {Get-Date}'

# Clean up
Remove-Item 'C:\windows\temp\unusual-test.exe' -Force -ErrorAction SilentlyContinue
```

And AD group change validation with a test user:

```powershell
New-ADUser -Name "thm.test" -SamAccountName thm.test -AccountPassword (ConvertTo-SecureString "TempPass1!" -AsPlainText -Force) -Enabled $true
Add-ADGroupMember -Identity "Domain Admins" -Members thm.test
Remove-ADGroupMember -Identity "Domain Admins" -Members thm.test -Confirm:$false
```

---

## Flag

```
THM{Sup3r-D3t3ct1v3}
```

---

## Reflection

This room was valuable for bridging **theory → practice**. The **ADS template** is key for consistent detections. Hands‑on exercises reinforced how to:

* Translate threat scenarios into queries
* Validate in a lab before production
* Account for blind spots & false positives

---
