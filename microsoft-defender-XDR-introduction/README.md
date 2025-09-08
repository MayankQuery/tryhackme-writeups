# tryhackme-defender-xdr

> Repository draft for the TryHackMe room **XDR: Introduction (Microsoft Defender XDR)** — organised for study notes, lab steps, cheatsheet and ready-to-publish README for GitHub.

---

# **TryHackMe — XDR: Introduction (Microsoft Defender XDR) — Repo**

## Description

This repository contains study materials and a reproducible lab walkthrough for the TryHackMe room *XDR: Introduction* (Microsoft Defender XDR). It includes concise notes, a task-by-task walkthrough, a lab guide with screenshots placeholders, and a one‑page cheatsheet for quick revision.

## Learning objectives (mapped from the room)

* Understand what Extended Detection and Response (XDR) is.
* Get an overview of Microsoft Defender XDR architecture and core components.
* Learn Defender XDR settings and RBAC model.
* Review how Defender XDR correlates signals across Microsoft 365 services.
* Understand integration points with Microsoft Sentinel and other tools.

## Usage

1. Clone this repo:

```bash
git clone https://github.com/<your-username>/tryhackme-defender-xdr.git
cd tryhackme-defender-xdr
```

2. Read `notes/notes.md` for concepts.
3. Follow `labs/lab-navigate-defender-xdr.md` to replicate the portal navigation steps and capture screenshots into `images/`.
4. Use `cheatsheet/cheatsheet.md` for quick exam-style revision.

## File highlights

* `notes/notes.md` — condensed theory and important definitions.
* `tasks/tasks.md` — answers/walkthrough for each TryHackMe task.
* `labs/lab-navigate-defender-xdr.md` — guided lab steps to navigate the portal, take screenshots and validate results.
* `cheatsheet/cheatsheet.md` — one-page quick reference of Defender XDR components, RBAC tips, and Sentinel integration points.

---

## tasks/tasks.md

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

---

## labs/lab-navigate-defender-xdr.md

# Lab: Navigating the Defender XDR Portal

**Goal:** Familiarise yourself with the Defender XDR portal and perform specific checks (data connectors, RBAC, incidents view).

### Prerequisites

* Access to Microsoft 365 Defender portal (or follow along with screenshots if you do not have access).

### Steps

1. Open Microsoft 365 Defender portal: `https://security.microsoft.com`.
2. Sign in with a test account that has Security Reader access.
3. From the left menu, open **Microsoft Defender XDR** (or the section labelled XDR / Incidents).
4. Explore the **Overview** dashboard — capture `images/portal-overview.png`.
5. Navigate to **Settings → Roles & permissions**. Locate a built-in role and a custom role. Capture `images/rbac-diagram.png`.
6. Go to **Data connectors** and list which connectors are active. Note any missing connectors.
7. Open **Incidents** and filter by severity — take a screenshot of the incidents list.
8. If possible, open an incident and practice adding a comment, assigning an owner, and adding tags.

### Lab deliverables

* Add screenshots to `/images/` with descriptive filenames.
* Fill `tasks/tasks.md` with answers and attach the screenshot references.

---

## cheatsheet/cheatsheet.md

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

**RBAC tips**

* Use groups for assignments to avoid per-user management.
* Test custom roles with least privilege.

---

## CONTRIBUTING.md

# Contributing

* Fork the repo, add improved notes or real screenshots, and create a PR.
* Update `tasks/tasks.md` only when you confirm the answers in your tenant or from the room.

---

*End of repository draft.*
