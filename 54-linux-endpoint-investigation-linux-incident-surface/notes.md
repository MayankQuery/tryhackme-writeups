# 01 — Linux Incident Surface: Overview

## Concepts
- **Attack Surface**: places an attacker can reach or abuse (services, ports, creds, misconfig).
- **Incident Surface**: places defenders can observe evidence (process table, `/proc`, logs, filesystem, memory).

## Mental Model
1. **Entry** ➜ 2. **Execution** ➜ 3. **Persistence** ➜ 4. **Comms** ➜ 5. **Defense Evasion**
At each step: *what would run, touch disk, open sockets, or log?*

## Fast Map
- Processes: `ps`, `/proc/<pid>`, `cmdline`, `exe`, `environ`.
- Network: `ss`, `netstat` (legacy), `/proc/net/*`, firewall rules.
- Persistence: systemd services/timers, cron/anacron, rc.local, shells, PAM, LD_PRELOAD, user dotfiles.
- Disk: timestamps, $PATH hijacks, SUID/SGID, hidden dirs, recent writes.
- Logs: `journald`, `/var/log/*`, auth, sudo, bash history (with caveats).

---

# 02 — Processes and Network Communication

## Goals
- Identify suspicious processes and parents
- Map open ports to owning processes
- Capture quick IOCs (paths, hashes, IPs)

## Process Triage
```bash
ps auxf
ps -eo pid,ppid,user,cmd --sort=ppid
for p in /proc/[0-9]*; do readlink -f "$p/exe" 2>/dev/null; done | sort -u
sudo ls -l /proc/<PID>/fd
sudo strings -n 8 /proc/<PID>/environ 2>/dev/null | tr '\0' '\n'
```

## Network Triage
```bash
ss -tulpen
ss -pant
ip a; ip r
sudo iptables -S 2>/dev/null || true
sudo nft list ruleset 2>/dev/null || true
```

## Quick Checks
- **Weird parents**: network tools started by `cron`, `apache`, or `dbus` without reason.
- **Ephemeral binaries** in `/tmp`, `/dev/shm`, or user-writable dirs.
- **Long‑running shells** with network sockets.

---

# 03 — Persistence

## Common Mechanisms
- **systemd**: services in `/etc/systemd/system/*.service` and user services `~/.config/systemd/user/`
- **cron**: `/etc/cron*`, `/var/spool/cron`, user crontabs
- **rc/local**: `/etc/rc.local` if enabled
- **Shell init**: `~/.bashrc`, `~/.profile`, `/etc/profile.d/*.sh`
- **Startup binaries/paths**: `/usr/local/bin`, `$PATH` ordering
- **LD_* tricks**: `LD_PRELOAD`, `/etc/ld.so.preload`
- **PAM**: modules configured in `/etc/pam.d/*`
- **SSH**: `authorized_keys` commands/forced‑commands, `sshd_config`

## What to Collect
- Unit files (`systemd`), timers
- All crons
- User login shells and dotfiles
- `/etc/ld.so.*`
- PAM diffs vs baseline

---

# 04 — Footprints on Disk

## File System Signals
- Recent writes in `/etc`, `/usr/local`, `/opt`, `/var/tmp`, `/tmp`, home directories
- **SUID/SGID** binaries and new setuid candidates
- Unexpected **PATH hijacks** (earlier directories shadow real binaries)
- **Hidden files** (dotfiles) or names with whitespace/unicode

## Handy Commands
```bash
sudo find / -xdev -type f -mtime -2 2>/dev/null | head
sudo find / -xdev -perm -4000 -type f 2>/dev/null
printf '%s\n' $PATH | tr ':' '\n' | nl
sudo debsums -s 2>/dev/null || true   # Debian/Ubuntu integrity
rpm -Va 2>/dev/null || true           # RPM integrity
```

---

# 05 — Linux Logs

## Journald (systemd)
```bash
journalctl -xe
journalctl --since "2 hours ago"
journalctl _COMM=sshd -o short-iso
```

## Classic Files
- `/var/log/auth.log` or `/var/log/secure` — auth + sudo
- `/var/log/syslog` or `/var/log/messages` — system
- `/var/log/cron` — cron events
- App logs under `/var/log/<app>/`

## History (Caveats)
- `~/.bash_history` is per-session; may be truncated or disabled.
- Prefer **process + logs** over history alone.

---

