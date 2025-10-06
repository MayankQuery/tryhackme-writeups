# Notes — Attacking ICS Plant #1

## 1. OT / ICS Fundamentals
- **Operational Technology (OT)**: systems used to monitor and control industrial processes.
- **SCADA**: Supervisory Control and Data Acquisition — a collection of supervisory computers, HMI, PLCs/RTUs, and communications that manage industrial processes.
- **PLC (Programmable Logic Controller)**: specialized industrial computer that monitors sensors and controls actuators via deterministic logic.
- **RTU (Remote Terminal Unit)**: similar to PLCs, often used for remote telemetry.
- **HMI (Human Machine Interface)**: graphical/operator interface to view and control processes.
- **Design tradeoffs**: OT prioritizes availability and real-time behavior over confidentiality and some integrity protections; therefore many devices and protocols are inherently insecure by default.

## 2. Modbus Protocol (high level)
- **Modbus** is a simple, widely used industrial protocol for communication with PLCs and field devices.
- Two common transports:
  - **Modbus TCP**: runs over TCP/IP (default port **502**).
  - **Modbus RTU**: runs over serial links (RTU frames).
- **Addressing**: Modbus devices have unit IDs (slave IDs) and registers/coils addressed by offsets.
- **Data model**:
  - **Coils** — single-bit read/write (discrete outputs).
  - **Discrete Inputs** — single-bit read-only (digital inputs).
  - **Input Registers** — read-only 16-bit registers (sensors).
  - **Holding Registers** — read/write 16-bit registers (configuration, setpoints).
- **Function codes**: read/write coils/registers (e.g., read coils, read holding registers, write single coil, write single register, write multiple registers).

## 3. Discovery & Enumeration (conceptual)
- Identify hosts offering Modbus/TCP service (port 502).
- Common steps:
  - Use safe scans to detect open port 502 (e.g., `nmap` service/version detection).
  - Use Modbus-aware scripts or clients to query device info (read-only operations first).
  - Capture traffic with Wireshark and inspect Modbus function codes and registers.
- Always start with non-destructive reads before attempting writes.

## 4. Play & Attack (lab mindset)
- In the lab, you will practice reading registers and, in controlled conditions, writing to coils/registers to observe impact (e.g., toggling a simulated valve).
- Writing to registers on real equipment can cause physical damage — only perform write ops in the TryHackMe environment or on devices you own and control.

## 5. Tools & tips
- **nmap**: for port/service discovery. Use Modbus NSE scripts for discovery.
- **modpoll / qmodbus**: command-line and GUI Modbus clients for read/write operations.
- **pymodbus**: Python library for programmatic Modbus interaction (great for automating lab tasks).
- **Wireshark**: filter `modbus` protocol to analyze traffic.

---
