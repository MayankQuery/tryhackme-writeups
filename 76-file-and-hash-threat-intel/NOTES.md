
# Notes — File and Hash Threat Intel


## 1) Triage mindset: Verify → Enrich → Decide


- **Verify:** Confirm the artefact exists and collect metadata (filename, path, size, timestamps, hashes).
- **Enrich:** Query VirusTotal, MalwareBazaar, sandbox reports and internal telemetry (EDR). Add context such as first seen dates, family names, and related domains.
- **Decide:** Based on enrichment, decide next steps (quarantine, escalate, false positive).


---


## 2) Filename/path heuristics


- Look for odd names like `update.exe` in user temp folders, `svchostX.exe`, random GUID-like names, double extensions (`invoice.pdf.exe`).
- Unusual directories: `C:\Users\Public\` or `C:\Windows\Temp\` with executable dropped from Office macros or archives.
- Timestamp mismatches: creation date significantly different from last modified, or future timestamps.


---


## 3) Generating hashes


**Linux (shasum / md5sum):**


```bash
sha256sum suspicious.exe # outputs SHA256
sha1sum suspicious.exe # SHA1
md5sum suspicious.exe # MD5
```

---

Windows (PowerShell):
```markdown
Get-FileHash -Algorithm SHA256 .\suspicious.exe
Get-FileHash -Algorithm SHA1 .\suspicious.exe
Get-FileHash -Algorithm MD5 .\suspicious.exe
```
Record: MD5, SHA1, SHA256, file size, and file name + path.

---

## 4) VirusTotal & MalwareBazaar

- VirusTotal: Submit hash or file; get scans, YARA matches, related samples, detection names, first seen dates, and network indicators.

- MalwareBazaar: Good for recent malware samples and family tags; use hash lookup to find sample metadata and VT links.

- Always check community notes and relations on VirusTotal (observed in other samples).

## 5) Sandbox telemetry

Common useful fields from sandbox (e.g., Any.Run, Cuckoo):

- Process tree and command lines

- Network connections (domains, IPs, URLs)

- Files created/deleted

- Registry changes (Windows)

- Persistence mechanisms (services, scheduled tasks, Run keys)

- Parent/child process relationships

Map behaviors to MITRE ATT&CK (e.g., T1059 for command-line, T1071.001 for HTTP exfiltration).

## 6) YARA & quick static checks

- Use YARA to identify families or suspicious strings.

- Quick strings output to look for URLs, mutex names, C2 domains, or suspicious function names.
```markdown
strings -n 8 suspicious.exe | less
yara -r rules.yar suspicious.exe
```
## 7) Evidence & reporting

- Save the hash values, sandbox screenshot, and notable IOC list.

- Provide a concise triage summary: what was observed, enrichment results, likelihood (malicious/benign/unknown), and recommended action.
