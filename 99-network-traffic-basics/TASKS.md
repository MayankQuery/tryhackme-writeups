# Network Traffic Basics — Task answers & guidance

> NOTE: These answers are generic and designed to be pasted into TryHackMe — replace IPs/timestamps with lab-specific values if asked.

---

## Task 1 — Introduction
**Q:** Continue to discover the purpose of network traffic analysis  
**A:** (No direct answer required — proceed to learning tasks)

---

## Task 2 — What is the Purpose of Network Traffic Analysis?
**Answer (sample):**
Network Traffic Analysis (NTA) provides visibility into communications across networks to detect malicious behaviour, investigate incidents, and monitor performance. It helps identify anomalous traffic patterns (scanning, beaconing, exfiltration), correlate network events with host logs, and support threat hunting and incident response.

---

## Task 3 — What Network Traffic Can We Observe?
**Answer (sample):**
- **Packets** (PCAP): headers and payloads for deep inspection.  
- **Flows** (NetFlow/IPFIX/sFlow): aggregated metadata showing who talked to whom, when, and how much data was transferred.  
- **Protocol-level logs:** HTTP headers, DNS queries/responses, TLS handshakes (SNI & cert info).  
- **Connection behavior:** session duration, retransmissions, flags, and error patterns.

---

## Task 4 — Network Traffic Sources and Flows
**Answer (sample):**
Typical sources and flows include:  
- **Internet-facing flows (North-South):** client ↔ web servers, external C2 connections.  
- **Internal flows (East-West):** server-to-server communication, lateral movement.  
- **Service-specific flows:** HTTP(S), DNS, SMTP, SSH, database connections.  
- **Telemetry feeds:** NetFlow exporters, IDS logs (Zeek/Suricata), proxy logs.

---

## Task 5 — How Can We Observe Network Traffic?
**Answer (sample):**
- **Packet capture:** Use `tcpdump` and Wireshark/tshark for full packet captures.  
- **Flow collection:** Use NetFlow/IPFIX/sFlow collectors to monitor metadata at scale.  
- **Protocol parsers / IDS:** Use Zeek or Suricata to extract HTTP, DNS, SSL logs and recover files.  
- **Combining sources:** Correlate PCAP/flows with firewall, proxy, and endpoint logs to build a timeline and context.

---

## Task 6 — Conclusion
**Answer (sample):**
Network Traffic Analysis is a foundational skill for both defensive and investigative roles. By combining packet captures, flow metadata, and protocol parsing, analysts can detect suspicious network behaviour, trace attack paths, and gather high-confidence evidence to support containment and remediation.

---

## Quick paste-ready commands (examples to include when asked)
```bash
# Show recent auth traffic (example)
tshark -r capture.pcap -Y "tcp.port == 22" -T fields -e ip.src -e ip.dst -e tcp.flags

# List top DNS queries from a capture
tshark -r capture.pcap -Y "dns.qry.name" -T fields -e dns.qry.name | sort | uniq -c | sort -nr | head
