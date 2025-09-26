# CHEATSHEET — Quick commands & references

## Quick commands

**Network discovery & scanning**

- fast TCP connect scan (service detection)
```bash
nmap -sT -sV -p- <target>
```

- stealth SYN scan
```bash
nmap -sS -sV -p1-65535 <target>
```

**Packet capture & analysis**

- capture everything on interface
```bash
sudo tcpdump -i eth0 -w /tmp/capture.pcap
```

- capture only traffic to/from ip
```bash
sudo tcpdump -i eth0 host 10.0.0.5 -w host5.pcap
```

- quick stats with tshark
```bash
tshark -r /tmp/capture.pcap -q -z io,stat,0
```

**Live connection inspection**
```bash
ss -tulnp # show listeners and processes
netstat -ant # legacy, shows TCP connections
```

**Firewall / IPS**

- ufw status
```bash
sudo ufw status verbose
```

- iptables list
```bash
sudo iptables -L -n -v
```

- blocking an IP temporarily
```bash
sudo iptables -I INPUT -s 1.2.3.4 -j DROP
```

**Log parsing snippets**

- top source IPs in syslog-style firewall log
```bash
grep "SRC=" /var/log/ufw.log | awk '{for(i=1;i<=NF;i++) if($i ~ /^SRC=/) print $i}' | cut -d= -f2 | sort | uniq -c | sort -nr | head
```

Splunk-like quick query examples (conceptual):

- Find repeated failed logins in last 24 hours
```bash
index=auth sourcetype=linux "Failed password" | stats count by src
```

## Common ports (useful quick reference)

- 21 — FTP  
- 22 — SSH  
- 23 — Telnet  
- 25 — SMTP  
- 53 — DNS  
- 80 — HTTP  
- 443 — HTTPS  
- 3389 — RDP  

## Signs of common attacks
- **Port scan:** many SYNs to many TCP ports in short time  
- **Brute-force auth attempts:** repeated failed logins with many usernames  
- **Exposed service exploit:** unusual inbound connection to admin ports (e.g., RDP/SSH) followed by suspicious process creation
