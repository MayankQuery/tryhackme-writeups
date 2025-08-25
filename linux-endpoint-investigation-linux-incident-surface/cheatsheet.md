# Cheatsheet — Fast Commands

## Processes
- `ps auxf`
- `ps -eo pid,ppid,user,cmd --sort=ppid`
- `ls -l /proc/<PID>/exe /proc/<PID>/cwd /proc/<PID>/fd`

## Network
- `ss -tulpen` (listeners)
- `ss -pant` (connections)

## Persistence
- `systemctl list-unit-files --type=service --no-pager`
- `systemctl list-timers --all --no-pager`
- `crontab -l; sudo ls -la /etc/cron* /var/spool/cron`

## Disk
- `find / -xdev -type f -mtime -2 2>/dev/null | head`
- `find / -xdev -perm -4000 -type f 2>/dev/null`

## Logs
- `journalctl --since "1 hour ago"`
- `grep -i "failed password" /var/log/auth.log 2>/dev/null`
