# TryHackMe – Mobile Acquisition (Advanced Endpoint Investigations / Mobile Analysis)

This repo contains my study notes, task write-ups, checklists, and practical artifacts for the **TryHackMe: Mobile Acquisition** room.

> **Room:** Advanced Endpoint Investigations → Mobile Analysis → Mobile Acquisition  
> **Difficulty:** Easy | **Est. time:** 45 min | **Status:** Completed 100%

## What I learned
- OS & data protection mechanisms on mobile platforms (iOS & Android)
- Why advanced persistent threats (APTs) target mobile devices
- Depths of acquisition (logical, filesystem, physical) and when to use them
- Specialist techniques (JTAG/ISP/Chip-off/EDL, bootloader exploits like checkm8, BFU/AFU considerations)
- Hands-on simulated acquisition workflow, validation, and documentation

## Repo layout
- `Tasks/` – concise write-ups for each TryHackMe task
- `Notes/` – deeper guides (iOS/Android paths, matrices, legal notes, triage)
- `Findings/` – practical summary and example hash outputs
- `Practical/` – step-by-step lab flow + screenshots placeholder
- `Scripts/` – handy helpers for hashing and minimal acquisitions

## Quick Start
```bash
# Hash all artifacts in ./Practical and write to Findings/integrity_hashes_example.txt
bash Scripts/generate_hashes.sh Practical Findings/integrity_hashes_example.txt
```
