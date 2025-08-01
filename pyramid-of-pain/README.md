# TryHackMe: Pyramid of Pain 
This repository documents my practical walkthrough and summary notes for the **Pyramid of Pain** room on TryHackMe.

## Room Overview
The Pyramid of Pain is a cybersecurity model created by David Bianco to categorize the types of indicators defenders use to detect adversaries—and the relative level of difficulty it creates for those adversaries to change them.

> "The amount of pain you cause an adversary depends on the types of indicators you are able to make use of."  
> — David Bianco

Link to room: [TryHackMe - Pyramid of Pain](https://tryhackme.com/room/pyramidofpain)

---

## Pyramid Levels & Analysis

| Level | Indicator Type       | Difficulty for Adversary | Description                                                                  |
|-------|----------------------|--------------------------|------------------------------------------------------------------------------|
| 1️     | **Hash Values**      | Trivial                  | Unique to a single file. Easiest to change.                                  |
| 2️     | **IP Addresses**     | Easy                     | Static IPs are easy to change or rotate.                                     |
| 3     | **Domain Names**     | Simple                   | Domains can be re-registered or swapped.                                     |
| 4️     | **Host Artifacts**   | Annoying                 | Requires adversary to change behaviors/tools.                                |
| 5️     | **Network Artifacts**| Annoying                 | Involves protocol changes or traffic patterns.                               |
| 6️     | **Tools**            | Challenging              | Switching tools takes effort and learning.                                   |
| 7️     | **TTPs**             | Tough                    | Changing Tactics, Techniques, and Procedures demands significant adjustment. |

---

## Practical Exercise

- Explored each indicator level in detail.
- Mapped real-world APT behaviors against the pyramid.
- Applied detection logic to elevate defender visibility.

**Example APT Group Analysis: APT28 (Fancy Bear)**  
- Indicators Identified: Domains, Tools (e.g., Mimikatz), IPs  
- Defensive Strategy: Detect PSExec & WinRM lateral movement → categorized as **TTPs**

---

## Screenshots


---

## Summary Notes

- The higher you go on the Pyramid, the more pain you cause to attackers.
- Focus on detecting **TTPs** and **Tooling** over low-level indicators like IPs or hashes.
- Effective blue teaming requires strategic thinking, not just reactive alerts.

---

## Room Completed

- 🟢 Status: **Completed**
- 🕒 Time Spent: 30 minutes
- 🏷 Difficulty: Easy
- 👨‍💻 Platform: [TryHackMe](https://tryhackme.com/)

---
