# Splunk Basics – Did You SIEM? | TryHackMe

This repository contains my notes, tasks, and cheat sheet for the **Splunk Basics – Did You SIEM?** room from TryHackMe.  
The room focuses on understanding Splunk, ingesting log data, querying datasets, analyzing anomalies, and investigating a simulated cyber attack.

---

## 📌 Room Overview

In this room, I learned how to:

- Use Splunk Search & Reporting  
- Query logs using `index`, `sourcetype`, and field filtering  
- Visualize logs with `timechart` and `stats`  
- Detect anomalies (user agents, IPs, suspicious paths)  
- Trace attacker actions (recon → enumeration → exploitation → exfiltration → C2)
- Correlate web logs with firewall logs
- Identify C2 connections and data exfiltration

---

## 🛠️ Datasets Used

Splunk contained two pre-ingested log sources:

- **web_traffic** — webserver access logs  
- **firewall_logs** — inbound/outbound firewall traffic

---

## 🎯 Final Answers

| Question | Answer |
|---------|--------|
| Attacker IP | **198.51.100.55** |
| Peak Traffic Day | **2025-10-12** |
| Havij user_agent count | **993** |
| Path traversal attempts | **658** |
| Bytes exfiltrated | **126167** |

---

## 📂 Repository Structure

📁 Splunk-Basics-Did-You-SIEM
├── README.md
├── NOTES.md
├── CHEATSHEET.md
└── TASKS.md

---

## 🚀 Skills Practiced

- Log correlation  
- Splunk queries  
- Threat hunting  
- Timeline reconstruction  
- Attack chain mapping  
- Digital forensics (DFIR fundamentals)

---v
