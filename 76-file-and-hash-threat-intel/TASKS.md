# Tasks — File and Hash Threat Intel (copyable)


## Task 1 — Introduction
**Goal:** Understand the triage workflow.


_No answer required — read the room intro._


---


## Task 2 — Filenames and Paths
**Task:** Review provided filenames and paths and write down suspicious elements.


**Hints:** Look for double extensions, odd directories, randomized names, or system process lookalikes.


**Example answer (copy/paste format):**
Filename: C:\Users\Alice\AppData\Local\Temp\invoice.pdf.exe Why suspicious: double extension (pdf.exe), located in Temp folder, commonly used drop location.

---

## Task 3 — File Hash Lookup
**Task:** Generate MD5, SHA1 and SHA256 for the sample and look them up on VirusTotal and MalwareBazaar.


**Commands:**


**Linux:**
```bash
sha256sum sample.bin
md5sum sample.bin
sha1sum sample.bin
```

Windows PowerShell:
```markdown
Get-FileHash -Algorithm SHA256 .\sample.bin
Get-FileHash -Algorithm MD5 .\sample.bin
Get-FileHash -Algorithm SHA1 .\sample.bin
```

Example format to submit in the room:
```markdown
Filename: sample.bin
MD5: <md5-hash>
SHA1: <sha1-hash>
SHA256: <sha256-hash>
VirusTotal detections: 12/72 (first seen: 2025-04-xx)
MalwareBazaar tags: {"family": "Emotet", "malware_type": "downloader"}
```
## Task 4 — Sandbox Analysis

Task: Submit file to a sandbox or review provided sandbox report. Extract behaviours and map to ATT&CK.

Example mapping:
```markdown
Observed: Created scheduled task to launch at logon -> ATT&CK: T1053.005 (Scheduled Task)
Observed: Initiated HTTP connections to suspicious domain -> ATT&CK: T1071.001 (Application Layer Protocol: HTTP)
Observed: Created file in C:\Windows\System32 -> suspicious persistence (escalation)
```
Write-up template:
```markdown
Sample: sample.bin (sha256: <sha256>)
Key behaviors:
- Process: cmd.exe -> child: powershell.exe (command line observed: ...)
- Network: contacted bad.example[.]com on port 80
- Persistence: created scheduled task named "WindowsDefenderUpdater"
MITRE mappings: T1059, T1071.001, T1053.005
Conclusion: Likely malicious — recommend isolate host and escalate to L2.
```

## Task 5 — Threat Intelligence Challenge

Task: Use the enrichment sources to determine if the sample is known and provide confidence level.

Example answer:
```markdown
Hash: <sha256>
Vendor detections: 30/80
Related samples: 4 (first seen 2025-03-29)
Confidence: High (malicious)
Recommended action: Quarantine endpoint, block C2 domain, search SIEM for hash and related domains.
```
## Task 6 — Conclusion

Task: Write a short triage summary (1–3 sentences) describing your decision.

Example:
```markdown
Summary: The sample (sha256: <sha256>) shows clear persistence and C2 network activity; vendor detections and sandbox telemetry indicate active malware family X. Action: Quarantine host and escalate for incident response.
```
