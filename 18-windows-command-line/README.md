# TryHackMe – Windows Command Line

This repository documents my learnings and key commands from completing the **Windows Command Line** room on [TryHackMe](https://tryhackme.com/room/windowscommandline).

## About the Room
The Windows Command Line room introduces fundamental Windows commands that are essential for cybersecurity and IT professionals. Key topics covered include:
- Basic System Information
- Network Troubleshooting
- File and Disk Management
- Task and Process Management

## Key Learnings

### 1. Basic System Information
- `systeminfo` – Displays detailed system configuration.
- `hostname` – Shows the device hostname.
- `whoami` – Displays the current logged-in user.
- `set` – Shows environment variables.

### 2. Network Troubleshooting
- `ipconfig` – Displays network configurations.
- `ping <host>` – Tests network connectivity.
- `tracert <host>` – Traces the route packets take to reach the host.
- `netstat -an` – Displays active network connections.

### 3. File and Disk Management
- `dir` – Lists files and directories.
- `copy <source> <destination>` – Copies files.
- `move <source> <destination>` – Moves files.
- `del <file>` – Deletes files.
- `diskpart` – Manages disks and partitions.

### 4. Task and Process Management
- `tasklist` – Lists all running processes.
- `taskkill /PID <id>` – Kills a process by its PID.
- `shutdown /r /t 0` – Restarts the system immediately.

---

## commands.txt
A `commands.txt` file in this repository provides 30+ commonly used Windows commands with syntax and examples.

---

## Why This Matters
Windows command-line knowledge is essential for:
- Security assessments
- Incident response
- Forensics and troubleshooting

---

## Certificate of Completion
Completed with **100% progress** on TryHackMe.
![Room Completion](https://github.com/MayankQuery/tryhackme-writeups/blob/main/windows-command-line/images/windows-command-line-completion.png)
![Room Practice](https://github.com/MayankQuery/tryhackme-writeups/blob/main/windows-command-line/images/windows-command-line-practice.png)

---

## Resources
- [TryHackMe – Windows Command Line Room](https://tryhackme.com/room/windowscommandline)
