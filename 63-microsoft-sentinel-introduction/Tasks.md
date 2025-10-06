# Task 1 — Microsoft Security Operations Analyst

```markdown

**Question(s) answered:**
- What security unit is responsible for protecting the organization against security threats?
- Which level of SOC Analyst responds to incidents?
- Besides monitoring, what else do SOC Level 1 Analysts spend the majority of their time with?


**Answers:**
- Security unit: **Security Operations Center (SOC)**
- Incident response: **SOC Level 2 Analyst**
- L1 duties: **Triage**


**Notes / Explanation:**
A SOC (Security Operations Center) is the central hub that monitors, investigates and responds to security incidents. SOC analysts are typically split into levels:
- L1: Monitoring & triage — first responder to alerts.
- L2: Incident response & deeper investigation.
- L3: Threat hunting and advanced analysis.


**References / Room hints:**
- The room explains the Microsoft SOC Analyst role and the Microsoft Security products used by analysts.
```

# Task 2 — Introduction to Microsoft Sentinel
```markdown

**Summary:**
Microsoft Sentinel is a cloud-native SIEM and SOAR solution that collects security data across the enterprise, provides intelligent analytics, detection rules, and automation (playbooks) to help SOC teams investigate and respond to threats.


**Key concepts:**
- Data connectors (Azure, M365, third-party)
- Workspaces and Log Analytics
- Analytics rules and incidents
- Playbooks (Logic Apps) for automation
```

# Task 3 — How Microsoft Sentinel Works
```markdown

**High level flow:**
1. Data ingestion using built-in connectors
2. Data stored in Log Analytics workspace
3. Analytics rules run to detect suspicious events
4. Incidents are generated and triaged by SOC analysts
5. Playbooks (Logic Apps) or automation take remediation actions


**Room notes / Practical points:**
- Understand difference between analytics rules and detection rules.
- Sentinels' ability to integrate with Microsoft 365 Defender and Defender for Cloud is useful for cross-correlation.
```

# Task 4 — When To Use Microsoft Sentinel
```markdown

**Use-cases:**
- Enterprise-scale log collection and correlation
- Cross-product correlation (M365 Defender, Defender for Cloud)
- Automated incident response via Playbooks
- Centralized threat hunting and reporting


**Not ideal for:**
- Small environments where cost of Log Analytics outweighs benefits
```

# Task 5 — Conclusion
```markdown

**Key takeaways:**
- Microsoft Sentinel is the cloud-native SIEM/SOAR from Microsoft and is a key tool for modern SOC teams.
- The room covers basics: architecture, roles, and scenarios where Sentinel is useful.
- Useful companion skills: Azure fundamentals, KQL (Kusto Query Language), Logic Apps, and familiarity with Defender products.


**Next steps / learning path:**
- Practice connecting data sources in a free Azure tenant.
- Learn KQL queries and build custom analytics rules.
- Learn Logic Apps to create playbooks for automation.
```
