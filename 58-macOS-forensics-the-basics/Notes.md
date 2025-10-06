# APFS Quick Notes
- Container-based; multiple volumes share space.
- Key volumes: `Macintosh HD`, `Macintosh HD - Data`, `Preboot`, `Recovery`, `VM`.
- Snapshots: useful for point-in-time analysis.
- Encryption: per-volume keys; FileVault integrates with user credentials.

---

# Domains Model & Paths
- **System**: `/System`, read-only on modern macOS.
- **Local**: `/Library` (machine-wide settings/artifacts).
- **User**: `/Users/<name>/Library` (per-user artifacts).
- **Network**: network-hosted resources (less common on standalone Macs).
