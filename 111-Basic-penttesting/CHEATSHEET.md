# Basic Pentesting – Cheatsheet

---

## 🔍 Port Scanning

```bash
nmap -sC -sV <target-ip>
```
🌐 Directory Enumeration
```bash
gobuster dir -u http://<target-ip> -w /usr/share/wordlists/dirb/common.txt
```
🔐 Brute Forcing (SSH)
```bash
hydra -l jan -P passwords.txt ssh://<target-ip>
```
🔑 SSH Access
```bash
ssh jan@<target-ip>
```
👤 User Enumeration
```bash
cat /etc/passwd
```
⬆️ Privilege Escalation
Check sudo permissions
```bash
sudo -l
```
Enumerate files and scripts owned by other users
```bash
find / -user kay 2>/dev/null
```

---
