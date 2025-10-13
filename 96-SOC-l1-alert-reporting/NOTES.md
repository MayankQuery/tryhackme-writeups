# SOC L1 Alert Reporting — Notes & Concepts

---

## 🧭 1. The Role of SOC L1 Analysts
SOC L1 analysts are the **first line of defense** in detecting, analyzing, and reporting security alerts.  
Their responsibilities include:
- Monitoring SIEM alerts  
- Identifying false positives and true positives  
- Reporting findings and escalating critical alerts  
- Maintaining documentation for audit and incident tracking  

---

## 🔄 2. The Alert Funnel
Visualize the alert flow:
100 Alerts → (L1 handles) → 10 True Positives → (Escalate to L2) → 1 Incident (DFIR)

**Stages:**
1. **Alert Classification (Triage)** – Determine false/true positives  
2. **Alert Reporting** – Document findings  
3. **Alert Escalation** – Pass valid alerts to L2  
4. **Incident Handling (DFIR)** – L2 and IR teams investigate deeper  

---

## 🧾 3. Alert Reporting
**Definition:** Formal process of describing alert details, investigation steps, and conclusions.  
A good alert report includes:
- Summary of the alert  
- Evidence gathered (logs, screenshots, indicators)  
- Analysis results (why True/False positive)  
- Recommended next steps  

**Best Practices:**
- Be concise and factual  
- Include timestamps and IP addresses  
- Avoid assumptions — use verified data only  
- Use templates for consistency  

---

## ⚠️ 4. Alert Escalation
**Definition:** The process of **passing a True Positive** alert to **L2 analysts** for further action.

### Escalation Criteria:
- Complex or severe threats (e.g., lateral movement, privilege escalation)  
- Malware infection or confirmed data exfiltration  
- Repeated alerts from critical assets  

### How to Escalate:
1. Summarize findings in the SOC ticket  
2. Attach all relevant logs and evidence  
3. Assign to the correct L2 queue or team  
4. Notify L2 via proper communication channel (e.g., Slack, ticket system)

---

## 🗣️ 5. SOC Communication
Effective communication ensures seamless incident response.

### Common communication paths:
- **IT Team:** To confirm system or user activities  
- **HR Team:** To verify employee details (e.g., newly hired or terminated users)  
- **L2 Analysts:** To provide additional context for alerts  
- **Management:** For status updates and summaries  

### Golden Rules:
- Keep communication **professional** and **documented**
- Never share **sensitive data** outside SOC-approved channels
- Confirm receipt of escalations or requests

---

## 🔐 6. Key Takeaways
- L1 analysts filter the noise, escalate the signal  
- Clear, concise, and evidence-based reporting = faster incident resolution  
- Communication bridges the gap between detection and response  
- Always document your findings — if it’s not written, it didn’t happen.

---

## 🧩 7. Reference Tools
- **SIEMs:** Splunk, Sentinel, QRadar  
- **Ticketing:** ServiceNow, JIRA, TheHive  
- **Communication:** Slack, Microsoft Teams, Email  
- **Report Templates:** SOC SOP Docs, internal knowledge bases
