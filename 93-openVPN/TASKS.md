# Tasks & Suggested Answers — OpenVPN

> Copy-paste these suggested answers into the TryHackMe task boxes where relevant.

## Task 1 — Connecting to our network
**Q:** Download your configuration file from the access page.  
**Suggested answer:**  
Downloaded the `.ovpn` configuration file from the TryHackMe Access → Networks tab.

---

## Task 2 — Connecting with Windows
**Q:** Describe how you connect on Windows.  
**Suggested answer:**  
Install OpenVPN GUI, import the `.ovpn` config (or place it in the `config` folder), then right-click the OpenVPN tray icon and select **Connect**.

---

## Task 3 — Connecting with MacOS
**Q:** Describe how you connect on macOS.  
**Suggested answer:**  
Install Tunnelblick or Viscosity, import the `.ovpn` file, then connect using the app's menu bar icon. Confirm `tun` interface and route via `ifconfig`/`netstat -nr`.

---

## Task 4 — Connecting with Linux
**Q:** Describe how you connect on Linux.  
**Suggested answer:**  
Install `openvpn` and run `sudo openvpn your_config_file.ovpn` in a terminal, or import the `.ovpn` using NetworkManager and connect. Verify `ip a` shows `tun0` and `ip route` lists the lab subnet (e.g., `10.211.11.0/24`).

---

## Task 5 — Using TryHackMe without a VPN
**Q:** How can you use TryHackMe without running a local VPN?  
**Suggested answer:**  
Use the TryHackMe **AttackBox** (Start AttackBox in the room). The AttackBox connects to the lab network for you; do not run the same VPN profile locally while the AttackBox is active.

---

## Task 6 — Check you're connected
**Q:** Provide one command or method you used to confirm connectivity.  
**Suggested answer:**  
Ran `ip route` and confirmed the lab subnet `10.211.11.0/24` is present, then `ping -c 3 10.211.11.10` to verify reachability.

---

## Extra — Troubleshooting note (if asked)
**Q:** I couldn't connect — what did I try?  
**Suggested answer (example):**  
Re-downloaded the `.ovpn` file, restarted the OpenVPN client, checked for `tun0` with `ip a`, verified routes with `ip route`, and confirmed no other VPN/AttackBox conflict. Fixed by reconnecting the client.
