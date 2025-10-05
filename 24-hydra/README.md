# TryHackMe - Hydra Room

> Hands-on offensive security challenge from TryHackMe's Cyber Security 101 module focusing on brute-force attacks using THC-Hydra.

---

## What is Hydra?

Hydra is a powerful and fast brute-force tool used to crack login credentials for various network services such as SSH, FTP, HTTP POST forms, RDP, and more.

It supports multiple protocols and uses wordlists to automate password guessing attacks.

---

## Learning Objectives

- Understand brute-force concepts and attack vectors
- Use Hydra CLI effectively for different services
- Identify weak/default credentials
- Learn the importance of strong passwords in authentication security

---

## Tools & Environment

- **Platform**: TryHackMe AttackBox / Kali Linux
- **Tool**: THC-Hydra
- **Target IP**: `10.10.158.79`
- **Protocols Used**: HTTP POST, FTP, SSH

---

## Tasks Performed

1. Explored Hydra syntax and supported protocols
2. Brute-forced a login form using HTTP-POST parameters
3. Identified valid credentials from a wordlist
4. Understood attack mitigation strategies and real-world risks

---

## Screenshot
![Room Completion](https://github.com/MayankQuery/tryhackme-writeups/blob/main/hydra/images/hydra-completion.png)
![Room Practice](https://github.com/MayankQuery/tryhackme-writeups/blob/main/hydra/images/hydra-practice.png)

---

## 🔍 Sample Commands Used

```bash
# Example: HTTP POST form brute-force
hydra -l admin -P /usr/share/wordlists/rockyou.txt 10.10.158.79 http-post-form "/login:username=^USER^&password=^PASS^:F=Invalid"

# Example: SSH brute-force
hydra -l root -P passwords.txt ssh://10.10.158.79
