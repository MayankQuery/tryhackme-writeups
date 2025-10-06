## Task 1 — Introduction

No answer needed.

## Task 2 — The OSI Model: An Overview

Exercise: List the seven OSI layers and one responsibility of each.

Suggested answer (short):

- Physical — transmit raw bits over a medium

- Data Link — frame delimiting and MAC addressing

- Network — routing and logical addressing (IP)

- Transport — reliable delivery (TCP), ports

- Session — manage sessions/maintain connections

- Presentation — encryption, translation, serialization

- Application — end-user services (HTTP, DNS)

## Task 3 — Encapsulation

Exercise: Explain encapsulation in your own words and draw or list the headers added from Application down to Physical.

Suggested answer: Application payload → TCP/UDP header → IP header → Ethernet header → physical bits.

## Task 4 — The TCP/IP Model

Exercise: Map the OSI layers onto the TCP/IP model and give one example protocol per TCP/IP layer.

Suggested mapping:

- Link → Ethernet (AR)P

- Internet → IP

- Transport → TCP/UDP

- Application → HTTP/DNS/SMTP

## Task 5 — Networking Tools: ping

Exercise: Use ping to check if example.com is reachable. What is the round-trip time (RTT)?

Example commands & expected output:

Linux/macOS: ping -c 4 example.com

Windows: ping -n 4 example.com

What to note: packet loss, min/avg/max RTT

## Task 6 — Networking Tools: traceroute

Exercise: Run traceroute example.com (or tracert on Windows). Describe the hops and locate where latency increases.

Example:

Linux/macOS: traceroute example.com

Windows: tracert example.com

What to note: the IPs and ASNs of intermediate hops (if visible) and hop count.

## Task 7 — Networking Tools: WHOIS

Exercise: Run whois example.com and identify registrar, creation date, and name servers.

Example: whois example.com

What to note: registrar, registration/expiration dates, registrant contact (where available), name servers.

## Task 8 — Networking Tools: dig

Exercise: Use dig to fetch DNS records for example.com. Show A, MX, and NS records.

Example commands:

- dig example.com A +short

- dig example.com MX +short

- dig example.com NS +short

Optional: Use dig @8.8.8.8 example.com ANY to query a specific resolver.

## Task 9 — Further reading

Exercise: Pick one resource from the further reading section and summarize one new thing you learned.
