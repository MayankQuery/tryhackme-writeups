# Tasks & Walkthrough — Attacking ICS Plant #1

This file breaks down the room tasks, what to do, and helpful hints.

## Task 1 — Introduction to OT/ICS
**Objective:** Understand OT/ICS components and the difference between IT and OT priorities.  
**What to read:** Notes section (SCADA, PLC, RTU, HMI).  
**Answer:** No answer needed (informational).

---

## Task 2 — Introduction to Modbus protocol
**Objective:** Learn Modbus basics (registers, coils, transports).  
**Checklist**
- Explain difference between Modbus TCP and Modbus RTU.
- Know standard TCP port (502).
- Know the difference between coils and holding registers.

**Hints**
- Modbus uses function codes to read/write.
- Start with read-only queries.

---

## Task 3 — Discovery
**Objective:** Find Modbus devices on the lab network and enumerate basic information.

**Suggested steps**
1. Run a light nmap scan for port 502:
   - Example (lab only): `nmap -sV -p 502 --script vuln,default <target>` *(replace `<target>` with lab IP)*  
   *(Use appropriate nmap scripts for Modbus discovery that are safe and read-only.)*
2. Use a Modbus client to attempt read-only queries (e.g., read holding registers).
3. Capture traffic in Wireshark and filter with `modbus` to inspect frames.

**Checklist**
- Identify target IP(s) with port 502 open.
- Record unit IDs and any readable registers you find.

---

## Task 4 — Play to learn
**Objective:** Interact with device registers to understand what data is available.

**Exercises**
- Read a range of holding registers and map their likely meaning.
- Capture traffic while interacting with HMI to correlate control actions with Modbus frames.

**Hints**
- Record which registers change when you operate simulated controls from the HMI.

---

## Task 5 — Attack (lab-only)
**Objective:** Understand the security risk: writing to registers can alter plant behavior.

**Important safety note**
- Only perform write operations in the TryHackMe lab or on authorized devices. Writing to real-world ICS equipment without permission is illegal and dangerous.

**Lab steps (high-level)**
1. Identify a safe register/coil in the lab that corresponds to a non-destructive control (e.g., a simulated indicator).
2. Perform a write operation to observe effect (lab only).
3. Revert changes to return system to initial state.

**Hints**
- Start with a single coil/register write (single write) rather than multiple writes.
- Monitor system response in Wireshark and HMI.

---

## Final checklist (for your report)
- [ ] List discovered IPs and unit IDs
- [ ] Document readable registers and their possible meanings
- [ ] Capture at least one Modbus read frame (Wireshark)
- [ ] Demonstrate one safe write in the lab and document its effect
- [ ] Explain mitigation strategies (network segmentation, firewalling port 502, authentication/gateway devices)

---
