# Nmap Live Host Discovery – Cheatsheet

---

## 🔍 Basic Host Discovery

### Ping Scan (No Port Scan)
```bash
nmap -sn <target>
```
🧪 ARP Scan (Local Network)
```bash
nmap -sn -PR <target>
```
🌐 ICMP Host Discovery
```bash
nmap -sn -PE <target>

nmap -sn -PP <target>

nmap -sn -PM <target>
```
🔐 TCP Ping Scan
```bash
nmap -sn -PS <target>

nmap -sn -PA <target>
```
📡 UDP Ping Scan
```bash
nmap -sn -PU <target>
```
🧾 Reverse DNS Lookup

Enable:
```bash
nmap -R <target>
```

Disable:
```bash
nmap -n <target>
```
🔧 Alternative Tools
arp-scan
```bash
sudo arp-scan <network>
```
masscan
```bash
sudo masscan <target> --ping
```

---
