# SOC L1 Alert Reporting — Quick Reference Cheatsheet

---

## ⚙️ Alert Funnel
| Stage | Role | Action |
|--------|------|--------|
| L1 | Monitor & Triage | Identify True/False Positives |
| L1 | Report | Document findings |
| L1 → L2 | Escalate | Forward critical True Positives |
| L2/DFIR | Investigate | Deep forensic analysis & remediation |

---

## 🧾 Report Structure Template
**Alert Title:** Unauthorized Login Attempt Detected  
**Analyst:** L1 Analyst Name  
**Date/Time:** YYYY-MM-DD HH:MM  
**Severity:** Medium / High  
**Category:** Authentication / Privilege Escalation  

### Summary
Brief description of what triggered the alert.

### Evidence
- Log snippets  
- IPs, timestamps  
- User details  

### Analysis
Explain investigation process and reasoning.

### Conclusion
False Positive or True Positive?

### Recommendation
Containment or escalation steps.

---

## 🚨 Escalation Procedure
1. Confirm the alert is **True Positive**
2. Update alert ticket with:
   - Summary
   - Evidence
   - Actions taken
3. Assign ticket to **L2 Queue**
4. Communicate escalation via Slack/Email
5. Document escalation in ticket comments

---

## 🗣️ Communication Protocol
| Team | Purpose |
|-------|----------|
| IT | Verify system/user activity |
| HR | Confirm employee details |
| L2 SOC | Deep analysis & response |
| Management | Alert summaries & KPIs |

**Golden Rule:** Be concise, clear, and factual.

---

## 🧰 Tools
- **SIEM:** Splunk, Microsoft Sentinel  
- **Ticketing:** JIRA, TheHive, ServiceNow  
- **Forensics Support:** Elastic, VirusTotal  
- **Reporting Docs:** SOC Templates / Internal KB  

---

## 🧠 Key Terms
| Term | Definition |
|------|-------------|
| **Alert Reporting** | Describing investigation results in detail |
| **Alert Escalation** | Passing suspicious alerts to L2 |
| **SOC Communication** | Collaborating with other teams |
| **DFIR** | Digital Forensics and Incident Response |

---

## 🧩 Quick Tips
- Always include timestamps & evidence  
- Avoid assumptions — rely on data  
- Keep reports professional and reproducible  
- Double-check alert details before escalation  
