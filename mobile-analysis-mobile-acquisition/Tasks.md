# Task 1 – Introduction
Mobile Acquisition introduces core ideas for obtaining data from iOS/Android devices for DFIR:
- Understand device state (BFU vs AFU)
- Choose acquisition depth (logical / filesystem / physical)
- Validate integrity (hashing, logs, chain of custody)

---

# Task 2 – Mobile Devices Within Digital Forensics
- **Ecosystem**: OEM variability, OS fragmentation, proprietary services
- **Data sources**: user data, app sandboxes, system logs, secure elements, cloud
- **States**: BFU (Before First Unlock) vs AFU (After First Unlock)
- **Goal alignment**: scope → consent/warrant → minimize alteration → preserve integrity

---

# Task 3 – Challenges With Mobile Device Forensics
- Strong encryption (File-Based Encryption, Secure Enclave/TEE)
- Lock states, biometrics, screen locks, MDM policies
- Rapid OS & app updates; OEM skins
- Proprietary connectors/protocols; closed ecosystems
- Legal/consent and privacy boundaries

---

# Task 4 – APTs Meet Mobile Devices
- APTs leverage mobile for persistence and proximity to targets
- Vectors: 0-day/1-day exploits, sideloading, malicious profiles, baseband & RCS abuse
- Objectives: credential theft, surveillance, lateral movement via cloud tokens
- Defenses: patch hygiene, least privilege, MDM posture, threat intel

---

# Task 5 – Acquisition Techniques
**Depths**
- **Logical**: backups/exports (iTunes/idevicebackup2, ADB); fastest, least intrusive
- **File System**: app sandboxes, system dirs; requires elevated access or agent
- **Physical**: full block-level; rarer on modern, secure devices; high evidentiary value

**Common methods**
- iOS backups (unencrypted preferred for analysis; note if encrypted)
- ADB backup (legacy/limited), MTP export, custom agents
- RAM capture is generally not feasible on mobile without exploits

---

# Task 6 – Specialist Acquisition Techniques
- **Boot-ROM exploits** (e.g., checkm8) for certain iOS devices
- **EDL/Firehose** on Qualcomm
- **JTAG/ISP/Chip-off** (last resort; invasive; risk to data)
- **DFU/Recovery** modes on iOS to load acquisition agents
- Document device model, OS build, patch level, and exploit/tool versions

---

# Task 7 – Practical (Simulated)
Steps practiced in the room's simulated suite:
1. Identify device & state (model, OS, BFU/AFU)
2. Choose technique (backup vs filesystem/physical) based on constraints
3. Acquire and log everything (time, operator, tool versions)
4. Hash artifacts (SHA-256/MD5) and verify
5. Minimal validation (preview parsers) without altering the evidence
Artifacts & hashes are summarized in `Findings/practical_summary.md`.

---

# Task 8 – Conclusion
**Recap**
- Platform protections and privacy mechanisms
- APT motivations and tradecraft on mobile
- Acquisition depths and decision factors
- Specialist techniques for edge cases
- End-to-end workflow: scope → acquire → validate → document

