# Notes – Splunk Basics: Did You SIEM?

These notes summarize everything learned from the room.

---

## 🔍 Splunk Basics

- Use **Search & Reporting** to run queries.
- Main dataset lives in `index=main`.
- Set time range → **All time**.
- `sourcetype` helps differentiate logs.

### Dataset Sources
- `web_traffic` → All HTTP events  
- `firewall_logs` → Allowed/blocked traffic

---

## 🔎 Initial Queries

### View all logs:
```shell
index=main
```

### Filter web logs:
```shell
index=main sourcetype=web_traffic
```

---

## 📈 Timechart Visualization

### Events per day:
```shell
index=main sourcetype=web_traffic | timechart span=1d count
```

### Reverse sort:
```shell
| sort by count | reverse
```
---

## 🕵️‍♂️ Anomaly Detection

Focus fields:

- **user_agent**  
- **client_ip**  
- **path**

Suspicious indicators:

- Tools: `curl`, `sqlmap`, `havij`
- Paths: `/.env`, `../../etc/passwd`, `/shell.php?cmd=…`
- Massive spike on **2025-10-12**

---

## 🧹 Filtering Benign Traffic

Exclude common browsers:
```shell
user_agent!=Mozilla user_agent!=Chrome user_agent!=Safari user_agent!=Firefox
```

Identify suspicious IPs:
```shell
sourcetype=web_traffic user_agent!=Mozilla ... | stats count by client_ip | sort -count | head 5
```

Attacker identified: **198.51.100.55**

---

## 🧪 Attack Chain Reconstruction

### Recon attempts:
```shell
sourcetype=web_traffic client_ip="198.51.100.55" AND path IN ("/.env","/phpinfo","/.git*")
```

### Path traversal:
```shell
path="../../" OR path="redirect"
```

### SQL injection:
```shell
user_agent IN ("sqlmap","Havij")
```

### Exfiltration:
```shell
path IN ("backup.zip","logs.tar.gz")
```

### RCE:
```shell
path IN ("bunnylock.bin", "shell.php?cmd=")
```

---

## 🔗 Firewall Log Correlation

Outbound C2 communication:
```shell
sourcetype=firewall_logs src_ip="10.10.1.5" dest_ip="198.51.100.55" action="ALLOWED"
```

Bytes transferred:
```shell
| stats sum(bytes_transferred) by src_ip
```

Total exfiltrated: **126167 bytes**

---

## 🧠 Identity Confirmed

Attack chain:

Recon → Enumeration → SQLi → Webshell → Ransomware → C2 → Exfiltration

---
