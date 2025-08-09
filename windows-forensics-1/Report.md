# Quick Workflow / Commands

## 1) Acquire Disk Image

**FTK Imager GUI:** create `.E01` or raw `.dd`  
**Linux (dd method):**
```bash
sudo dd if=/dev/sdX of=./artifacts/image.dd bs=4M status=progress conv=sync,noerror 
```

## 2) Mount Offline Registry Hive
```bash
reg.exe load HKLM\OfflineSOFTWARE "C:\mnt\windows\System32\config\SOFTWARE"
reg.exe query HKLM\OfflineSOFTWARE\Microsoft\Windows\CurrentVersion\Run
reg.exe unload HKLM\OfflineSOFTWARE
```

## 3) Parse with Regripper
```bash
rip.pl -r NTUSER.DAT -p userassist > userassist.txt
rip.pl -r SYSTEM -p usb > usb_devices.txt
```

## 4) KAPE Quick Run
```bash
kape.exe --tsource \\path\to\mounted\image --targets Triage,AllTriage
```

## Example Findings

UserAssist shows execution of eviltool.exe on 2025-08-01 09:12 UTC

MountedDevices indicates USB serial 1234-ABCD connected 2025-07-31

ShimCache confirms execution of setup.exe from C:\Users\Public\Downloads
