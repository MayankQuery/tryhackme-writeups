# Intro to Cold System Forensics – Notes & Write‑ups


This repo captures my learnings and personal write‑ups for **TryHackMe – Intro to Cold System Forensics**. It focuses on offline ("dead box") analysis: planning, acquisition, preservation, and a tour of practical tools.


## Objectives
- Differentiate **live** vs **cold** system forensics.
- Understand challenges & opportunities of offline examinations.
- Practice **acquisition & preservation** with hashing and chain of custody.
- Get hands‑on with tools across imaging, triage, and analysis.


## What’s inside
- **Tasks/**: Clean, spoiler‑safe task notes and reflections.
- **Notes/**: Checklists, concepts, and ready‑to‑use commands.
- **Findings/**: Evidence register and case summary (template‑based).
- **Scripts/**: Tiny helpers for mounting images and verifying hashes.


## Quick Start
1. Clone the repo: `git clone https://github.com/<your-user>/intro-cold-system-forensics.git`
2. Skim **Notes/** to prep your workflow.
3. Use **Scripts/** while practicing on images (E01/RAW/VMDK/ISO).
4. Log artefacts in **Findings/evidence_register.csv** and keep hashes in **Findings/hashes.sha256**.


## Tooling (non‑exhaustive)
- Imaging: `dd`, `dcfldd`, `dc3dd`, `ewfacquire`, **Guymager**, **FTK Imager**
- Validation: `sha256sum`, `md5sum`, `hashdeep`
- Analysis: **Autopsy/The Sleuth Kit**, `mmls`, `fls`, `icat`, `tsk_recover`, **log2timeline/Plaso**, **RegRipper** (Windows), **Velociraptor** (triage)


> **Ethics & Legal**: Always maintain chain of custody, write‑block source media, and document every action.


## License
MIT — see [LICENSE](LICENSE).
