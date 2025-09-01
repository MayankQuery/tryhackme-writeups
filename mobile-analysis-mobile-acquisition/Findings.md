# Findings
# Practical Summary
**Context**: Simulated suite acquisition.

---

## Steps
1. Documented device metadata and state (simulated)
2. Performed logical acquisition (backup/export)
3. Generated SHA-256 & MD5 for artifacts
4. Verified integrity against post-copy hashes
5. Logged operations and timestamps

---

## Artifacts
- `Practical/backup/` (placeholder in this repo)
- Hash list stored in `Findings/integrity_hashes_example.txt`

---

## Notes
- If backup was encrypted, note password custody and scope limits.
- Maintain read-only master; work on verified copy.

---

# Example (replace with real values)
SHA256(Practical/backup/device_backup_example.zip)= 3f6b9c...deadbeef
MD5(Practical/backup/device_backup_example.zip)= 7a1d2e...cafe1234

---
