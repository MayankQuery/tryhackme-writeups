# Cactus — Cheatsheet (Quick reference)

## CVE summary
- **CVE:** CVE-2022-46169  
- **Affected:** Cacti < 1.2.3  
- **Severity:** High (CVSS reported 9.8)  
- **Class:** Authentication bypass + command injection / RCE

---

## Useful commands (safe / non-exploit)
```bash
# Basic port scan
nmap -sC -sV -p- MACHINE_IP

# Service-specific
nmap -p 22,80,5601 -sV MACHINE_IP

# Web directory enumeration
gobuster dir -u http://MACHINE_IP/ -w /usr/share/wordlists/dirb/common.txt

# Simple curl request to inspect HTTP response headers
curl -I http://MACHINE_IP/
```
## Detection snippets (Kibana / SIEM)
- Look for suspicious requests:
```pgsql
http.request.method: "POST" AND http.request.body: "*;*"
```
- Look for long/encoded payloads:

```javascript
http.request.body: /%[0-9A-Fa-f]{2}/ OR http.request.body: /base64/
```
- Unusual user-agent spikes:

```arduino 
user_agent.keyword: "python-requests/*" OR user_agent.keyword: "curl/*"
```
These are starting points. Tailor patterns to your logs.

## Hardening checklist
- Update/patch Cacti to latest release.

- Restrict access to Cacti UI via VPN or firewall rules.

- Run web services with minimal privileges.

- Enable logging and forward to centralized SIEM.

- Implement WAF rules for suspicious parameter patterns.

## Reporting / Write-up tips
- Always include:

- Steps to reproduce (high-level)

- Evidence (screenshots, log entries)

- Impact (what a real attacker could achieve)

- Remediation steps

- Avoid posting exploit code in public reports.

---
