# Sentinel — Overview
```markdown
- Cloud-native SIEM + SOAR
- Relies on Azure Monitor / Log Analytics
- Ingests telemetry from many sources using connectors
- Uses Kusto Query Language (KQL) for hunting and analytics
```

# Microsoft Security Products — Short Guide
```markdown
- Microsoft Sentinel — SIEM + SOAR
- Microsoft 365 Defender — EDR / XDR across identity, endpoints, email
- Microsoft Defender for Cloud — cloud workload protection and posture

How they work together: Defender products surface telemetry; Sentinel aggregates, correlates and automates response.
```

# Playbooks & Analytics
```markdown

- Playbooks are implemented using Azure Logic Apps and enable automated response steps (e.g., isolate VM, notify team, open ticket).
- Analytics rules convert telemetry into alerts; alert grouping yields incidents.
```
