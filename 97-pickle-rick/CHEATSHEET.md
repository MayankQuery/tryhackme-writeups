# ⚔️ TryHackMe Pickle Rick — Cheatsheet

### 🔍 Enumeration
```bash
nmap -A -T4 -v <TARGET_IP>
gobuster dir -u http://<TARGET_IP> -x php,html,css,js,txt,pdf -w /usr/share/wordlists/dirb/common.txt
```
🧠 Credentials
```makefile
Username: R1ckRul3s
Password: Wubbalubbadubdub
```
💻 Useful Commands
```bash
ls -a
strings <file>
grep . <file>
tac <file>
sudo -l
sudo cat /root/3rd.txt
```
🧩 Flags
#	Flag	Location
1	mr. meeseek hair	Sup3rPickl3Ingred.txt
2	1 jerry tear	/home/rick/second\ ingredients
3	fleeb juice	/root/3rd.txt

---
