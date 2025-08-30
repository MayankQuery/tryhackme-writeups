# macOS Triage Checklist (Read-Only)

- [ ] Verify hashing of acquired image (SHA-256).
- [ ] Identify APFS containers & volumes.
- [ ] Mount read-only (prefer snapshots if available).
- [ ] Enumerate persistence: LaunchAgents/Daemons, Login Items.
- [ ] Pull user artifacts: Safari DBs, QuarantineEvents, Recent Items.
- [ ] Export interesting plists as XML; diff preferences.
- [ ] Build event timeline; correlate with logs.

---

# Acquisition Checklist

- [ ] Confirm legal authority & consent.
- [ ] Determine FileVault / T2 / Apple Silicon status.
- [ ] Capture credentials/keys if available (live response).
- [ ] Use trusted write blockers; document chain of custody.
- [ ] Create verified working copy; keep original sealed.
