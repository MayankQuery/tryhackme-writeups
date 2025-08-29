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
