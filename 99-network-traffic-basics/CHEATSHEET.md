# Network Traffic Basics — Cheatsheet (quick commands & filters)

## Capture & inspect (pcap)
```bash
# Capture to file (first 100MB)
sudo tcpdump -i eth0 -s 0 -w capture.pcap -C 100

# Capture only traffic to/from specific IP
sudo tcpdump -i eth0 host 10.10.10.5 -w host-capture.pcap

# Capture only HTTP traffic
sudo tcpdump -i eth0 tcp port 80 -w http.pcap
```
## Read PCAP
```bash
# Open in Wireshark (GUI)
wireshark capture.pcap

# Quick inspect with tshark
tshark -r capture.pcap -q -z conv,tcp

# Export HTTP objects with tshark/strings (or use Zeek)
tshark -r capture.pcap -Y http -T fields -e http.request.method -e http.host -e http.request.uri
```
## Useful tcpdump filters
- host 1.2.3.4 — source or destination IP

- src 1.2.3.4 or dst 1.2.3.4 — direction-specific

- tcp port 443 — port filter

- net 10.0.0.0/8 — subnet filter

- tcp[13] & 0x02 != 0 — SYN packets

## Wireshark display filters (examples)
- ip.addr == 10.10.10.5

- tcp.port == 443

- http.request.method == "POST"

- dns.qry.name contains "malicious"

- tls.handshake.type == 1 (ClientHello)

## tshark one-liners
```bash
# Top talkers (by bytes)
tshark -r capture.pcap -q -z io,stat,0,"COUNT(frame)frame, SUM(frame.len)bytes" | head -n 50

# Extract DNS queries
tshark -r capture.pcap -Y "dns.qry.name" -T fields -e dns.qry.name | sort | uniq -c | sort -nr | head
```
## Zeek useful commands
- Run Zeek on pcap to generate logs:
```bash
zeek -r capture.pcap
# results: conn.log, dns.log, http.log, ssl.log, files.log
```
## Flow tools
- nfdump / nfcapd for NetFlow collectors — query flows and top talkers.

- Use flows to spot long-lived sessions or large byte transfers quickly.

## Quick investigation steps
- Identify suspicious IP in flows/netflow.

- Pull PCAP for time window around suspicious flow.

- Filter PCAP in Wireshark by IP and protocol.

- Inspect payloads, TLS SNI, HTTP Host, DNS qnames.

- Extract files or artifacts (File -> Export Objects in Wireshark or use Zeek files.log).

## Extract files from pcap (HTTP)
- In Wireshark: File → Export Objects → HTTP

- Or use tshark/scapy/Zeek file extraction.

---
