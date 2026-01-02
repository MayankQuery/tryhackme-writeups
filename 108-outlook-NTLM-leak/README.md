# Outlook NTLM Leak – CVE-2023-23397

This repository documents my hands-on completion of the TryHackMe room **Outlook NTLM Leak**, which focuses on abusing **CVE-2023-23397**, a critical zero-click vulnerability in Microsoft Outlook that allows attackers to leak Net-NTLMv2 password hashes.

---

## 🧠 Room Information

- **Platform:** TryHackMe
- **Room Name:** Outlook NTLM Leak
- **Vulnerability:** CVE-2023-23397
- **Duration:** ~45 minutes
- **Difficulty:** Learn
- **Attack Type:** Credential Leak (Zero-click)
- **Affected Software:** Microsoft Outlook Desktop (Windows)

---

## 🎯 Learning Objectives

- Understand how NTLM authentication works
- Learn how CVE-2023-23397 is exploited
- Abuse Outlook appointment reminders to leak hashes
- Capture Net-NTLMv2 hashes using an attacker-controlled server
- Understand detection and mitigation strategies

---

## 🛠️ Tools Used

- AttackBox
- Responder / SMB listener
- Microsoft Outlook (Desktop)
- Windows VM
- NTLM authentication concepts

---

## 📂 Repository Contents

| File | Description |
|-----|------------|
| README.md | Room overview |
| NOTES.md | Vulnerability theory and background |
| CHEATSHEET.md | Commands and exploitation workflow |
| TASKS.md | Task-by-task walkthrough summary |

---

## ✅ Status

- Room completed: **100%**
- Vulnerability successfully exploited in lab environment

---

## ⚠️ Disclaimer

This repository is for **educational purposes only**.  
Do not attempt exploitation on systems without explicit authorization.
