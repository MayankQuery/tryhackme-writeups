# FAT32 Analysis — TryHackMe Room Walkthrough & Notes

> **Room:** *FAT32 Analysis* (Advanced Endpoint Investigations → File System Analysis)
> **Difficulty:** Hard • **Est. time:** 90 min • **Status:** ✅ Completed (100%)

![Room Banner](./assets/room-banner.png)

## What you’ll learn

* Explore the **FAT32 filesystem structure** (Reserved, FAT, and Data Areas)
* Apply **forensic analysis & data recovery** techniques specific to FAT32
* Detect **defense evasion** techniques on FAT32

  * T1564.001 Hidden Files and Directories
  * T1070.006 Indicator Removal: Timestomp
  * T1070.004 File Deletion
  * T1070.009 Clear Persistence
* Use **Autopsy**, **The Sleuth Kit**, and other tools effectively

---

## Repo Structure

```
FAT32-Analysis-THM/
├─ README.md
├─ notes/
│  ├─ walkthrough.md
│  ├─ findings.md
│  └─ timeline.csv
├─ evidence/               # Place the provided disk/image files here (not included)
│  └─ sample.img           # (placeholder) FAT32 image from the room
├─ scripts/
│  ├─ cluster_extract.sh   # quick icat helper
│  └─ fat32_bpb_template.txt
└─ assets/
   └─ room-banner.png      # optional banner/screenshot
```

---

## Prerequisites

* TryHackMe Rooms: *Pre Security*, *Intro to Cold System Forensics*, *Autopsy*
* Tools installed:

  * **Autopsy** (or Sleuth Kit)
  * **The Sleuth Kit**: `mmls`, `fsstat`, `fls`, `icat`, `istat`
  * **HxD/010 Editor** (or any hex editor)
  * **binwalk**, **photorec** (optional)

---

## Quick Start (Analyst Workflow)

> Replace `evidence/sample.img` with your actual image path.

```bash
# 1) Identify partitions
mmls evidence/sample.img

# 2) Note the FAT32 partition start sector (e.g., 2048); compute byte offset:
#    offset_bytes = start_sector * 512
#    Example: 2048 * 512 = 1048576
#    Then use -o <start_sector> or -i raw with -b for tools that support it.

# 3) Filesystem overview
fsstat -o 2048 evidence/sample.img

# 4) Root directory listing (top-level)
fls -o 2048 -r -p evidence/sample.img > notes/root_listing.txt

# 5) Carve a file by inode/cluster
#    Find inode with `fls`, then:
icat -o 2048 evidence/sample.img <inode> > recovered.bin

# 6) Inspect metadata/timestamps on a file
istat -o 2048 evidence/sample.img <inode> > notes/istat_<inode>.txt
```

### Autopsy (GUI) Steps

1. New Case → Add Data Source → **Disk Image** → select `sample.img`.
2. Verify **FAT32** recognized; explore **Data Artifacts** & **File System**.
3. Enable **File Metadata** view to compare timestamps (Created/Modified/Access).
4. Use **Keyword Search** (e.g., “hidden”, “.lnk”, suspicious extensions).
5. Flag files with **Hidden/System** attributes or mismatched timestamps.
6. Export suspect files for deeper analysis.

---

## FAT32 Structure (At a Glance)

### Areas

* **Reserved Area**: Boot Sector (BPB), FSInfo, Backup Boot Sector
* **FAT Area**: Typically **2 FATs** (FAT0 & FAT1) — cluster allocation tables
* **Data Area**: Root directory and file/directory clusters

### Key BPB Fields (Boot Sector @ sector 0 of the FAT32 partition)

