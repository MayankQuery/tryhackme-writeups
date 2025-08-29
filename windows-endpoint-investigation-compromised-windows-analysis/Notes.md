# Investigation Checklist (Windows)

```markdown

- [ ] Acquire triage: Scheduled Tasks XML, Recent Items, Event Logs
- [ ] Identify persistence: Tasks, Run Keys, Services, WMI, Startup folders
- [ ] Parse LNK with LECmd → CSV → Timeline Explorer
- [ ] Export Task XML with `schtasks /query /xml`
- [ ] Export relevant Event Logs (4698, 4702, 4688, 1102)
- [ ] Extract IOCs → `/Findings/Indicators.csv`
- [ ] Build Timeline → `/Findings/Summary.md`
- [ ] Mitigation & validation steps documented
```

---

# Artifact Paths (Windows)

```markdown

- Tasks (disk): `C:\\Windows\\System32\\Tasks\\*`
- Task Scheduler Logs: `Applications and Services Logs/Microsoft/Windows/TaskScheduler/Operational`
- LNK Shortcuts: `C:\\Users\\<User>\\AppData\\Roaming\\Microsoft\\Windows\\Recent Items\\*`
- Defender status & logs: `Microsoft-Windows-Windows Defender/Operational`
```

---

# Commands Cheatsheet

```markdown

# Export a specific scheduled task
schtasks /query /tn "Updater" /xml > Evidence\Updater-Task.xml

# List all tasks with last run time and next run
schtasks /query /fo LIST /v > Evidence\All-Tasks-Verbose.txt

# Wevtutil selective export
wevtutil epl Security Evidence\Security.evtx /q:"*[System[(EventID=4698 or EventID=4702 or EventID=4688)]]"
wevtutil epl Microsoft-Windows-TaskScheduler/Operational Evidence\TaskScheduler.evtx
```

---
