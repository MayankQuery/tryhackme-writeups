# mount_apfs_dmg.sh
```bash
#!/usr/bin/env bash
set -euo pipefail

IMG="${1:-}"
MOUNT_DIR="Artifacts/mounts/apfs_ro"

if [[ -z "$IMG" ]]; then
  echo "Usage: $0 <image.dmg|image.dd>"
  exit 1
fi

mkdir -p "$MOUNT_DIR"

---

# macOS path (hdiutil)
if command -v hdiutil >/dev/null 2>&1; then
  hdiutil attach "$IMG" -readonly -mountpoint "$MOUNT_DIR"
  echo "[+] Mounted at $MOUNT_DIR (macOS)"
  exit 0
fi

---

# Linux path (apfs-fuse)
if command -v apfs-fuse >/dev/null 2>&1; then
  apfs-fuse "$IMG" "$MOUNT_DIR"
  echo "[+] Mounted at $MOUNT_DIR (Linux, FUSE)"
  exit 0
fi

echo "[-] Neither hdiutil nor apfs-fuse found. Install necessary tools."
exit 2
```

---

# extract_plist_xml.sh
```bash
#!/usr/bin/env bash
set -euo pipefail
PLIST="${1:-}"
OUT="${2:-/dev/stdout}"

if [[ -z "$PLIST" ]]; then
  echo "Usage: $0 <file.plist> [output.xml]"
  exit 1
fi

if command -v plutil >/dev/null 2>&1; then
  plutil -convert xml1 -o "$OUT" "$PLIST"
  echo "[+] Converted to XML: $OUT"
else
  echo "[-] plutil not found (requires macOS)."
  exit 2
fi
```

---

# parse_sqlite_table.sh
```bash
#!/usr/bin/env bash
set -euo pipefail
DB="${1:-}"
SQL="${2:-"SELECT name FROM sqlite_master WHERE type='table';"}"

if [[ -z "$DB" ]]; then
  echo "Usage: $0 <db.sqlite> [\"SQL query;\"]"
  exit 1
fi

sqlite3 "$DB" "$SQL"
```

---

# list_quarantine_events.sh
```bash
#!/usr/bin/env bash
set -euo pipefail

DB="${1:-"$HOME/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV2"}"

if [[ ! -f "$DB" ]]; then
  echo "[-] Quarantine DB not found at: $DB"
  exit 1
fi

sqlite3 "$DB" "
SELECT
  datetime(LSQuarantineTimeStamp + 978307200,'unixepoch') AS timestamp_utc,
  LSQuarantineAgentName AS agent,
  LSQuarantineDataURLString AS source_url,
  LSQuarantineOriginURLString AS origin_url
FROM LSQuarantineEvent
ORDER BY LSQuarantineTimeStamp DESC
LIMIT 50;
"
```

All scripts are read-only helpers intended for lab images or your own machine with permission.
