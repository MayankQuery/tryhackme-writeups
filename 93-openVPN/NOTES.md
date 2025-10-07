# Notes — OpenVPN (TryHackMe)

## 1) Overview
OpenVPN is the VPN client used to connect your machine (or AttackBox) to TryHackMe's lab network. This connection lets your attacker VM/host talk to lab machines that are otherwise isolated from the public Internet.

## 2) General flow (high level)
1. Download your `.ovpn` configuration file from TryHackMe Access → Networks.  
2. Install an OpenVPN client (Windows GUI, Tunnelblick/Viscosity on macOS, `openvpn` CLI or NetworkManager on Linux).  
3. Import the `.ovpn` file and connect.  
4. Verify new routes/interfaces (usually `tun0`) and confirm you can ping lab targets (e.g., `10.201.x.x` or `10.211.x.x`).

## 3) AttackBox vs Local VPN
- **AttackBox:** hosted VM provided by TryHackMe — already configured and recommended for most users. Do not run the VPN locally while AttackBox is connected.  
- **Local VPN:** use when you run your own VM/host. Download the `.ovpn` file and run the client on the machine you want to use for labs.

**Important:** Do not run the same VPN profile in more than one place simultaneously.

## 4) Common connection steps by OS

### Linux (CLI)
- Install `openvpn` or NetworkManager OpenVPN plugin.
- From the directory with the `.ovpn` file:
  ```bash
  sudo openvpn your_config_file.ovpn
  ```
- If using NetworkManager (GUI), import the .ovpn file and connect.

### Windows (GUI)
- Install OpenVPN GUI or the official OpenVPN client.

- Import the .ovpn file (usually via the client UI or by placing the file in the config folder).

- Right-click the OpenVPN tray icon → Connect.

### macOS
- Install Tunnelblick, Viscosity, or the official OpenVPN client.

- Import the .ovpn file and connect via the app UI.

## 5) Verify connectivity
- Check interface and routing:

- Linux/macOS: ip route or ifconfig / ip a

- Windows: route print or ipconfig

- Confirm presence of lab subnet (e.g., 10.211.11.0/24) in routes.

- Ping the lab gateway or a lab machine (example):
```bash
ping -c 3 10.211.11.10
```
- Use curl ifconfig.co or curl icanhazip.com to see your public IP (should remain your ISP IP — VPN to THM does not change public IP for outbound web unless routed).

## 6) Troubleshooting common issues
- VPN process exits / no permission: run with sudo or grant proper privileges.

- No tun0 / no route to lab: check firewall, verify the VPN server pushed routes, or re-import .ovpn.

- DNS/resolution issues for lab hostnames: you may need to check /etc/resolv.conf or the client’s DNS settings. Try pinging by IP.

- AttackBox conflict: ensure you are not connected locally and via AttackBox at the same time. Disconnect one.

- Credentials / expired token: re-download fresh .ovpn config from the Access page.

## 7) Safety & etiquette
- Use VPN only for TryHackMe lab activities.

- Do not use the VPN configuration on public networks without understanding routing.

- If you suspect your connection is leaking, disconnect and check configuration.
---
