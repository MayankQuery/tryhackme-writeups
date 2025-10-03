# Notes — Network Discovery Detection

## 1) Introduction
**Network discovery** is the set of techniques attackers use to identify hosts, services and topology in a target network. Detection of discovery activity is often one of the earliest indicators of reconnaissance and possible follow-on exploitation.

Common reasons attackers perform discovery:
- Identify live hosts
- Find open services and versions
- Map network ranges, subnets and VLANs
- Discover privileged endpoints and misconfigurations

---

## 2) Types of Network Discovery
- **Active discovery:** sending probes (e.g., ping, TCP SYNs, port scans) to elicit responses.
- **Passive discovery:** listening to broadcast traffic, ARP, DNS, or monitoring routing/ARP tables to infer hosts without direct probes.

---

## 3) External vs Internal Scanning
- **External scanning:** performed from outside the network boundary (internet-facing). Often targets public IP ranges and perimeter defenses.
  - Detection clues: repeated connections from a single external IP, systematic port sweeps across many hosts.
- **Internal scanning:** performed from within the network (on-prem, compromised host). More likely to use ARP, NetBIOS, SMB queries and tends to be faster and noisier within local subnets.
  - Detection clues: abnormal ARP volume, local port scanning patterns, unusual lateral movement attempts.

---

## 4) Horizontal vs Vertical Scanning
- **Horizontal scanning:** probes the same port/service across many hosts (e.g., port 22 on many IPs).
  - Purpose: find hosts running a specific service.
- **Vertical scanning:** probes many ports on a single host (e.g., scanning all ports on 10.0.0.5).
  - Purpose: enumerate services on a specific host.

Detection signatures differ — horizontal scans produce many hosts with the same port probed; vertical scans produce many ports probed on one host.

---

## 5) Mechanics of Scanning (common tools & flags)
- `nmap` — flexible scanner. Examples (see CHEATSHEET for quick flags):
  - `nmap -sS -p- 10.10.10.10` — SYN scan all ports (vertical).
  - `nmap -sS -p 22 10.0.0.0/24` — horizontal scan for SSH on subnet.
- `arp-scan`, `netdiscover` — detect local hosts via ARP broadcasts (fast local enumeration).
- `masscan` — very fast internet-scale scanning (be careful / use in labs only).
- `tcpdump` / `tshark` / Wireshark — capture probe packets for analysis.

---

## 6) Detection & Logging Strategies
- **Network telemetry:** collect flow logs (NetFlow/IPFIX), packet captures, and IDS logs to identify scanning patterns.
- **Baseline behavior:** maintain baseline of normal traffic volumes and ports; detect deviations.
- **Signature-based detection:** detect SYN floods, port sweeps using IDS rules (Suricata/Snort).
- **Anomaly detection:** repeated connections across many IPs or many ports in short time windows.
- **Endpoint logs:** failed authentication attempts or unusual SMB/NetBIOS queries can indicate internal scanning.
- **Rate limits & blacklists:** temporarily block IPs that exceed scan thresholds.

---

## 7) Lab walkthrough (recommended steps)
1. Start target machine and confirm network connectivity.
2. From attacker VM:
   - Run an ARP discovery (`arp-scan` / `netdiscover`) to enumerate local hosts.
   - Run a horizontal scan (e.g., `nmap -p 22 10.0.0.0/24`) and observe IDS alerts or pcap capture.
   - Run a vertical scan against a single host (e.g., `nmap -p1-1000 10.0.0.5`) and inspect response patterns.

3. On detection side:
   - Capture traffic with `tcpdump -i <iface> -w scan.pcap`.
   - Load into Wireshark and apply filters to view SYNs, ARP requests, or ICMP echo requests.
   - Review IDS logs for dropped/alerted rules.

---

## 8) Notes on Responsible Use
- Only scan hosts/networks you have explicit permission to test (e.g., TryHackMe lab).
- Many scanning tools can trigger security controls or cause disruption; use them safely in lab environments.