| Field            | Offset | Size | Meaning                                    |
| ---------------- | -----: | ---: | ------------------------------------------ |
| `BS_jmpBoot`     |   0x00 |    3 | Boot jump                                  |
| `BS_OEMName`     |   0x03 |    8 | OEM label                                  |
| `BPB_BytsPerSec` |   0x0B |    2 | **Bytes/sector** (commonly 512)            |
| `BPB_SecPerClus` |   0x0D |    1 | **Sectors/cluster** (e.g., 8)              |
| `BPB_RsvdSecCnt` |   0x0E |    2 | **Reserved sectors** (incl. boot sector)   |
| `BPB_NumFATs`    |   0x10 |    1 | **Number of FATs** (usually 2)             |
| `BPB_TotSec32`   |   0x20 |    4 | Total sectors                              |
| `BPB_FATSz32`    |   0x24 |    4 | **Sectors per FAT**                        |
| `BPB_RootClus`   |   0x2C |    4 | **Root directory start cluster** (often 2) |
| `BPB_FSInfo`     |   0x30 |    2 | FSInfo sector number                       |
| `BPB_BkBootSec`  |   0x32 |    2 | Backup boot sector                         |
| `BS_VolLab`      |   0x47 |   11 | Volume label                               |

> Use a hex editor to validate values and calculate real offsets for the FAT & Data regions.

---

## Analysis Techniques

### 1) Detect Hidden Files & Directories (T1564.001)

* Check **DOS attributes**: `Hidden`, `System`, `ReadOnly`, `Archive`
* `fls -r` lists entries; look for:

  * **Leading 0xE5** (deleted entries) that may still have data
  * **Long File Name (LFN)** entries followed by short 8.3 names
* Look for **clusters allocated but not referenced** (orphans)
* Compare **FAT chains** vs directory entries to spot anomalies

**Commands**

```bash
# List all (recursive) with paths; include deleted
fls -o 2048 -r -p -d evidence/sample.img | tee notes/fls_recursive.txt

# Cross-check suspicious entries with istat
istat -o 2048 evidence/sample.img <inode>
```

### 2) Timestomp Detection (T1070.006)

* FAT32 timestamps (DOS time):

  * **Created**, **Modified**, **Accessed** (date only for A)
* Red flags:

  * **Inconsistent** Created/Modified times
  * **Future-dated** or **epoch** anomalies (e.g., 1980-01-01 default)
  * Multiple files aligned to exact seconds/mins unrealistically

**Command**

```bash
istat -o 2048 evidence/sample.img <inode> | tee -a notes/timestamps.txt
```

### 3) File Deletion & Recovery (T1070.004)

* Deleted directory entries are marked (first char → `0xE5`)
* Data may remain until clusters are reallocated
* Steps:

  1. Identify deleted entries with `fls -d`
  2. Recover content with `icat`
  3. Validate integrity (hashing)

**Commands**

```bash
# Show deleted entries
fls -o 2048 -r -p -d evidence/sample.img > notes/deleted.txt

# Recover by inode
icat -o 2048 evidence/sample.img <inode> > recovered/<inode>.bin

# Hash
sha256sum recovered/<inode>.bin >> notes/hashes.txt
```

### 4) Clear Persistence (T1070.009) on FAT32

* Look for **startup artifacts** on removable FAT32:

  * `autorun.inf`, suspicious `.lnk`, dropped executables
* Check **Volume Label** changes and **Root** for short-lived payloads
* Validate **Last Access** vs expected usage patterns

---

## Handy Commands (Cheat Sheet)

```bash
# Partition map
mmls evidence/sample.img

# Filesystem stats (confirm FAT32, cluster size, root cluster)
fsstat -o <start_sector> evidence/sample.img

# List root / recursive
fls -o <start_sector> -p evidence/sample.img
fls -o <start_sector> -r -p evidence/sample.img

# Deleted files only
fls -o <start_sector> -r -p -d evidence/sample.img

# Metadata + timestamps
istat -o <start_sector> evidence/sample.img <inode>

# Carve by inode
icat -o <start_sector> evidence/sample.img <inode> > out.bin

# Find slack space clusters (heuristic: search for signatures)
strings -a out.bin | head
```

---

## Scripts

### `scripts/cluster_extract.sh`

