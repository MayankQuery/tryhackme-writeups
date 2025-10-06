# Cheatsheet — Defender XDR (1 page)

**Quick definitions:**

* XDR: Cross-product detection & response.
* Correlation: Combining signals to raise higher-fidelity alerts.
* Unified RBAC: Single role model across Defender products.

**Portal quick paths:**

* Portal: `https://security.microsoft.com`
* Settings → Roles & permissions
* Settings → Data connectors
* Incidents → Active incidents
* Hunting → Advanced hunting → Kusto queries

**Helpful Kusto hints**

* Basic query structure:

```
DeviceEvents
| where Timestamp > ago(7d)
| where ActionType == "ProcessCreated"
| project Timestamp, DeviceName, FileName
| limit 50
```
---
