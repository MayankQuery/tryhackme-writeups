# Linux Incident Surface (TryHackMe) – Study Repo

This repository is a **clean, copy‑paste friendly** companion to the TryHackMe room **“Linux Incident Surface”** in the *Advanced Endpoint Investigations* module.  
It’s built for fast note‑taking, reproducible triage, and interview‑ready documentation.

> This repo is **for learning and blue‑team practice**. Test only on systems you own or have permission to assess.

---

## Contents

- `notes.md/` - summary notes
- `cheatsheets.md/` — quick commands and references

---

## Quickstart

```bash
# clone your copy
git clone https://github.com/<your-username>/linux-incident-surface-THM.git
cd linux-incident-surface-THM

# run safe triage collectors (stdout + files in ./artifacts)
chmod +x tools-scripts/*.sh
sudo tools-scripts/collect_processes.sh
sudo tools-scripts/collect_network.sh
sudo tools-scripts/list_persistence.sh
sudo tools-scripts/disk_footprints.sh
sudo tools-scripts/parse_logs.sh
```

### Screenshot
![Room Completion](https://github.com/MayankQuery/tryhackme-writeups/blob/main/linux-endpoint-investigation-linux-incident-surface/images/linux-endpoint-investigation-linux-incident-surface-completion.png)

---

## Room Context (non‑spoiler)
- Focus: **where** incidents leave traces on Linux endpoints.
- Angles: **attack surface** (entry/abuse) vs **incident surface** (evidence/IOCs).
- You’ll practice: enumerating processes, sockets, persistence, on‑disk traces, logs.

---

## Notes for Recruiters
This repo demonstrates:
- Practical triage scripts
- Structured IR documentation
- Clear, teachable explanations

---
