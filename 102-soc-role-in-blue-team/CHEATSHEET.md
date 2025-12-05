# SOC Role in Blue Team — Cheatsheet

## SOC Tier Summary
- **L1 Analyst:** Alert triage, initial investigation, escalate.  
- **L2 Analyst:** Deep investigation, containment guidance, validation.  
- **L3 / Threat Hunter:** Proactive hunts, detection engineering, advanced IR.  
- **SOC Manager:** Operations, KPIs, resourcing.

---

## Quick Tools & Commands
### SIEM
- Search examples: `source=windows EventID=4625 | stats count by src_ip`
- Common investigations: failed logins, suspicious process creation, unusual authentication.

### EDR
- Check process list, command-line args.  
- Query: list recent child processes of `explorer.exe` or `svchost.exe`.

### Network
- `tcpdump -nn -s0 -c 200 host 10.10.10.5`  
- `zeek -r capture.pcap` → analyze `conn.log`, `http.log`, `dns.log`.

---

## Triage Checklist (L1)
1. Read SIEM alert & severity.  
2. Capture basic context: username, src IP, timestamp, asset owner.  
3. Check related logs (auth, syslog, firewall).  
4. Determine if false positive or escalate.  
5. Document in ticket: actions taken & evidence.

---

## Investigation Steps (L2)
1. Correlate alerts across sources.  
2. Retrieve EDR data & process tree.  
3. Query network flows for C2/beaconing.  
4. Identify persistence or lateral movement.  
5. Contain: isolate host / block IPs / revoke credentials.

---

## Threat Hunting Ideas (L3)
- Hunt for unusual scheduled tasks / services.  
- Hunt for rare parent-child process combinations.  
- Look for persistent outbound connections (beaconing).  
- Search for living-off-the-land binaries (LOLbins).

---

## Common Log Sources
- Windows: Security event log (Event IDs 4624, 4625, 4688)  
- Linux: /var/log/auth.log, syslog, auditd  
- Network: firewall logs, proxy logs, NetFlow  
- Clouds: CloudTrail, Cloud IDS logs

---

## Soft Skills
- Clear written communication for tickets & handoffs.  
- Ability to manage stress & prioritize.  
- Team collaboration and knowledge sharing.

---

## Career Tips
- Build a lab and practice SIEM/EDR workflows.  
- Document every incident as a case study.  
- Contribute to runbook creation.  
- Learn scripting (Python, Bash) to automate repetitive tasks.
