# Cheatsheet — Quick Reference

## Ports & Protocols
- **Modbus TCP default port:** `502` (TCP)
- **Common Wireshark filter:** `modbus`

## Basic Modbus concepts
- **Coils** — Single-bit R/W (discrete outputs)
- **Discrete Inputs** — Single-bit R (digital inputs)
- **Input Registers** — 16-bit R (sensors)
- **Holding Registers** — 16-bit R/W (setpoints, config)

## Common Modbus function codes (conceptual)
- Read Coils
- Read Discrete Inputs
- Read Holding Registers
- Read Input Registers
- Write Single Coil
- Write Single Register
- Write Multiple Registers

## Useful commands (lab use only — verify flags per tool version)
- `nmap` (service/port discovery):
  - `nmap -sV -p 502 <target>`  
  - `nmap -sV -p 502 --script modbus-discover,modbus-info <target>` *(if NSE scripts are available)*
- `wireshark`:
  - Start capture, use display filter `modbus`
- `modpoll` (example read-only operation):
  - `modpoll -m tcp -t 3 -r 0 -c 10 <IP>` *(consult `modpoll` help for correct flags)*
- `pymodbus` (Python) — conceptual snippet:
  ```python
  # Conceptual: use only in controlled lab
  from pymodbus.client.sync import ModbusTcpClient
  client = ModbusTcpClient('10.10.10.10', port=502)
  rr = client.read_holding_registers(0, 10, unit=1)  # read registers 0-9
  print(rr.registers)
  client.close()

## Detection & Mitigation (summary)
Detection

- Monitor unexpected Modbus traffic on port 502.

- Use IDS/IPS signatures for Modbus anomalies.

Mitigation

 - Network segmentation: put ICS networks on isolated VLANs.

- Firewall rules: restrict who can reach port 502.

- Use gateways/proxies that enforce access control and logging.

- Implement strong change control and monitor register writes.
