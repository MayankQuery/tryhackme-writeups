# Sentinel Cheatsheet — Quick Reference

```markdown

**Key terms:**
- SIEM: Security Information and Event Management
- SOAR: Security Orchestration, Automation and Response
- KQL: Kusto Query Language


**Quick KQL examples:**
- Count events by IP: `SecurityEvent | summarize count() by IPAddress`
- Find failed logons: `SigninLogs | where ResultType != 0`


**Useful commands / tips:**
- Use saved queries for repeated investigations.
- Use playbooks for repetitive containment actions.
