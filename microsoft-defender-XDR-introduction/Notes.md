# Notes — XDR: Introduction (Microsoft Defender XDR)

## What is XDR?

* Extended Detection and Response (XDR) centralises and correlates telemetry from multiple security products (endpoints, network, identity, cloud apps, email) to improve detection and response.

## Microsoft Defender XDR overview

* Defender XDR is a unified Microsoft offering integrating data from Microsoft 365 Defender (Endpoint, Identity, Email & Apps) and Cloud platform signals.
* Key capabilities: cross-signal correlation, automated investigations, threat analytics, and playbooks.

## Core components

* Data connectors (ingestors for endpoints, identity, email, cloud workloads)
* Analytics & correlation engine
* Incidents & alerts console
* Hunting and investigation tools
* Integrations (Microsoft Sentinel, SIEM, SOAR)

## RBAC (Role-Based Access Control)

* Unified RBAC allows role scoping across Defender components.
* Common roles: Global admin, Security reader, Security operator, SOC analyst, Incident responder.
* Custom unified RBAC roles can be created and assigned at tenant or resource scope.

## Defender XDR and Sentinel

* Sentinel can ingest Defender alerts and use playbooks / playbook automation for response.
* Defender provides enriched alerts that Sentinel can leverage for investigations and long-term analytics.

---
