# Walkthrough — FAT32 Analysis (TryHackMe)

## Task 1: Introduction
- Learned FAT32 relevance in forensics.
- Hidden areas & deleted entries can hide attacker artifacts.

## Task 2: Environment and Setup
- Loaded `sample.img` into Autopsy and Sleuth Kit.
- Partition found at sector 2048.

## Task 3: FAT32 Relevancy
- Attackers use FAT32 in USBs, removable drives, IoT.
- Common persistence: autorun.inf, hidden binaries.

## Task 4: FAT32 Structure — Reserved & FAT Areas
- Boot Sector parsed, confirmed BPB values.
- NumFATs = 2, sectors/FAT = 8192.

## Task 5: FAT32 Structure — Data Area
- Root directory at cluster 2.
- Files enumerated with `fls`.

## Task 6: Analysis Techniques
- Used `fls`, `istat`, `icat` to recover files.
- Compared timestamps for anomalies.

## Task 7: Hidden Files (T1564.001)
- Found hidden/system files via DOS attributes.

## Task 8: Timestomp (T1070.006)
- Identified mismatched Created vs Modified timestamps.

## Task 9: File Deletion / Clear Persistence
- Deleted file entries (`0xE5`) recovered.
- Checked root for persistence artifacts.

## Task 10: Challenge
- Combined techniques: structure, recovery, timeline.

## Task 11: Conclusion
- FAT32 still widely used.
- Understanding artifacts is essential for IR and DFIR.
