# Network Traffic Basics — Notes & Walkthrough

## 1) What is Network Traffic Analysis (NTA)?
Network Traffic Analysis (NTA) is the capture, inspection, and interpretation of data flowing across a network. NTA aims to provide visibility into communications (what, who, when, how), detect anomalies, and support incident response and threat hunting.

---

## 2) Why NTA matters
- Detect lateral movement and data exfiltration that endpoint tools might miss.  
- Baseline normal behaviour for anomaly detection.  
- Correlate network events with host logs and SIEM alerts.  
- Investigate suspicious connections, malware C2, and unusual data transfers.

---

## 3) What can we observe?
- **Packets:** full packet captures (PCAP) with headers and payloads.  
- **Flow metadata:** NetFlow/IPFIX/sFlow — summarised metadata (src/dst IP, ports, bytes, packets, timestamps).  
- **Session context:** TCP session start/stop, retransmits, flags.  
- **Protocol fields:** HTTP headers, TLS SNI, DNS queries/responses, SMTP metadata.  
- **Indicators:** unusual ports, high-volume transfers, odd protocol usage, beaconing patterns.

---

## 4) Typical network traffic sources & flows
- **North-South (ingress/egress):** traffic entering or leaving the network (internet <> datacenter).  
- **East-West:** internal traffic between hosts (server-to-server, lateral movement).  
- **Client-server:** typical web, DNS, mail flows.  
- **Peer-to-peer / Service meshes:** microservices and P2P patterns.
- **Telemetry:** NetFlow collectors, IDS/IPS alerts, proxy logs.

---

## 5) Observation methods
- **Full packet capture (PCAP):** highest fidelity (Wireshark/tshark). Good for deep forensics — heavy storage cost.  
- **Packet slicing / selective capture:** capture only headers or first N bytes of payload.  
- **Flows (NetFlow/IPFIX):** metadata at scale — good for long-term storage and trend analysis.  
- **IDS telemetry (Zeek/Suricata):** protocol parsing and extracted logs (HTTP, DNS, SSL, files).  
- **Endpoint + network correlation:** combine host logs with NTA for richer context.

---

## 6) What to look for (detection signals)
- Repeated DNS queries to unusual domains (beaconing).  
- Short periodic connections to the same external IP/port (C2).  
- Abnormal volumes: large uploads (possible exfil) or many small connections (scanning).  
- Suspicious TLS behavior: missing SNI for web traffic, self-signed certs for normal services.  
- Ports atypical for service (RDP on non-standard port).  
- Long-lived connections from unexpected hosts.

---

## 7) Investigation workflow (high-level)
1. **Triage:** examine flows to find suspicious IPs / high-volume connections.  
2. **Pivot to PCAP:** capture or retrieve PCAP for the suspect timeframe.  
3. **Deep inspect:** use Wireshark/tshark/Zeek logs to parse protocols and extract evidence.  
4. **Contextualize:** correlate with logs (proxy, firewall, endpoint) and threat intel.  
5. **Contain & remediate:** block IPs, isolate hosts, notify owners, and collect artifacts.

---

## 8) Basic protocol reminders
- **DNS:** qname, response codes, TTLs — look for algorithmic domains or fast flux.  
- **HTTP:** Host header, User-Agent, POST bodies (if not encrypted).  
- **TLS:** SNI in Client Hello, cert properties; many threats try to hide in TLS.  
- **ICMP:** often used for reconnaissance or tunnelling (rare but possible).

