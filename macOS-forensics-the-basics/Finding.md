# Findings Summary

## High-Level
- Consolidated understanding of HFS+ vs APFS, and impact on evidence handling.

## Notable Artifacts (Templates)
- Quarantine events (downloads/installers)
- Safari/WebKit histories
- LaunchAgents/Daemons
- Login items & persistence

## Open Questions
- Snapshot diffing workflow to quickly enumerate recent changes.
Findings/Artifacts_Correlation.md

---

# Artifacts Correlation

- **Download → Execution**: QuarantineEventsV2.sqlite → Gatekeeper → unified logs.
- **Persistence**: LaunchAgents/LaunchDaemons → property list inspection.
Findings/Timelines/README.md

---

# Timelines

- Place generated CSV/JSON timelines here (e.g., from log archives or DBs).
