# Notes – Outlook NTLM Leak (CVE-2023-23397)

---

## 🔹 What is NTLM?

NTLM (NT LAN Manager) is a Windows authentication protocol that uses challenge-response mechanisms.

Key point:
- NTLM authentication leaks hashes when connecting to remote resources

---

## 🔥 CVE-2023-23397 Overview

- **Type:** Credential Leak (Zero-click)
- **Impact:** Net-NTLMv2 hash disclosure
- **Trigger:** Malicious Outlook reminder
- **User Interaction:** None required
- **Severity:** Critical

---

## 🧨 Why This Vulnerability Is Dangerous

- Exploited when email is received
- No click, no preview required
- Works as long as Outlook desktop app is running
- Hashes can be relayed or cracked offline

---

## 🧪 Attack Vector

- Attacker sends a malicious calendar appointment
- Reminder sound points to an attacker-controlled SMB share
- Outlook attempts NTLM authentication
- Net-NTLMv2 hash is leaked

---

## 🛡️ Not Affected

- Outlook Web App (OWA)
- Microsoft 365 Web
- Systems without NTLM authentication

---

## 🎯 Real-World Impact

- Credential theft
- Lateral movement
- Privilege escalation
- Domain compromise
