# Cactus — Notes & Commands

## Lab basics
- Target IP: `MACHINE_IP` (replace with machine IP shown in TryHackMe)
- Credentials (if needed): `user:tryhackme`

---

## Quick enumeration
```bash
# Host discovery & TCP port scan (recommended)
nmap -sC -sV -p- -T4 MACHINE_IP

# Focused web scan
nmap -p 80,443 --script http-enum,http-title MACHINE_IP

# Web application directory brute force (example)
gobuster dir -u http://MACHINE_IP/ -w /usr/share/wordlists/dirb/common.txt -t 50
```
## Observations:

- Port 80 running a web service (Cacti web UI)

- Port 22 (SSH) open

- Kibana / Elastic (port 5601) available for SIEM tasks

## Web reconnaissance

- Open http://MACHINE_IP in browser. Inspect login form, visible endpoints.

- Look for default pages, backup files, upload fields or unusual parameters.

- Check robots.txt, favicon.ico, login.php, index.php, /graph_view.php, or similar Cacti endpoints.

## Exploitation (high-level overview)

- Vulnerability class: Authentication bypass + Command injection / RCE in Cacti prior to 1.2.3 (CVE-2022-46169).

- Approach in lab:

- Identify input vector that the application does not properly sanitize (e.g., a parameter used by internal shell commands or system calls).

- Use authentication bypass to access admin or privileged pages without valid credentials.

- Demonstrate command injection conceptually in a controlled environment (the lab supplies a vulnerable instance to practice).

- Note: This file intentionally avoids posting exploit payloads. Follow TryHackMe’s in-room hints/AttackBox for exact techniques.

## Detection & logs

- Kibana is available on port 5601. Use it to:

- Search application logs for suspicious requests (unexpected parameters, long query strings)

- Look for spikes in request frequency or unusual user-agents

- Identify commands executed via the web app (if logged)

- Example Kibana queries (conceptual):
```bash
http.request.method: "POST" AND url.path: "/some_vulnerable_endpoint"
```
## Post-exploitation (conceptual)

- If you successfully demonstrate RCE in lab, enumerate local files and look for:
```bash
/etc/passwd, /home/*/.ssh/authorized_keys
```
- Sensitive application configs (db credentials, config.php)

- Document evidence and clear any temporary artifacts (in a lab: leave machine state as-is for instructor grading).

## Mitigation notes

- Upgrade Cacti to >= 1.2.3 (or vendor-released patch).

- Apply least-privilege for the web process and avoid running services as root.

- Input validation and output encoding; sanitize all user-supplied input.

- WAF rules to block suspicious payload patterns.

- Monitor logs for anomalous commands, long parameter lengths, or unexpected GET/POST activity.

---
