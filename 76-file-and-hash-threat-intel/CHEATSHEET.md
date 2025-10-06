# Cheatsheet — Quick reference


## Hash generation
**Linux:**
- `sha256sum filename` — SHA256
- `sha1sum filename` — SHA1
- `md5sum filename` — MD5


**Windows (PowerShell):**
- `Get-FileHash -Algorithm SHA256 .\file.exe`
- `Get-FileHash -Algorithm MD5 .\file.exe`


---


## Quick look commands
- `file suspicious` (identify file type)
- `strings -n 8 suspicious | grep -i "http\|hxxp\|exe\|C:\\"` (extract likely IOCs)
- `pefile` or `rizin`/`radare2` for lightweight binary inspection


---


## VirusTotal & MalwareBazaar
- Check hash first. If unknown, consider submitting file if allowed by policy and environment.
- Record `first_seen`, `last_analysis_date`, `av_labels`, `community_comments`, and `relations`.


---


## Sandbox mapping (common)
- **Network connections** -> ATT&CK T1071
- **Process creation** (cmd/powershell) -> ATT&CK T1059
- **Persistence** (scheduled tasks, services, registry Run keys) -> ATT&CK T1053, T1543, T1112
- **Credential access** -> ATT&CK T1003


---


## Quick triage checklist
1. Collect filename + full path
2. Generate MD5, SHA1, SHA256
3. Query VirusTotal, MalwareBazaar
4. Inspect `strings` and Yara matches
5. Review sandbox process tree and network
6. Map to MITRE ATT&CK
7. Summarize and recommend action (isolate/quarantine/monitor)


---


## YARA quick template
```yara
rule suspicious_sample {
meta:
author = "your-name"
description = "detects suspicious strings used in lab"
strings:
$s1 = "bad.example.com"
$s2 = "CreateScheduledTask"
condition:
any of them
}
```

## Useful links (for your notes)

- VirusTotal — lookup by hash or file

- MalwareBazaar — search by hash and tags

- Hybrid Analysis / Any.Run / Cuckoo — sandbox analysis

- MITRE ATT&CK — mapping reference
