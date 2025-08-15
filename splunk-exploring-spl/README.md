# TryHackMe – Splunk: Exploring SPL

## Room Overview
**Platform:** TryHackMe  
**Difficulty:** Medium  
**Time to Complete:** ~120 minutes  
**Category:** SOC Level 2 | SIEM | Splunk  
**Room Link:** [Splunk: Exploring SPL](https://tryhackme.com/room/splunkexploringspl)  

This room focuses on **Search Processing Language (SPL)** in Splunk, covering key fundamentals like filtering, structuring results, and using transformational commands to gain optimized insights from large datasets.

---

## Learning Objectives
In this room, I learned:
- What is **Search Processing Language (SPL)** and why it’s essential.
- How to apply **filters** to narrow down large result sets.
- Using **transformational commands** for data processing.
- Modifying the **order** and structure of results.
- Building **chained queries** to go from simple to complex search logic.

---

## Room Prerequisites
Before starting this room, it’s recommended to complete:
- [Intro to SIEM](https://tryhackme.com/room/introtosiem)
- [Splunk: Basics](https://tryhackme.com/room/splunkbasics)

---

## Tasks Breakdown

### Task 1 – Introduction
```bash
# SPL: Search Processing Language
# Used in Splunk to query, filter, transform, and visualize machine data.
```
### Task 3 – Search & Reporting App Overview
```bash
Navigated the Search & Reporting app in Splunk.

Learned where to input SPL queries and how results are displayed.
```
### Task 4 – SPL Overview
```bash
# Basic SPL query format
index=<index_name> source=<source_name> <search_terms>

SPL uses commands, functions, and arguments combined to refine searches.
```
### Task 5 – Filtering the Results
```bash
# Example: Filter events from the "web" index containing the keyword "error"
index=web "error"

Filters reduce noise and improve analysis efficiency.
```
### Task 6 – Structuring the Search Results
```bash
# Example: Display only specific fields
index=web | fields host, status, method

Field selection helps focus on relevant attributes.
```
### Task 7 – Transformational Commands
```bash
# Example: Count events grouped by status code
index=web | stats count by status

Commands like stats, top, rare transform raw events into meaningful summaries.
```
## Key Takeaways

- SPL is powerful yet simple when broken into logical steps.

- Filtering early in queries improves performance.

- Transformational commands turn raw logs into actionable intelligence.

- Query chaining enables complex analysis from basic building blocks.

## Skills Gained

- SPL query creation & optimization

- Filtering and field selection

- Transformational data processing in Splunk

- Chaining queries for advanced analysis
