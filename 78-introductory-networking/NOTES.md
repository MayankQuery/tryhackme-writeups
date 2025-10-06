## 1. Introduction

- Goal: Give a foundation to understand how systems communicate across networks and where common tools fit.

- Networking is the practice of connecting devices so they can exchange information. It includes physical hardware (cables, switches) and logical concepts (protocols, addressing).

## 2. The OSI Model: An Overview

- The OSI model divides networking responsibilities into seven layers:

- Physical — bits on the wire (cables, electrical signals)

- Data Link — frames and MAC addressing (Ethernet)

- Network — packets and logical addressing (IP)

- Transport — end-to-end communication (TCP/UDP)

- Session — sessions and dialogues

- Presentation — data formats, encryption

- Application — user-facing protocols (HTTP, DNS, SMTP)

- Key concept: Each layer provides services to the layer above and uses services of the layer below.

## 3. Encapsulation

- When sending data, each layer adds a header (and sometimes a footer) to the data from the layer above. This process is called encapsulation.

- Example: Application data → Transport header (TCP) → Network header (IP) → Data Link header (Ethernet) → Physical bits.

## 4. The TCP/IP Model

- A simpler, more practical model often used:

- Link (Physical + Data Link)

- Internet (Network)

- Transport (Transport)

- Application (Session + Presentation + Application)

## 5. How models look in practice

- Browsing a website: Browser (HTTP) → TCP → IP → Ethernet → wire

- DNS lookup: Application (DNS) → UDP (or TCP) → IP → Link

## 6. Networking tools (quick intro)

- ping — test reachability using ICMP echo request/reply

- traceroute / tracert — show the path packets take to reach a host

- whois — query domain registration and ownership records

- dig / nslookup — query DNS records directly (A, AAAA, MX, NS, TXT)

## 7. Further reading

- RFC 791 (IPv4), RFC 793 (TCP)

- Official TryHackMe pathways: Networking fundamentals

- Books: Computer Networking: A Top-Down Approach (Kurose & Ross)
