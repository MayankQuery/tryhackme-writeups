# Tasks & Suggested Answers — AD: Basic Enumeration

> Paste these suggested answers into the TryHackMe task boxes (edit as you like).

## Task 1 — Introduction
**Q:** I am ready to begin exploring unauthenticated enumeration.  
**Suggested answer:**  
Ready to start unauthenticated enumeration (confirming network connectivity and AttackBox/VPN availability).

---

## Task 2 — Mapping Out the Network
**Q:** What IP/subnet do you see in your routing table that indicates connectivity to the lab?  
**Suggested answer (example):**  
10.211.11.0/24

*(Run `ip route` or `route` to confirm the exact subnet shown by your AttackBox.)*

---

## Task 3 — Network Enumeration with SMB
**Q:** Name one SMB share or resource discovered on the target (provide the share name or a file you found).  
**Suggested answer (example):**  
`ShareName` or `Public` (replace with the actual share you discovered using `smbclient -L` or `enum4linux`).

---

## Task 4 — Domain Enumeration
**Q:** Provide the domain name or one domain user you enumerated.  
**Suggested answer (example):**  
Domain: `jr-pentester.local`  
User: `svc_backup` *(replace with actual domain and username found using enum tools)*

---

## Task 5 — Password Spraying
**Q:** Describe the safe approach you used for password spraying and any account you validated.  
**Suggested answer (example):**  
I used a single common password (`Summer2024`) across a list of domain users with `crackmapexec` while respecting lockout thresholds and waiting between attempts. I verified one valid account `user.jane` that allowed SMB login (used only in the lab for further enumeration).

---

## Task 6 — Conclusion
**Q:** Summarize what initial access vector you found and the next steps you would take.  
**Suggested answer (example):**  
Initial access was obtained via password spraying using a weak password on a valid domain account. Next steps: use the account to access SMB shares, search for credentials/configuration files, escalate privileges via vulnerable services or misconfigurations, and map domain trusts with BloodHound (in a controlled lab).

---

## Extra — Evidence text (for report)
**Suggested answer (example):**  
`enum4linux` revealed multiple domain users and accessible SMB shares. Password spraying with `crackmapexec` using a conservative password list returned valid credentials for user `user.jane`. Using those credentials, I accessed `\\10.201.127.21\Backups` and found a configuration file containing a second set of credentials.
