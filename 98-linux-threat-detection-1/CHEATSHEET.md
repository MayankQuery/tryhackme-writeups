## Quick log checks
```bash
# Debian/Ubuntu auth log
sudo tail -n 200 /var/log/auth.log

# Use journalctl (systemd)
sudo journalctl -u ssh -S "2025-01-01" --no-pager

# Generic system logs
sudo tail -n 200 /var/log/syslog
```
## Find SSH failures / successes
```bash
# Failed attempts
sudo grep "Failed password" /var/log/auth.log | tail -n 50

# Successful logins
sudo grep "Accepted" /var/log/auth.log | tail -n 50
```

## Timeline of events (quick)
```bash
# filter by IP or user
sudo grep "203.0.113.45" /var/log/auth.log
sudo grep "ubuntu" /var/log/auth.log
```
## Map sshd session -> child processes
```bash
# find sshd sessions and PIDs
ps aux | grep sshd

# show tree for a PID
pstree -p <sshd_pid>

# or show forested ps
ps aux --forest | less
```
## Check open network connections / outbound
```bash
# show established connections with process name
ss -tunp | head -n 50
# or
netstat -tunp
```
## Use auditd to find executed binaries (if auditd running)
```bash
# search for execve events for a time window
sudo ausearch -m EXECVE -ts 2025-10-01T12:00:00 -te 2025-10-01T12:30:00

# pretty print ausearch output
sudo ausearch -m EXECVE -i -ts recent
```
## Inspect suspicious files
```bash
# show file type and strings
file /tmp/suspicious && strings -n 4 /tmp/suspicious | head

# check file permissions & owner
ls -l /tmp/suspicious
```
## Kill malicious process tree
```bash
# kill parent then children
sudo pkill -P <parent_pid>
sudo kill -9 <parent_pid>
```
## Check cron / systemd persistence
```bash
# user crontab
crontab -l -u ubuntu

# system cron directories
ls -la /etc/cron.* /var/spool/cron/crontabs

# systemd units (look for user units)
systemctl list-units --type=service --all
```
## Evidence collection tips
- Copy logs /var/log/auth.log, /var/log/syslog, journalctl output.

- List installed packages recently modified: ls -lt /usr/bin /usr/sbin /tmp

- Dump process list: ps aux > /root/ps-snapshot.txt

---
