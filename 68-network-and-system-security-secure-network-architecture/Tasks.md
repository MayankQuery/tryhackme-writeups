# Task 1 — Introduction


No answer required — proceed to next task.

---

# Task 2 — Network Segmentation


**Why segment?** Limits lateral movement, reduces blast radius, enforces policy.


**Common methods:**
- VLANs + trunking
- Subnetting + routing + ACLs
- Firewalls between zones (physical or virtual)
- Software-defined segmentation / microsegmentation (e.g., host-based firewalls)


**Example design:**
- Management VLAN (10.0.0.0/24)
- Server VLAN (10.0.1.0/24)
- User VLANs (10.0.2.0/24, 10.0.3.0/24)
- DMZ (10.0.10.0/24)


**Practical controls:**
- Port security on switches (limit MACs)
- Private VLANs for isolating hosts
- ACLs on routers and firewalls prohibiting east-west traffic where unnecessary


**Quick commands (Cisco IOS):**
```bash
vlan 10
name MANAGEMENT
interface GigabitEthernet0/1.10
encapsulation dot1Q 10
ip address 10.0.0.1 255.255.255.0
!
interface GigabitEthernet0/1.20
encapsulation dot1Q 20
ip address 10.0.1.1 255.255.255.0
```

---

# Task 3 — Common Secure Network Architectures


**DMZ (Demilitarized Zone)**
- Public-facing services (web, mail) in DMZ with strict rules to internal network.
- Typical setup: Internet -> Edge Firewall -> DMZ -> Internal Firewall -> Internal Network.


**Three-tier architecture**
- Web tier (DMZ), Application tier (isolated), Database tier (most restricted).


**Zero Trust elements**
- Authenticate & authorize every request, microsegmentation, identity-aware proxies.

---

# Task 4 — Network Security Policies and Controls


**Policies:**
- Acceptable Use, Remote Access, Change Management, Password & Key Management.


**Controls:**
- NAC (802.1X) for port-level access
- Firewall rules and zone-based policies
- Logging/monitoring (NetFlow, SIEM)
- Patch management and vulnerability scanning

---

# Task 5 — Zone-Pair Policies and Filtering


**Zone concept:** Group interfaces into zones (e.g., INTERNET, DMZ, INTERNAL).


**Policy examples:**
- Allow INTERNET -> DMZ: TCP 80,443 to web servers only
- Deny INTERNET -> INTERNAL: all
- Allow INTERNAL -> INTERNET: HTTP(S) only, with logging


**Example ACL (Cisco IOS):**
```bash
ip access-list extended INTERNET_TO_DMZ
permit tcp any host 10.0.10.10 eq 80
permit tcp any host 10.0.10.10 eq 443
deny ip any 10.0.1.0 0.0.0.255
```

**Zone-based firewall pseudo-config:**

- create zones
- assign interfaces
- create policies (zone-pair) with class-maps and policy-maps

---

# Task 6 — Validating Network Traffic


**Tools:** tcpdump, tshark, Wireshark, NetFlow/sFlow, firewall logs


**Commands:**
- tcpdump example:

**capture HTTP traffic to web server**
```bash
sudo tcpdump -i eth0 host 10.0.10.10 and tcp port 80 -w web_http.pcap
```
- Verify firewall counters, ACL hit counts, and logs.

---

# Task 7 — Addressing Common Attacks


**ARP spoofing / poisoning**
- Mitigations: Dynamic ARP Inspection (switch), static ARP for critical hosts, DHCP snooping.


**VLAN hopping**
- Disable DTP, avoid native VLANs carrying user traffic, restrict trunk ports.


**MAC flooding**
- Configure port-security on switches to limit MAC addresses per port.


**DDoS**
- Rate-limit, upstream scrubbing, use CDN or cloud-based mitigation.


**Example: enable port-security (Cisco):**
```bash
interface GigabitEthernet0/2
switchport mode access
switchport port-security
switchport port-security maximum 2
switchport port-security violation restrict
```

---

# Task 8 — Conclusion


Secure network architecture is layered — combine segmentation, filtering, strong policies and monitoring. No single control solves everything; defense-in-depth is essential.

