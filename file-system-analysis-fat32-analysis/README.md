# FAT32 Analysis — TryHackMe Room Walkthrough & Notes

> **Room:** *FAT32 Analysis* (Advanced Endpoint Investigations → File System Analysis)  
> **Difficulty:** Hard • **Est. time:** 90 min • **Status:** Completed (100%)

![Room Banner](./assets/room-banner.png)

## Objectives
- Explore the FAT32 filesystem structure
- Perform forensic and data recovery on FAT32
- Detect defense evasion techniques (hidden files, timestomp, file deletion, clear persistence)
- Use Sleuth Kit and Autopsy for analysis

---

## Quick Start
```bash
# Partition map
mmls evidence/sample.img

# Filesystem stats
fsstat -o 2048 evidence/sample.img

# Recursive listing
fls -o 2048 -r -p evidence/sample.img > notes/root_listing.txt

# Carve deleted file by inode
icat -o 2048 evidence/sample.img <inode> > recovered.bin

# Timestamps
istat -o 2048 evidence/sample.img <inode>
```
---

## FAT32 Key BPB Fields

| Field               | Offset | Size | Example |
| ------------------- | ------ | ---- | ------- |
| Bytes per Sector    | 0x0B   | 2    | 512     |
| Sectors per Cluster | 0x0D   | 1    | 8       |
| Reserved Sectors    | 0x0E   | 2    | 32      |
| Number of FATs      | 0x10   | 1    | 2       |
| Root Cluster        | 0x2C   | 4    | 2       |

---

## MITRE ATT&CK Mapping

| Technique         | ID        | Evidence                           |
| ----------------- | --------- | ---------------------------------- |
| Hidden Files      | T1564.001 | DOS attributes, orphaned clusters  |
| Timestomp         | T1070.006 | Inconsistent FAT32 timestamps      |
| File Deletion     | T1070.004 | 0xE5 entries, recoverable clusters |
| Clear Persistence | T1070.009 | autorun.inf, rogue LNK             |

---

## Screenshots
![Room Completion]()
![Room Practice 1]()
![Room PRactice 2]()
![Room PRactice 3]()

---
