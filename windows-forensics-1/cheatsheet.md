# Windows Forensics — Quick Registry Cheatsheet

## USB Device History
`HKLM\SYSTEM\MountedDevices` — Mounted volumes and GUIDs  
`HKLM\SYSTEM\CurrentControlSet\Enum\USBSTOR` — USB storage devices

## Program Execution
`HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist`  
`HKCU\Software\Microsoft\Windows\Shell\MuiCache`  
`AmCache.hve` — Program name, path, hashes  
`ShimCache` — Evidence of execution

## System & User Info
`HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName`  
`HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion` — OS install date, version  
`HKLM\SAM\SAM\Domains\Account\Users` — User accounts

---

### Common Regripper Plugins
- `userassist`
- `shellbags`
- `amcache`
- `shimcache`
- `usb`
- `recentdocs`
