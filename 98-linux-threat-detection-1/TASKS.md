## Task 1 — Introduction
**Q:** I'm ready to start!  
**A:** (No answer needed)

---

## Task 2 — Initial Access via SSH
**How would an attacker commonly gain initial access via SSH and how would you detect it?**

### **Answer (sample):**
- Common techniques:
  - Brute-force/credential stuffing (many failed password attempts).
  - Use of leaked credentials or weak passwords (single successful login).
  - Public key abuse (adding a malicious public key to `~/.ssh/authorized_keys`).
- Detection methods:
  - Check `/var/log/auth.log` for many `Failed password` entries followed by `Accepted password` from the same IP.
  - Alert on `Accepted` from unusual geolocation or IP ranges.
  - Monitor for new `authorized_keys` changes.
  - Correlate with `ss -tunp` to see if a suspicious session has opened outbound connections.

### **Example commands:**
```bash
sudo grep "Failed password" /var/log/auth.log | tail -n 50
sudo grep "Accepted" /var/log/auth.log | tail -n 50
sudo tail -n 200 /var/log/auth.log
```
## Task 3 — Detecting SSH Attacks
Q: What logs / artifacts would you examine to investigate an SSH-based compromise?**

### Answer (sample):

- /var/log/auth.log (login attempts, sshd events).

- journalctl -u ssh (for systemd-journald systems).

- Process tree of the sshd session (pstree -p <sshd_pid>).

- auditd exec events to see binaries executed after login (ausearch -m EXECVE).

- Network connections (ss -tunp) to find outbound C2.

### Investigation snippet:
```bash 
# find suspicious IP
sudo grep "203.0.113.45" /var/log/auth.log

# map to PID
sudo ps -ef | grep <sshd_pid>
pstree -p <sshd_pid>
sudo ausearch -m EXECVE -ts 2025-10-01T12:00:00 -te 2025-10-01T12:30:00
```
## Task 4 — Initial Access via Services
Q: How can internet-exposed services produce initial access, and how to detect?**

### Answer (sample):

- Services (HTTP, FTP, RDP, custom apps) may have vulnerabilities that allow remote code execution (RCE), file upload, or authentication bypass.

- Detection:

- Unusual HTTP POSTs or file uploads in web logs (/var/log/nginx/access.log).

- New files in /tmp or webroot (/var/www/html) with executed permissions.

- Unexpected processes spawned by the web server user (e.g., www-data → bash → reverse shell).

- Sudden configuration or binary changes.

### Commands:
```bash
sudo tail -n 200 /var/log/nginx/access.log
sudo find /var/www -type f -mtime -1 -ls
ps aux | grep www-data
```
## Task 5 — Detecting Service Breach
Q: If a service is suspected breached, what steps do you take to identify root cause and scope?**

### Answer (sample):

- Identify the initial request that triggered compromise (web logs).

- Identify user and PID responsible (ps, pstree).

- Check for persistence mechanisms (cron, systemd units, startup scripts).

- Search for web shells or uploaded scripts in webroot.

- Correlate auditd and auth logs for later activity.

- Contain (block IP, stop service) and collect evidence before full remediation.

### Example commands:
```bash
sudo grep "POST" /var/log/nginx/access.log | tail -n 100
sudo find /var/www -type f -name "*.php" -mtime -7 -ls
pstree -p $(pgrep -f 'nginx' | head -n1)
sudo ausearch -m EXECVE -i --start recent
```
## Task 6 — Advanced Initial Access
Q: How to use process-tree analysis to trace the origin of an attacker-run process?**

### Answer (sample):

- Use pstree -p <pid> or ps aux --forest to view parent-child relationships.

- Map the child process back to the login session (sshd PID) or to the web server worker (e.g., www-data).

- Check /proc/<pid>/cmdline and /proc/<pid>/cwd for filepaths and executed commands.

- Use lsof -p <pid> to list open files and network sockets.

### Commands:
```bash
pstree -p <suspicious_pid>
cat /proc/<pid>/cmdline
ls -l /proc/<pid>/cwd
sudo lsof -p <pid>
```
## Task 7 — Conclusion
### Summary (sample):

- The lab teaches practical detection techniques for common Linux initial access vectors.

- Key detections: watch auth logs for suspicious login patterns, use process trees to trace suspicious binaries, and correlate syslog/journal/auditd for complete timelines.

- Containment steps should be executed once evidence is collected: block malicious IPs, kill process trees, remove persistence, rotate credentials, and perform root-cause analysis.

## Appendix — Quick remediation checklist
- Block offending IP(s) at firewall.

- Kill malicious processes and descendant processes.

- Remove web shells and suspicious files.

- Rotate compromised credentials and SSH keys.

- Rebuild compromised hosts if integrity is in doubt.
