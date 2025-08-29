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
