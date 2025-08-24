#!/usr/bin/env bash
# Quick helper to extract a file by inode using icat
# Usage: ./cluster_extract.sh <image> <start_sector> <inode> <output>

IMG="$1"
START="$2"
INODE="$3"
OUT="$4"

if [[ -z "$IMG" || -z "$START" || -z "$INODE" || -z "$OUT" ]]; then
  echo "Usage: $0 <image> <start_sector> <inode> <output_file>"
  exit 1
fi

icat -o "$START" "$IMG" "$INODE" > "$OUT"
echo "[+] Extracted inode $INODE to $OUT"
