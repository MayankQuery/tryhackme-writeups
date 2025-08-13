# Log Operations — TryHackMe Room Write‑Up

<div align="center">

[![Status](https://img.shields.io/badge/Room-Completed-brightgreen)](#)
[![Level](https://img.shields.io/badge/Difficulty-Easy-blue)](#)
[![Track](https://img.shields.io/badge/Track-SOC%20Level%202-purple)](#)

</div>

A structured write‑up and study notes for the **TryHackMe: Log Operations** room. This repository captures key concepts, task summaries, and practical checklists for configuring, operating, and improving logging pipelines across Linux, Windows, and cloud environments.

> **Room:** Log Operations
> **Module:** SOC Level 2 — Log Analysis
> **Est. Time:** \~60 min
> **Status:** Completed (100%)

---

## Table of Contents

* [Overview](#overview)
* [Room Objectives](#room-objectives)
* [What I Learned](#what-i-learned)
* [Task‑by‑Task Notes](#task-by-task-notes)

  * [Task 1 — Introduction](#task-1--introduction)
  * [Task 2 — Log Configuration](#task-2--log-configuration)
  * [Task 3 — Where To Start After Deciding the Logging Purpose](#task-3--where-to-start-after-deciding-the-logging-purpose)
  * [Task 4 — Configuration Dilemma: Planning and Implementation](#task-4--configuration-dilemma-planning-and-implementation)
  * [Task 5 — Principles and Difficulties](#task-5--principles-and-difficulties)
  * [Task 6 — Common Mistakes and Best Practices](#task-6--common-mistakes-and-best-practices)
  * [Task 7 — Conclusion](#task-7--conclusion)
* [Practical Checklists](#practical-checklists)

  * [Design & Scope](#design--scope)
  * [Retention & Storage](#retention--storage)
  * [Quality & Normalization](#quality--normalization)
  * [Security & Compliance](#security--compliance)
* [Sample Configs](#sample-configs)

  * [Linux: rsyslog ➜ SIEM](#linux-rsyslog--siem)
  * [Windows: Event Forwarding](#windows-event-forwarding)
  * [Logrotate: Retention Policy](#logrotate-retention-policy)
* [KPIs & Metrics](#kpis--metrics)
* [Glossary](#glossary)
* [Repository Structure](#repository-structure)
* [How to Use This Repo](#how-to-use-this-repo)
* [License](#license)

---

## Overview

**Log Operations** focuses on the *operational* side of logging: defining purpose, scoping sources, planning configuration, preventing common pitfalls, and applying best practices to build reliable pipelines that support detection, response, and compliance.

## Room Objectives

* Understand the fundamentals of **log configuration** (sources, formats, transport, parsing, indexing).
* Translate **use cases** (detection, forensics, audit, compliance) into logging requirements.
* Plan **architecture** (collection, aggregation, storage, SIEM, alerting) and **retention**.
* Apply **principles** (integrity, availability, least privilege, scalability) and avoid mistakes.

## What I Learned

* How to scope logging to **business and security objectives** before collecting “everything”.
* Creating **source-to-use-case matrices** to prioritize ingestion and parsing.
* Balancing **volume vs. value** with sampling, filtering, and tiered storage.
* Setting **retention** by regulation and investigation needs (hot/warm/cold tiers).
* Avoiding common configuration anti‑patterns (e.g., inconsistent timestamps, missing time sync, untested pipelines).

---


  endscript
}
```

---
