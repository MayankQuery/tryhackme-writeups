# Findings — FAT32 Analysis

## Environment
- Image: evidence/sample.img
- FAT32 start sector: 2048
- Cluster size: 4096 bytes
- Root cluster: 2

## Key Artifacts
- Hidden files: /docs/secret.txt (H attribute set)
- Deleted files: recovered inode 45 → recovered.bin (hash logged)
- Timestomp indicators: /logs/syslog.txt (future-dated)
- Persistence: autorun.inf dropped in root

## Recommendations
- Monitor USB drives with FAT32 for persistence
- Enable timestamp anomaly detection in DFIR tools
