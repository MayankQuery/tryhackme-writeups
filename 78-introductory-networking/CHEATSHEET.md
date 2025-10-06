# Common commands
## ping

- Linux/macOS: ping -c 4 <host>

- Windows: ping -n 4 <host>

## traceroute / tracert

- Linux/macOS: traceroute <host>

- Windows: tracert <host>

- Linux alternative (requires root for ICMP): traceroute -I <host>

## whois

- whois <domain>

## dig

- dig <domain> A +short

- dig <domain> MX +short

- dig <domain> NS +short

- dig @<resolver> <domain> ANY

## nslookup (alternative)

- Interactive: nslookup then server 8.8.8.8 and set q=mx then example.com

## Ports & Protocols (quick)

- HTTP — TCP/80

- HTTPS — TCP/443

- DNS — UDP/53 (TCP for zone transfers and large responses)

- SSH — TCP/22

- SMTP — TCP/25 (submission 587)

- DHCP — UDP/67 (server)/68 (client)

## Layer mapping quick reference

- Application → HTTP, DNS, SMTP, FTP

- Transport → TCP (reliable), UDP (unreliable)

- Network → IPv4, IPv6, ICMP

- Data Link → Ethernet, ARP

- Physical → cables, radio waves

## Quick troubleshooting checklist

- Can you ping the gateway? (ping <gateway-ip>)

- Can you ping a public IP? (ping 8.8.8.8)

- Can you resolve DNS? (dig example.com) — if not, check /etc/resolv.conf or adapter DNS settings

- Use traceroute to find where latency appears
