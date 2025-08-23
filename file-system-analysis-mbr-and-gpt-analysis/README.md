# TryHackMe — MBR and GPT Analysis (Advanced Endpoint Investigations)

> Room: **MBR and GPT Analysis**  
> Difficulty: **Medium** • Est. time: **80 min**  
> Status: Completed (100%)

This repository documents my learning, methodology, notes, and answers for the TryHackMe room **“MBR and GPT Analysis”**.  
The room focuses on understanding disk partitioning schemes (MBR vs GPT), their roles in the boot process, and how attackers target them (bootkits, tampering). It also includes hands-on investigations for both MBR and GPT cases.

---

## Learning Objectives
- Explore the **boot process** (BIOS/UEFI → boot code → OS loader)
- Understand the **structure of MBR**
- Understand the **structure of GPT**
- Learn **attacks targeting MBR/GPT** (bootkits, tampering, persistence)
- Solve **practical investigation scenarios** (non-guided in Tasks 5 & 7)

---

## Lab Context
- **Target VM Title:** `MBR_GP_Analsisv0.2`  
- **Scope:** Disk/boot forensics, triage, and validation of MBR/GPT integrity

> Ethics: All actions are performed within the legal THM lab environment for educational purposes.

---

## Quick Start (Analyst Workflow)
1. **Acquire** the disk or first sectors (read-only):
```bash
# MBR (first 512 bytes)
sudo dd if=/dev/sdX of=artifacts/mbr.bin bs=512 count=1

# GPT headers + primary table (commonly first 34 sectors) and backup table (last 33)
sudo dd if=/dev/sdX of=artifacts/gpt_first_34.bin bs=512 count=34
```
2. List partitions using multiple tools:
```bash
sudo fdisk -l /dev/sdX
sudo parted -l
sudo sgdisk -p /dev/sdX
mmls /dev/sdX           # Sleuth Kit
```
3. Hex review & signatures:
```bash
hexdump -C artifacts/mbr.bin | head
# Look for 0x55AA at offset 510–511 in MBR
```
4. Validate GPT:
```bash
sudo sgdisk -v /dev/sdX
sudo gdisk /dev/sdX      # 'v' to verify, 'i' to inspect a partition
```
5. Hunt for tampering:

- Unexpected boot code changes in MBR bootstrap

- Corrupted partition table entries

- Mismatch between primary vs backup GPT

- Suspicious UEFI drivers / EFI binaries (e.g., EFI/BOOT/*.efi, vendor dirs)

---

## Tools Used

- fdisk, parted, sgdisk, gdisk

- dd, hexdump

- Sleuth Kit: mmls, fsstat

- Optional: FTK Imager / Magnet for imaging & preview

---

## Screenshot
![Room Completion]()
![Room Practice]()
![Room Practice]()
![Room Practice]()

---

## Triage Checklist

 - MBR: Present? 512B? Valid 0x55AA? Boot code sane?

 - Partitions: Count/starts/ends align across fdisk/parted/mmls?

 - GPT: Primary & backup headers present and consistent?

 - CRCs: Header & partition table checksums valid?

 - EFI: No rogue .efi loaders; vendor dirs intact; timestamps reasonable

 - Persistence: No unknown hidden partitions or modified boot order

---
