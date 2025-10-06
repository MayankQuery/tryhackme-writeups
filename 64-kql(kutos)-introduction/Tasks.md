# Task 1 — Introduction

**Summary:** This room introduces KQL and Microsoft Sentinel. Sentinel is a cloud-native SIEM; KQL (Kusto Query Language) is the query language used to explore Log Analytics workspaces to detect, investigate and respond to threats.

**Key points:**
- Sentinel ingests data via connectors.
- KQL is read-only and optimized for telemetry.
- Use cases: hunting, alerting, dashboarding, automation.

**Notes:** See `notes/sentinel_kql_notes.md` for table names and ingestion tips.

---

# Task 2 — Overview of Microsoft Sentinel

**Summary:** Sentinel provides:
- Data connectors (Azure AD, Office 365, AzureActivity, SecurityEvent)
- Analytics rules to create alerts
- Hunting queries & notebooks
- Playbooks (automation)

**Tip:** Start with the built-in `SecurityAlert` and `SecurityEvent` tables for Windows/AD event investigations.

---

# Task 3 — What is KQL

**KQL basics:**
- Statement structure: `<table> | <operator1> | <operator2> | ...`
- Operators: `where`, `project`, `extend`, `summarize`, `join`, `parse`, `mv-expand`.
- Use `bin()` for bucketing time.

**Example:**
```kql
SecurityEvent
| where TimeGenerated >= ago(1d)
| where EventID == 4625
| summarize count() by Account, bin(TimeGenerated, 1h)
```

---

# Task 4 — KQL Concepts in Microsoft Sentinel

**Concepts covered:**
- Data tables & schema
- Filtering and projections
- Aggregations & summarization
- Joins and lookups
- Parsing free-text fields (e.g., Syslog message)

**Example:** joining AzureActivity with SigninLogs to correlate activity with sign-in anomalies.

---

# Task 5 — KQL Statement Structure

**Pattern:** `<table> | where ... | extend ... | summarize ... by ... | order by ...`

**Best practices:**
- Filter early (`where`) to reduce data scanned.
- Project only needed fields.
- Use `limit` for quick checks.
- Use `render` for charting in Log Analytics when producing visual output.

---

# Task 6 — KQL Use Cases

**Use cases:**
- Failed logon detection
- Lateral movement detection via process/create logs
- Suspicious VM actions via AzureActivity
- Detection tuning and alert testing

**Sample approach:** combine `SecurityEvent` (Windows events) with `Heartbeat` and `AzureActivity` to build a timeline.

---

# Task 7 — Conclusion

**Recap:** KQL is an essential skill for Sentinel analysts. Keep practicing parsing, joining and summarizing telemetry. Save common queries and build a personal query library.
