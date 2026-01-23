# Notes – Nmap Live Host Discovery

---

## 🔹 Why Host Discovery Matters

- Scanning offline systems wastes time
- Creates unnecessary network noise
- Efficient discovery improves scan accuracy

---

## 🔹 What is Nmap?

- Network Mapper
- Created by Gordon Lyon (Fyodor)
- Released in 1997
- Open-source and industry standard

---

## 🔹 Host Discovery Techniques

### ARP Scan
- Uses ARP requests
- Fast and reliable
- Works only on local networks

### ICMP Scan
- Uses ICMP Echo, Timestamp, and Address Mask requests
- Often blocked by firewalls

### TCP Ping Scan
- Sends SYN or ACK packets
- Useful when ICMP is blocked

### UDP Ping Scan
- Sends UDP packets to common ports
- Slower and less reliable

---

## 🔹 Target Enumeration

- Single IP
- IP ranges
- CIDR notation
- Host lists

---

## 🔹 Reverse DNS Lookup

- Resolves IP addresses to hostnames
- Useful for asset identification
- Can be enabled or disabled in Nmap

---

## 🧠 Key Takeaway

Effective reconnaissance starts with identifying live hosts accurately before moving to service discovery.
