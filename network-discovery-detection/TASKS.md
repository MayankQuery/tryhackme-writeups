# Tasks & Suggested Answers — Network Discovery Detection

> Paste these suggested answers into the TryHackMe task boxes (edit as you like).

## Task 1 — Introduction
**Q:** No answer needed.  
**A:** (N/A)

---

## Task 2 — Network Discovery
**Q:** What is network discovery and why do attackers perform it?  
**Suggested answer:**
Network discovery is the process of finding hosts, open ports and services on a network. Attackers perform it to map targets, find vulnerable services, and plan further exploitation or lateral movement.

---

## Task 3 — External vs Internal Scanning
**Q:** Differences between external and internal scanning and how detection differs?  
**Suggested answer:**
External scanning originates outside the network and usually targets public-facing IPs; detection focuses on firewall/edge IDS logs and IP reputation. Internal scanning occurs inside the network (compromised host or insider); detection uses ARP anomalies, internal flow logs, and endpoint telemetry. Internal scans are often noisier locally (ARP, SMB) and can indicate a compromise.

---

## Task 4 — Horizontal vs Vertical Scanning
**Q:** Explain horizontal vs vertical scanning with examples.  
**Suggested answer:**
Horizontal scanning probes the same port/service across many hosts (e.g., scanning port 80 across a subnet) to find which hosts run that service. Vertical scanning probes many ports on a single host to enumerate services on that host. Detection: horizontal → many hosts hit on same port; vertical → one host with many ports probed.

---

## Task 5 — The Mechanics of Scanning
**Q:** How do common scanning techniques work and how would you detect them?  
**Suggested answer:**
Techniques include ARP discovery for local hosts, ICMP/ping sweeps, TCP SYN scans, and service/version probes. Detect via packet captures (SYN flood/patterns), IDS rules for SYN/port sweep detection, NetFlow analysis for spikes in connection attempts, and host logs showing unusual service queries.

---

## Task 6 — Conclusion
**Q:** Summarize defensive steps to detect network discovery.  
**Suggested answer:**
Maintain network and host telemetry (flows, packet captures, endpoint logs), create IDS/Suricata rules for scanning patterns, baseline normal behaviour, use rate-limiting/blacklists for suspicious IPs, and investigate internal ARP or SMB anomalies quickly.

---

## Extra — Sample Evidence Text (for screenshot / pcap)
**Q:** If asked for evidence of detection in the lab, use:  
**Suggested answer:**
Captured a high volume of SYN packets from 10.0.0.20 to multiple destination IPs/ports within 60 seconds (see pcap/suricata alert). The IDS generated an alert for a SYN scan (SID 1000002).

