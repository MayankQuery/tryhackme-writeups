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
