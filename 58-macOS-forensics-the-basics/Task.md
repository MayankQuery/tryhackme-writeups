# Task 1 — Introduction

**Key Idea:** Apple’s security model increases user safety but raises acquisition complexity for investigators.

**My Notes**
- Case reference: Apple–FBI dispute highlighted device access constraints.
- Focus of room: macOS tooling & workflow essentials.

---

  # Task 2 — A Brief History of macOS

**Highlights**
- Classic Mac OS → OS X → macOS naming transition.
- Security hardening over time: Gatekeeper, XProtect, SIP, Notarization, TCC.

**Takeaways**
- Modern macOS versions increasingly reduce investigator access without proper credentials or live response workflows.

---

  # Task 3 — HFS+ File System

- Legacy file system; still encountered on older disks and externals.
- Catalog, Extents, Attributes B-Trees.
- Journaled; supports hard links (Time Machine on HFS+).

**Forensics Pointers**
- Volume header, journal replay, catalog record carving.

---

# Task 4 — APFS File System

- Container → Volumes (e.g., Preboot, Recovery, VM, Data).
- Snapshots, cloning, sparse files; strong encryption support.
- Case-sensitive optional; native TRIM.

**Forensics Pointers**
- Enumerate containers/volumes; snapshot diffing; Preboot mapping to OS installs.

---

# Task 5 — Directory Structure & Domains

- Domains: **System**, **Local**, **User**, **Network**.
- Key paths: `/System`, `/Library`, `/Users/<user>/Library`, `/private/var`.

**Artifacts**
- LaunchAgents/Daemons, login items, persistence locations.

---

# Task 6 — File Formats

- `plist` (XML & binary), `sqlite` (Safari, Messages, Quarantine), unified logs, zsh/bash histories.
- Convert binary plist: `plutil -p file.plist` or `plutil -convert xml1`.

**Common DBs**
- `~/Library/Safari/History.db`
- `~/Library/Preferences/com.apple.*.plist`

---

# Task 7 — Acquisition Challenges

- FileVault 2 full-disk encryption (FDE).
- T2/Apple Silicon (Secure Enclave), Activation Lock.
- SIP (System Integrity Protection), Transparency Consent & Control (TCC).

**Implications**
- Need credentials/keys; live response may be required; limited offline access.

---

# Task 8 — Mounting APFS Disk Image

**On macOS (with credentials/keys)**
```bash
hdiutil attach image.dmg -readonly
# If encrypted, you'll be prompted for passphrase or key
```

On Linux (read-only)

Install libfsapfs / apfs-fuse if available.

mkdir -p Artifacts/mounts/apfs_ro
apfs-fuse image.dd Artifacts/mounts/apfs_ro

Always mount read-only. Work on verified copies.

---

# Task 9 — Conclusion

**What I learned**
- Mapping macOS security features to forensic workflow.
- Handling APFS containers, snapshots, and common artifacts.
- Practical constraints with encrypted/modern hardware.

---
