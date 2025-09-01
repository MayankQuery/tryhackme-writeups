# Notes
# Glossary (Mobile DFIR)
- **AFU/BFU**: After/Before First Unlock; dictates key availability
- **FBE**: File-Based Encryption (Android)
- **SEP/TEE**: Secure Enclave Processor (iOS) / Trusted Execution Environment
- **EDL**: Emergency Download mode (Qualcomm)
- **JTAG/ISP/Chip-off**: Hardware-level acquisition techniques
- **MDM**: Mobile Device Management

---

# Acquisition Matrix
| Scenario | State | Depth | Feasibility | Notes |
|---|---|---|---|---|
| iOS, AFU, passcode known | AFU | Filesystem/Logical | High | Prefer unencrypted backup + agent if warranted |
| iOS, BFU, unknown passcode | BFU | Physical | Low | Boot-ROM/DFU exploits if applicable |
| Android, AFU, USB debug on | AFU | Logical/FS | Med-High | ADB pull; consider vendor/MDM limits |
| Android, locked, FileVault-like FBE | BFU | Physical | Low | EDL/ISP possible, high risk |

---

# iOS Acquisition Notes
- Prefer **unencrypted** iTunes/idevicebackup2 backups when scope allows
- Record device identifiers (Model, iOS version, build, serial, UDID)
- If using agent: document trust prompts, provisioning profiles, tool versions
- Verify with hashing and minimal preview (do not alter source)

---

# Android Acquisition Notes
- Confirm **USB debugging** and OEM unlocking status (document!)
- ADB-based logical acquisition: `adb backup` (legacy) or `adb pull` app data on debug builds / rooted devices
- Be mindful of **scoped storage**, FBE, and SELinux contexts
- Consider custom recovery, EDL, or vendor tools where lawful and supported

---

# Legal & Chain of Custody
- Confirm warrant/consent scope; restrict to relevant data
- Maintain continuous chain-of-custody records (see template)
- Log date/time (with timezone), operator, device condition, tool versions
- Store originals **read-only**; analyze verified copies

---

# Mobile Triage Checklist
- [ ] Photograph device (front/back/IMEI/serial), state (locked/unlocked), battery %
- [ ] Enable Faraday/airplane mode as policy dictates
- [ ] Record OS/build, security patch level
- [ ] Select acquisition method; note reasoning
- [ ] Hash outputs; store logs; complete evidence forms

---

# Tool Comparison (High-Level)
| Tool | Type | Strengths | Considerations |
|---|---|---|---|
| idevicebackup2/iTunes | iOS logical | Fast, broad | Encrypted backups limit parsing |
| ADB (pull/backup) | Android logical | Accessible | Limited by FBE/scoped storage |
| Commercial suites (UFED/AXIOM/Oxygen) | Mixed | Broad device support, parsing | Licensing; document versions |
| Specialist (EDL/JTAG/ISP) | Physical | Deep access | High risk; invasive; expertise required |
