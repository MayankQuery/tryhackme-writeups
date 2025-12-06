# Cheatsheet – Splunk Basics (TryHackMe)

A quick reference for commonly used Splunk commands from the room.

---

## 🔍 Search All Logs
```shell
index=main
```

## 🏷️ Filter by sourcetype
```shell
index=main sourcetype=web_traffic
index=main sourcetype=firewall_logs
```

## 📈 Timechart (events per day)
```shell
... | timechart span=1d count
```

## 🔢 Stats Count
```shell
... | stats count by client_ip
```

## 🚫 Excluding User Agents
```shell
user_agent!=Mozilla user_agent!=Chrome ...
```

## 🔎 Find Attacker Actions

### Recon
```shell
path IN ("/.env","/phpinfo","/.git*")
```

### Path Traversal
```shell
path="../../"
```

### SQL Injection
```shell
user_agent IN ("sqlmap","Havij")
```

### Exfiltration
```shell
path IN ("backup.zip","logs.tar.gz")
```

### RCE
```shell
path IN ("shell.php?cmd=","bunnylock.bin")
```

---

## 🔗 Firewall Correlation

### C2 Traffic
```shell
src_ip="10.10.1.5" dest_ip="198.51.100.55" action="ALLOWED"
```

### Calculate Exfiltrated Bytes
```shell
| stats sum(bytes_transferred) by src_ip
```

---

## 📌 Final Answers

- Attacker IP: **198.51.100.55**  
- Peak Traffic Day: **2025-10-12**  
- Havij Events: **993**  
- Path Traversal Attempts: **658**  
- Bytes Exfiltrated: **126167**
