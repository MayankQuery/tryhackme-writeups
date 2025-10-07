# Cheatsheet — OpenVPN Quick Commands & Checks

## Linux (CLI)
- Install OpenVPN (Debian/Ubuntu):
```bash
sudo apt update && sudo apt install -y openvpn
```
- Connect using the .ovpn file:
```bash
sudo openvpn path/to/your_config.ovpn
```
- Run in background (systemd or screen/tmux recommended) or use NetworkManager GUI.
- Check interfaces & routes:
```bash
ip a
ip route
```
- Test connectivity to lab:
```bash
ping -c 3 10.211.11.10
# or
traceroute 10.211.11.10
```
- Show tun interface traffic (live):
```bash
sudo tcpdump -i tun0 -n -c 50
```
## Windows (GUI)
- Install OpenVPN GUI and put the .ovpn in C:\Program Files\OpenVPN\config (or import via client).
- Right-click tray icon → Connect.
- Check routes:
```powershell
route print
```
- Check adapter & IP:
```powershell
ipconfig /all
```
- Test ping:
```powershell
ping 10.211.11.10 -n 3
```
## macOS (Tunnelblick / Viscosity)
- Import the .ovpn into Tunnelblick/Viscosity and connect via the menu bar icon.
- Check interface & route:
```bash
ifconfig
netstat -nr
```
- Ping lab host:
```bash
ping -c 3 10.211.11.10
```
## Helpful diagnostics (cross-platform)
- Show last 50 lines of OpenVPN client log (helps identify pushed routes/DNS):

- Linux: check the terminal where openvpn runs or journalctl -u openvpn if using systemd.

- Windows/macOS: view client log from GUI (Log/Details).

- Confirm lab subnet route presence:

- Look for route like 10.211.11.0/24 via <tun> in ip route / route print.

- If you cannot reach a specific machine but route exists:

- Try arp -n or ping other hosts in the subnet.

- Check local firewall (on attacker machine) blocking ICMP.

## Quick fixes
- Restart OpenVPN client / reconnect.

- Re-download .ovpn from TryHackMe Access page and re-import.

- If using AttackBox, stop local VPN. If using local VPN, ensure AttackBox is not active.
---
