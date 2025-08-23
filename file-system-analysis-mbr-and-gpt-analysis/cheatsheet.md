# Concept Cheat-Sheet
MBR (Master Boot Record)

- Location: LBA 0 (first 512 bytes)

- Layout: 446B boot code • 64B partition table (4 entries) • 2B signature (0x55AA)

- Limits: Max 2 TB disk, 4 primary partitions (or extended + logicals)

- Abuse: Bootkits patch boot code; fake partitions; overwrite signature

GPT (GUID Partition Table)

- Location: Primary header at LBA 1 + partition entries; backup header at last LBA

- Strengths: 64-bit LBA, many partitions, redundancy (primary/backup), CRCs

- Abuse: Corrupt headers/tables; desync primary vs backup; hidden partitions for persistence

Bootkits & Tampering

- Goal: Control boot flow → stealthy persistence before OS loads

- Indicators:

 - MBR bootstrap differs from known-good baseline

 - Invalid or mismatched CRC32 in GPT headers/tables

 - Deleted/hidden EFI binaries or unauthorized .efi loaders

## Commands Reference
```bash
# Sleuth Kit — partition layout (works on images too)
mmls /dev/sdX

# Show raw MBR and confirm signature (0x55AA)
dd if=/dev/sdX bs=512 count=1 | hexdump -C | less

# GPT print and verify
sgdisk -p /dev/sdX
sgdisk -v /dev/sdX

# Inspect GPT with gdisk
gdisk /dev/sdX   # then use: v (verify), i (partition info), p (print), b (backup)
```

---

🧯
