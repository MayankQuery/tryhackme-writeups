# Cheatsheet — quick commands


## VLAN / trunk
- `show vlan brief`
- `show interfaces trunk`


## Port security
- `switchport port-security`
- `show port-security interface Gi0/2`


## ACL troubleshooting
- `show access-lists`
- `show ip interface brief`


## Packet capture
- `tcpdump -i eth0 -w capture.pcap host <ip>`
- `tshark -r capture.pcap -Y "http"`
