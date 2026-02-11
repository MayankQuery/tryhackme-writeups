# Notes – Windows Logging for SOC

---

## 🔹 Why Windows Logging Matters

- Primary data source for SOC analysts
- Enables:
  - Alert triage
  - Incident response
  - Threat hunting
- Essential for DFIR investigations

---

## 🔹 What Is Logged in Windows

Windows logs activity related to:
- Authentication
- Authorization
- Process execution
- File changes
- Network connections
- PowerShell activity

---

## 🔹 Security Event Logs

### Authentication Events
- Logon success and failure
- Brute-force detection
- Lateral movement indicators

### User Management Events
- User creation and deletion
- Group membership changes
- Privilege escalation attempts

---

## 🔹 Sysmon Overview

Sysmon enhances default Windows logging by providing:
- Detailed process creation logs
- File creation and deletion
- Network connections
- Registry activity

---

## 🔹 PowerShell Logging

- Captures executed commands and scripts
- Useful for detecting:
  - Living-off-the-land attacks
  - Obfuscated payloads
  - Malicious automation

---

## 🧠 Key Takeaway

Understanding Windows logs is foundational for detecting threats and responding effectively in a SOC environment.
