# Cheatsheet — Quick Commands & Detection Snippets

## Quick discovery commands (lab)
- ARP / local discovery:
  - `sudo arp-scan --interface=eth0 --localnet`
  - `netdiscover -r 10.0.0.0/24`
- Basic host ping sweep:
  - `for ip in $(seq 1 254); do ping -c1 10.0.0.$ip >/dev/null && echo "Alive: 10.0.0.$ip"; done`
- Nmap examples:
  - Vertical (full port range SYN scan): `nmap -sS -p- 10.0.0.5`
  - Horizontal (specific port across subnet): `nmap -sS -p 22 10.0.0.0/24`
  - Service & version detection: `nmap -sV -p 22,80 10.0.0.10`
- Fast internet-style scan (lab only):
  - `masscan 10.0.0.0/24 -p22 --rate=1000`

## Packet capture / inspection
- Capture: `sudo tcpdump -i eth0 -w capture.pcap`
- Read live: `sudo tcpdump -i eth0 tcp and '(tcp[tcpflags] & (tcp-syn) != 0)'`
- tshark/Wireshark filters:
  - SYN packets: `tcp.flags.syn == 1 && tcp.flags.ack == 0`
  - ARP requests: `arp.opcode == 1`
  - ICMP echo: `icmp.type == 8`

## IDS (Suricata/Snort) sample rules
> Example Snort/Suricata rules to detect scanning behaviour (lab use only).

- **Detect horizontal port scan (lots of same port on many hosts)**:
```markdown
alert tcp any any -> $HOME_NET 22 (msg:"SURICATA SSH horizontal scan detected"; detection_filter: track by_src, count 20, seconds 60; sid:1000001; rev:1;)
```

- **Detect SYN scan (many SYN packets)**:
```markdown
alert tcp any any -> $HOME_NET any (msg:"SURICATA SYN scan detected"; flags: S; detection_filter: track by_src, count 50, seconds 30; sid:1000002; rev:1;)
```

- **Detect ARP scan (high ARP rate)**:
```pgsql
alert arp any any -> $HOME_NET any (msg:"ARP scan detected"; detection_filter: track by_src, count 30, seconds 10; sid:1000003; rev:1;)
```

## Useful Wireshark display filters
- Show SYN without ACK: `tcp.flags.syn == 1 && tcp.flags.ack == 0`
- Show connections to port 22: `tcp.dstport == 22 || tcp.srcport == 22`
- Show ARP broadcasts: `arp`

## Detection heuristics (threshold ideas)
- >20 unique destination IPs for the same source-port within 60s → horizontal scan
- >100 SYN packets to many ports on one host within 60s → vertical/host scan
- Large bursts of ARP requests from one host → internal discovery attempt
