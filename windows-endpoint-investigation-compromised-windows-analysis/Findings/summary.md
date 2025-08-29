## Summary.md

```markdown
# Findings — Summary

## Executive Summary
The attacker established persistence by creating a Scheduled Task named **Updater** that invoked **ssh.exe** to connect to a malicious server at **192.168.1.4** at one‑minute intervals. Prior to persistence, the attacker created and accessed a suspicious archive **secrets.rar**, indicating possible data staging/exfiltration preparation.

## High-Confidence IOCs
- **Task Name:** Updater
- **Executable:** C:\\Windows\\System32\\OpenSSH\\ssh.exe
- **Remote IP (C2):** 192.168.1.4
- **Suspicious File:** secrets.rar
- **RAR Creation Time:** 2022-09-30 10:27:20

## Timeline (Key Events)
- **10:27:20** — `secrets.rar` created (Target Created)
- **10:29:00** — Scheduled Task `Updater` created to run every minute

## Recommended Actions
- Blocklist `192.168.1.4` across network perimeter and EDR
- Remove Scheduled Task `Updater`
- Hunt for additional persistence (Run keys, Services, WMI)
- Review host for data staging and exfil indicators
- Re-enable and validate Windows Defender / EDR protections
```

---
