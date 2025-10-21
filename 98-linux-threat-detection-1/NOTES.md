# Linux Threat Detection 1 — Notes & Walkthrough

## 1) Room summary
This room simulates realistic Linux initial access scenarios. You will examine logs and process hierarchies to identify how attackers gained access and what they executed. Focus on SSH-based access, discovery of internet-exposed services, and using process trees to find the root cause.

---

## 2) Important log locations
- **/var/log/auth.log** (Debian/Ubuntu) — authentication events (SSH logins, sudo).
- **/var/log/syslog** — system messages.
- **journalctl** — systemd journal (useful if syslog is not present).
- **/var/log/messages** (RHEL/CentOS).
- **/var/log/audit/audit.log** — auditd events (process execs, file access) if auditd enabled.
- **/var/log/nginx/access.log / error.log** or **/var/log/apache2/** — web service requests.
- **process list / procfs** — `ps`, `/proc/<pid>/cmdline`, `pstree`.

---

## 3) Common Initial Access techniques covered
- **SSH brute force / credential stuffing** — repeated failed logins, followed by a success.
- **Compromised credentials** — valid login from unexpected IP.
- **Exploitation of internet-exposed services** — unexpected reverse shells or dropped scripts.
- **Service misconfiguration** allowing local privilege escalation (covered conceptually).

---

## 4) Detection signals & indicators
- High volume of `sshd` failed logins in a short window (many `Failed password` entries).
- Successful login from unusual IP or at odd hours (check `Accepted password`/`Accepted publickey`).
- New, unexpected processes spawned by `sshd` or `www-data` like `nc`, `bash -i`, `python -c`, `perl`, `curl | sh`.
- Process trees showing `sshd` → `bash` → `nc`/`python` or `sshd` → `sudo` → suspicious commands.
- New cron entries or modified system files.
- `auditd` showing `execve` syscall for suspicious binaries.
- Outbound connections to C2 IPs (`ss -tunp`, `netstat -tnp`, `tcpdump`).

---

## 5) Investigation workflow (high level)
1. **Confirm alerts** — review auth.log and journalctl for authentication events.
2. **Timeline** — note timestamps of failed and successful attempts.
3. **Identify session** — map PID of `sshd` sessions to processes and commands.
4. **Process tree analysis** — use `pstree -p` and `ps -ef --forest` to find children spawned by the session.
5. **Log correlation** — check web server logs, auth logs, sudo logs, and audit logs for correlating evidence.
6. **Contain & remediate** — kill malicious processes, revoke keys, rotate credentials, and patch vulnerabilities.

---

## 6) Example investigation notes (fill with lab outputs)
- `2025-10-01T12:03:12Z` — multiple `Failed password` for `ubuntu` from `203.0.113.45`
- `2025-10-01T12:07:41Z` — `Accepted password` for `ubuntu` from `203.0.113.45`
- PID `3124` corresponds to an ssh session that spawned `/bin/bash` then `/usr/bin/python3 -c '...'` — suspicious reverse shell.
- `auditd` shows `execve` for `/tmp/.xyz` by PID `3124`.

---

## 7) Containment & remediation (lab-level)
- Immediately block the offending IP at the firewall (or simulate).
- Kill the malicious PID and any descendant processes: `pkill -P <pid>` or `kill -9`.
- Revoke the compromised credential (disable user or rotate passwords/keys).
- Inspect system for persistence (cron, systemd units, startup scripts).
- Collect forensic evidence (copy logs, dump memory if needed) before remediation.

---

## 8) MITRE ATT&CK mappings (quick)
- Initial Access: **Valid Accounts (T1078)**
- Execution: **Command and Scripting Interpreter (T1059)**
- Persistence: **Modify system binaries / cron (T1543 / T1053)**
- Exfil & C2: **Connection to external host (T1041)**

