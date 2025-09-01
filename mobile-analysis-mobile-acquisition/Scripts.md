# Scripts

```bash
#!/usr/bin/env bash
# Usage: bash Scripts/generate_hashes.sh <input_dir> <out_file>
set -euo pipefail

IN_DIR="${1:-Practical}"
OUT_FILE="${2:-Findings/integrity_hashes_example.txt}"

mkdir -p "$(dirname "$OUT_FILE")"
: > "$OUT_FILE"

command -v sha256sum >/dev/null || { echo "sha256sum not found"; exit 1; }
command -v md5sum >/dev/null || { echo "md5sum not found"; exit 1; }

while IFS= read -r -d '' f; do
  sha256sum "$f" >> "$OUT_FILE"
  md5sum "$f"    >> "$OUT_FILE"
done < <(find "$IN_DIR" -type f -print0)

echo "Hashes written to $OUT_FILE"
```

```bash
#!/usr/bin/env bash
# Minimal iOS backup verifier (structure + hashing)
# Usage: bash Scripts/verify_backup_ios.sh <backup_dir> <hash_out>
set -euo pipefail

BACKUP_DIR="${1:-Practical/backup_ios}"
OUT="${2:-Findings/ios_backup_hashes.txt}"

[ -d "$BACKUP_DIR" ] || { echo "Backup dir not found: $BACKUP_DIR"; exit 1; }
mkdir -p "$(dirname "$OUT")"
: > "$OUT"

echo "# Verifying iOS backup structure" | tee -a "$OUT"
find "$BACKUP_DIR" -type f | sort | tee -a "$OUT"

echo "# Hashes" | tee -a "$OUT"
find "$BACKUP_DIR" -type f -print0 | xargs -0 sha256sum >> "$OUT"

echo "Done. See $OUT"
```

```bash
#!/usr/bin/env bash
# Minimal Android logical pull (requires USB debugging + authorization)
# Usage: bash Scripts/adb_collect.sh <package_or_path> <dest_dir>
set -euo pipefail

TARGET="${1:-/sdcard/Download}"
DEST="${2:-Practical/android_collect}"

command -v adb >/dev/null || { echo "adb not found"; exit 1; }

mkdir -p "$DEST"
adb start-server >/dev/null

echo "[*] Devices:"
adb devices

echo "[*] Pulling: $TARGET"
adb pull "$TARGET" "$DEST"

echo "[*] Hashing pulled files"
find "$DEST" -type f -print0 | xargs -0 sha256sum > "$DEST/sha256.txt"
echo "Complete → $DEST"
```
