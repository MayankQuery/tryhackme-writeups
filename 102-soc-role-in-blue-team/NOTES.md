# SOC Role in Blue Team — Notes & Walkthrough

## 1. What is the Blue Team?
The Blue Team is the defensive security function that protects an organization’s assets. It focuses on detection, analysis, containment, and recovery — i.e., preventing attackers from achieving their objectives.

---

## 2. Where does the SOC sit in an organization?
- The SOC (Security Operations Center) is typically an internal or outsourced team responsible for continuous monitoring and response.  
- The SOC reports to security leadership (CISO, Head of Security) and works closely with IT, network, application teams, legal, and HR during incidents.

---

## 3. SOC Tiers / Roles
### L1 — SOC Analyst (Junior / Triage)
- Primary role: monitor alerts, triage, and classify.  
- Tools: SIEM dashboards, alerting systems, ticketing tools.  
- Tasks: validate alerts, gather initial context, escalate true positives to L2.  
- Skills: basic log interpretation, alert triage, communication, runbooks.

### L2 — SOC Analyst (Investigation / Response)
- Primary role: deeper investigation, remediation guidance.  
- Tasks: enrich alerts, perform root cause analysis, coordinate containment steps, perform forensic triage.  
- Skills: advanced log analysis, endpoint tools, network forensics, scripting.

### L3 — Threat Hunter / Senior Analyst
- Primary role: proactive detection, hunting unknown threats, playbook creation.  
- Tasks: hypothesis-driven hunts, detection engineering, complex IR.  
- Skills: threat intelligence integration, advanced detection engineering, reverse engineering (optional).

### SOC Leadership
- SOC Manager, Team Leads — oversee operations, SLAs, hiring, process improvements.

---

## 4. Supporting Teams & Collaboration
- **Incident Response (IR) / DFIR:** deep forensics and recovery.  
- **Threat Intelligence:** contextual threat data (IOCs, TTPs).  
- **Red Team / Pen Testers:** adversary simulation; SOC learns from engagements.  
- **IT / DevOps / Application Teams:** patching, configuration changes, and containment.

---

## 5. Common Tools & Tech Stack
- **SIEM:** Splunk, Elastic, Microsoft Sentinel, QRadar.  
- **EDR:** CrowdStrike, Carbon Black, Microsoft Defender.  
- **Network:** Zeek, Suricata, tcpdump, NetFlow collectors.  
- **Ticketing:** ServiceNow, JIRA, TheHive.  
- **Other:** Threat Intel platforms, sandboxing, forensic toolkits.

---

## 6. Daily Workflow (Example)
1. Monitor SIEM & triage new alerts.  
2. Validate alert (false positive vs true positive).  
3. If false positive: document and tune detection rules.  
4. If true positive: escalate to L2 with evidence.  
5. L2 performs containment/remediation and documents playbook updates.  
6. Post-incident: lessons learned, detection tuning, and reporting.

---

## 7. Career Progression & Skills
- Start: L1 — focus on alert triage, communication, SOPs.  
- Grow to L2: learn investigation, scripting, EDR, and incident handling.  
- Advance to L3/Threat Hunter: detection engineering, threat hunting, automation.  
- Leadership: SOC Manager / CISO — focus on process, KPIs, resource allocation.

---

## 8. Certifications & Learning Paths
- Beginner: CompTIA Security+, eLearnSecurity Junior Analyst, vendor SIEM fundamentals.  
- Intermediate: Splunk Core Certified, Azure Sentinel / Elastic certifications, CEH (entry-level).  
- Advanced: GCFA/GCFE (GIAC), GCTI (Threat Intelligence), OSCP (optional for deeper offensive knowledge).

---

## 9. KPIs & Metrics SOCs Care About
- Mean Time to Detect (MTTD)  
- Mean Time to Respond (MTTR)  
- False positive rate  
- Alert backlog & SLA compliance  
- Number of incidents escalated and remediated

---

## 10. Best Practices
- Maintain runbooks and playbooks.  
- Tune detections to reduce noise.  
- Automate repetitive tasks (SOAR).  
- Regular purple team exercises (blue + red).  
- Continuously upskill and share knowledge.
