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

## Task‑by‑Task Notes

### Task 1 — Introduction

Sets the context for why log operations matter: logs are **evidence of historical activity** and the backbone of detection & investigations.

### Task 2 — Log Configuration

* Define **sources** (endpoints, servers, network devices, cloud services).
* Choose **formats & transports**: syslog, JSON, CEF/LEEF, agents vs. agentless, TLS.
* Normalize early where possible; preserve **raw** for forensics.

### Task 3 — Where To Start After Deciding the Logging Purpose

* Start with **purpose-first** design (e.g., ransomware detection, PCI DSS audit).
* Map **use cases → required fields → sources → parsers**.
* Build a **minimal viable pipeline** before scaling.

### Task 4 — Configuration Dilemma: Planning and Implementation

* Document **data flows**: Source → Collector → Broker → SIEM/Data Lake → Alerts.
* Plan **time synchronization** (NTP), **TLS**, **failover**, and **backpressure** handling.
* Implement **schema governance** (e.g., ECS/OCSF) to reduce parser drift.

### Task 5 — Principles and Difficulties

* **Integrity:** hashing, immutability, WORM storage, RBAC.
* **Availability:** HA collectors, queues (Kafka/RabbitMQ), retry policies.
* **Scalability:** sharding, tiered storage, index lifecycle mgmt.
* **Observability of the pipeline:** health metrics, dead letter queues.

### Task 6 — Common Mistakes and Best Practices

* **Mistakes:** logging everything, inconsistent timestamps/timezones, no test data, dropping raw logs, unfixed noisy alerts.
* **Best Practices:** schema standards, field-level QA, sample-based tuning, use‑case driven ingestion, documented runbooks.

### Task 7 — Conclusion

You should now be able to design, implement, and continuously improve log pipelines aligned to detection and compliance goals.

---

## Practical Checklists

### Design & Scope

* [ ] Define primary **use cases** and SLAs (MTTD/MTTR targets).
* [ ] Build a **source–field–use‑case** matrix.
* [ ] Pick a **schema** (ECS/OCSF) and stick to it.
* [ ] Decide on **agents vs. agentless** per platform & risk.

### Retention & Storage

* [ ] Map **regulatory** requirements (e.g., PCI, HIPAA, ISO 27001).
* [ ] Tiered storage (**hot/warm/cold**), with **index lifecycle** policies.
* [ ] Document **retention by log type** (auth, DNS, EDR, proxy, cloud).
* [ ] Test **restore** and **replay** procedures regularly.

### Quality & Normalization

* [ ] Enforce **time sync** (NTP) and **UTC** timestamps.
* [ ] Validate **parsers** with sample events; add **schema tests** to CI.
* [ ] Normalize **hostnames**, **user IDs**, **IP fields**, **action verbs**.
* [ ] Track **dropped events** and **parse failures**.

### Security & Compliance

* [ ] TLS for data in transit; **WORM/immutable** for critical logs.
* [ ] RBAC & least privilege for SIEM/data lake.
* [ ] Sign/Hash archives; keep **chain of custody** notes.
* [ ] Access reviews & audit trails for log admins.

---

## Sample Configs

> Samples are generic and for learning only—adjust to your environment.

### Linux: rsyslog ➜ SIEM

```conf
# /etc/rsyslog.d/60-forward.conf
# Forward JSON-formatted logs to a remote collector over TLS
module(load="imuxsock")
module(load="imjournal" StateFile="imjournal.state")
module(load="omrelp")

# Template for JSON payload
template(name="jsonFmt" type="list") {
  constant(value="{")
  constant(value="\"timestamp\":\"")     property(name="timereported" dateFormat="rfc3339") constant(value="\",")
  constant(value="\"host\":\"")           property(name="hostname") constant(value="\",")
  constant(value="\"app\":\"")            property(name="programname") constant(value="\",")
  constant(value="\"msg\":\"")            property(name="msg") constant(value="\"}")
}

# Send everything to collector
*.* :omrelp:collector.example.com:2514;jsonFmt;RSYSLOG_SyslogProtocol23Format
```

### Windows: Event Forwarding

```powershell
# Create a subscription on the collector (WEF)
$Subscription = New-Object -TypeName Microsoft.Windows.EventCollector.Subscription
$Subscription.SubscriptionId = 'Security-Forwarding'
$Subscription.Description = 'Security, Sysmon, PowerShell operational logs'
$Subscription.Query = @'
<QueryList>
  <Query Id="0" Path="Security">
    <Select Path="Security">*[System[(EventID=4624 or EventID=4625 or EventID=4688)]]</Select>
  </Query>
  <Query Id="1" Path="Microsoft-Windows-Sysmon/Operational">
    <Select Path="Microsoft-Windows-Sysmon/Operational">*</Select>
  </Query>
</QueryList>
'@
# (Attach $Subscription to the collector using wecutil / Windows Event Collector GUI)
```

### Logrotate: Retention Policy

```conf
/var/log/myapp/*.log {
  weekly
  rotate 12           # keep 12 weeks
  compress
  delaycompress
  missingok
  notifempty
  dateext
  postrotate
    systemctl reload rsyslog > /dev/null 2>&1 || true
  endscript
}
```

---
