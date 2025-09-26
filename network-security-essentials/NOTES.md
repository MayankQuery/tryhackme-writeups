# NOTES — Network Security Essentials

## Task 1 — Introduction
- **Goal:** Understand what the room covers and the main learning outcomes.
- **Key points:** An enterprise network is a collection of multiple systems: firewalls, routers, AD servers, DB/app servers, endpoints, and wireless APs. The perimeter is the logical boundary between trusted internal networks and untrusted networks (Internet).

## Task 2 — Lab Connection
- Connect using the TryHackMe AttackBox or your own Kali/Ubuntu VM. If using local VM:
  - Ensure NAT/Bridged networking is set to allow access to the target machines.
  - Typical connection: `ssh -i yourkey ubuntu@<attackbox-ip>` (only for custom labs).
- Basic verification: `ip a`, `ping 8.8.8.8`, `curl http://example.com`.

## Task 3 — A Network - Overview
- Networks contain layers: edge/perimeter, DMZ, internal network, and endpoints.
- Perimeter devices include: edge router, firewall, IDS/IPS, VPN concentrator, and proxy.
- Example diagram (text):
  - Internet -> Edge Router -> Firewall -> DMZ (web servers) -> Internal (AD, DB)

## Task 4 — Network Visibility
- Tools used for visibility:
  - **tcpdump** — capture packets on the host: `sudo tcpdump -i eth0 -w capture.pcap`.
  - **tshark** — command-line Wireshark: `tshark -r capture.pcap -q -z io,stat,0`.
  - **Wireshark** — GUI analysis.
  - **netstat / ss** — view open ports and connections: `ss -tulnp`.
  - **nmap** — enumeration and discovery: `nmap -sS -sV -p- <target>`.
- Common signs of suspicious traffic: repeated SYNs to many ports (scan), many failed auth attempts, data exfiltration patterns (large outbound transfers).

## Task 5 — Network Perimeter
- The perimeter defends the internal network; devices and roles:
  - **Edge Router:** routes traffic; ACLs may be applied.
  - **Firewall:** implements stateful packet inspection and denies/permits traffic based on rules.
  - **IDS/IPS:** monitor (IDS) and optionally block (IPS) suspicious traffic.
  - **Proxy / Web Filter:** inspects HTTP/HTTPS traffic; can block malicious sites.

## Task 6 — Network Perimeters: Monitoring and Protecting
- Monitoring stack:
  - **Packet capture:** tcpdump, SPAN ports
  - **Network sensors:** Suricata, Snort
  - **Log aggregation / SIEM:** syslog -> Logstash/Fluentd -> Elasticsearch/Kibana or Splunk
- Example Suricata start: `suricata -c /etc/suricata/suricata.yaml -i eth0`.
- Example log pipeline: `rsyslog` -> `/var/log/firewall.log` -> Ship to SIEM.

## Task 7 — Perimeter Logs: Investigating the Breach
- Typical perimeter logs to check:
  - Firewall logs (accept/deny, src/dst IPs, ports, actions)
  - IDS alerts (signature name, priority, packets)
  - Proxy logs (URLs, user, timestamp)
  - Authentication logs (failures: `/var/log/auth.log` or AD logs)

### Quick log search examples (Linux)
- Show failed SSH attempts:
```bash
sudo grep "Failed password" /var/log/auth.log | tail -n 50
```

- Find repeated connection attempts from an IP:
```bash
sudo grep "SRC=" /var/log/ufw.log | awk '{print $NF}' | sort | uniq -c | sort -nr | head
```

- Check firewall denies in a syslog-formatted firewall log:
```bash
sudo grep "DROP" /var/log/kern.log | less
```

### Investigative approach
1. Identify timeline: gather timestamps from logs.
2. Identify source IP(s) and target assets.
3. Look for lateral movement indicators: new SMB connections, AD authentications.
4. Correlate IDS alerts with logs & captures.
5. Contain & escalate: block IPs at perimeter, isolate impacted host.

## Task 8 — Conclusion
- Reiterate main lessons: detect early via perimeter monitoring, escalate suspicious activity, and understand components and their roles.