```bash
#!/usr/bin/env bash
# Quick helper to extract a file by inode using icat (Sleuth Kit)
# Usage: ./cluster_extract.sh evidence.img START_SECTOR INODE OUTPUT
set -e
IMG="$1"; START="$2"; INODE="$3"; OUT="$4"
if [[ -z "$IMG" || -z "$START" || -z "$INODE" || -z "$OUT" ]]; then
  echo "Usage: $0 <image> <start_sector> <inode> <output_file>"
  exit 1
fi
icat -o "$START" "$IMG" "$INODE" > "$OUT"
echo "[+] Wrote $OUT"
```

### `scripts/fat32_bpb_template.txt`

```
# Paste your BPB values here for quick reference:
BytesPerSector: 
SectorsPerCluster: 
ReservedSectors: 
NumFATs: 
FATSz32 (sectors): 
RootCluster: 
FSInfoSector: 
BackupBootSector: 
```

---

## Verification Checklist

* [ ] Validated **BPB** values in Boot Sector & Backup Boot Sector
* [ ] Confirmed **NumFATs = 2** and **FATSz32** matches `fsstat`
* [ ] Mapped **Root Cluster** correctly; directory tree enumerated
* [ ] **Hidden/System** files identified & exported
* [ ] **Deleted** entries reviewed; recoverable files carved & hashed
* [ ] **Timestamps** reviewed for anomalies (timestomp indicators)
* [ ] Checked **root** for `autorun.inf`, suspicious `.lnk`, dropped binaries
* [ ] Documented findings + timeline in `notes/`

---

## Tools & Versions (suggested)

* Autopsy (latest)
* Sleuth Kit (e.g., 4.12+): `mmls`, `fsstat`, `fls`, `icat`, `istat`
* Hex editor (HxD/010 Editor)
* Optional: PhotoRec, binwalk

---

## Findings Template (`notes/findings.md`)

```markdown
# Findings — FAT32 Analysis

## Environment
- Image: evidence/sample.img
- FAT32 start sector: 2048 (offset 1,048,576 bytes)
- Cluster size: 4096 bytes (example)
- Root cluster: 2

## Key Artifacts
- Hidden/System files:
  - <path> (attributes: H/S), inode <id>
- Deleted files (recovered):
  - <inode> → recovered/<inode>.bin (sha256: <hash>)
- Timestomp indicators:
  - File: <path> (Created vs Modified mismatch: <details>)
- Persistence indicators:
  - autorun.inf present? <Yes/No>
  - Suspicious LNK? <details>

## Timeline Highlights
- YYYY-MM-DD HH:MM — <event>
- YYYY-MM-DD HH:MM — <event>

## Conclusions
- Impact: <summary>
- Likely TTPs: T1564.001, T1070.006, T1070.004, T1070.009
- Recommendations: <actions>
```

---

## Challenge Notes

Use everything above:

* Validate **structure** via `fsstat`
* Enumerate **directories & deleted entries** via `fls`
* **Recover** and **hash** evidence with `icat`
* Inspect **timestamps** with `istat`; flag anomalies
* Document **hidden/persistence** techniques

---

## MITRE ATT\&CK Mapping

| Technique                    | ID            | Where it shows                                        |
| ---------------------------- | ------------- | ----------------------------------------------------- |
| Hidden Files & Dirs          | **T1564.001** | DOS attributes (H/S), unusual directory entries       |
| Indicator Removal: Timestomp | **T1070.006** | Created/Modified/Access times inconsistent            |
| File Deletion                | **T1070.004** | 0xE5 entries, recoverable clusters                    |
| Clear Persistence            | **T1070.009** | `autorun.inf`, rogue `.lnk`, dropped binaries on root |

---

### 📣 How to use this repo

1. Create a new GitHub repo, name it e.g., `FAT32-Analysis-THM`.
2. Copy this `README.md` in.
3. Create folders `notes/`, `evidence/`, `scripts/`, `assets/`.
4. Drop your disk image into `evidence/` (do **not** commit if sensitive).
5. Start with the **Quick Start** commands and fill in `notes/findings.md`.

---
