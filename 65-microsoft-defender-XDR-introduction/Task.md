# Tasks and Walkthroughs — XDR: Introduction

## Task mapping (suggested answers format)

### Task 1 — Introduction

**Answer:** No answer needed (overview only).

### Task 2 — What is Microsoft Defender XDR

**Answer (short):** Microsoft Defender XDR is Microsoft’s integrated detection and response platform that correlates signals across endpoints, identities, email, apps and cloud to improve detection accuracy and automate response.

### Task 3 — Microsoft Defender XDR Architecture

**Answer (short):** Architecture consists of telemetry ingestion from Microsoft 365 Defender products, a correlation/analytics engine, investigation workspace, and integration layers (APIs, Sentinel connectors). Add small ASCII/art diagram here or link to `images/rbac-diagram.png`.

### Task 4 — Microsoft Defender XDR Settings

**Walkthrough:** Navigate to Settings → Configuration → Data connectors; verify connectors for Endpoint (Defender for Endpoint), Identity (Azure AD), Email & Collaboration (Microsoft Defender for Office 365).

### Task 5 — Defender XDR Roles and Permissions

**Answer (short):** Describe built-in roles and where to check role assignments: Settings → Roles & Permissions → View assignments.

### Task 6 — Unified RBAC

**Walkthrough:** Show how to create a custom unified RBAC role: Settings → RBAC → Add role → Choose permissions and scope → Assign to a user/group.

### Task 7 — Lab: Navigating Defender XDR Portal

See `labs/lab-navigate-defender-xdr.md` for step-by-step.

### Task 8 — Lab: Reviewing Custom Unified RBAC Roles

**Walkthrough:** Use the portal to list custom roles, their permission sets and effective scopes. Capture screenshots.

### Task 9 — Conclusion

**Answer:** Summarise learning outcomes and next steps (try Sentinel integration labs, or advanced hunting labs).
