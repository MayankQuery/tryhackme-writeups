# Task 1 – Introduction

## Summary
Understanding **processes, services, and cronjobs** is essential for detecting attacker persistence in Linux systems.  
Malicious actors often hide persistence through processes, scheduled tasks, or backdoored services.

## Pre-requisites
- Linux Fundamentals (Parts 1–3)  
- Linux File System Analysis  
- Linux System Hardening  

## Objectives
- Learn live forensic analysis techniques for Linux.  
- Detect suspicious processes and services.  
- Investigate cronjobs and autostart scripts.  
- Hunt for malicious persistence methods.  

---

# Task 2 – Investigation Setup

- Deployed the target VM and connected via AttackBox.  
- Collected baseline information about the Linux environment:  
```bash
uname -a
lsb_release -a
whoami
id
```

- Ensured root privileges were available for deeper inspection.

---

# Task 3 – Processes (Commands Used)

## Process Analysis
```bash
ps aux
top -o %CPU
htop
pstree -p
```

## Identifying Malicious Indicators

- Look for unusual parent-child relationships.

- Processes running from /tmp, /dev/shm, or user-writable directories.

- High resource usage from unknown binaries.

## Processes (Findings)

- Identified suspicious process `nc -lvnp 4444` running as root.  
- Process parent traced to `/bin/bash`, likely from attacker’s reverse shell.  
- Persistence attempt observed via a backgrounded process hidden in `/dev/shm/`.  

---

# Task 4 – Cronjobs (Commands Used)

```bash
crontab -l
cat /etc/crontab
ls -alh /etc/cron.*
```

## Cronjobs (Findings)

- Found malicious cronjob executing every minute:  

- /tmp/.malicious.sh

- This script re-established attacker persistence by spawning a reverse shell.  

---

# Task 5 – Services (Commands Used)

```bash
systemctl list-units --type=service
systemctl status <service>
service --status-all
```

## Services (Findings)

- Discovered rogue service `backdoor.service`.  
- Config pointed to executable in `/usr/local/bin/backdoor`.  
- Service was enabled on boot, persistence confirmed.  

---

# Task 6 – Autostart Scripts (Commands Used)

Checked common autostart locations:
```bash
ls -alh ~/.config/autostart/
ls -alh /etc/init.d/
ls -alh /etc/systemd/system/
```

## Autostart Scripts (Findings)

- Found suspicious autostart entry:  

- ~/.config/autostart/.evil.desktop

- This ensured malicious binary was executed every time a user logged in.  

---

# Task 7 – Application Artefacts (Commands Used)

Analyzed logs and application configs:
```bash
cat ~/.bash_history
cat /var/log/auth.log
cat /var/log/apache2/access.log
```

---

## Application Artefacts (Findings)

- `.bash_history` revealed attacker used `wget` to download malicious files.  
- `auth.log` showed repeated SSH brute force attempts from `192.168.1.100`.  
- Apache logs showed suspicious requests exploiting a file upload vulnerability.  

---

# Task 8 – Conclusion

## Summary
This room demonstrated how attackers can persist in Linux environments using:
- Malicious processes.
- Cronjobs for scheduled persistence.
- Rogue services and autostart scripts.
- Application artefacts (logs, histories).

## Key Learnings
- Always verify process parent-child relationships.  
- Inspect cronjobs, services, and autostart mechanisms for persistence.  
- Review logs for attacker activities and IOC discovery.  

Skills gained here are directly applicable to **Linux Incident Response and Forensic Analysis**.  
