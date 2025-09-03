# Cold Forensics – Core Concepts

- **Cold (dead box) vs Live**: Offline image vs live acquisition; volatility dictated by power state.
- **Write Blocking**: Hardware or software; verify read‑only mounts.
- **Hashing**: Prefer SHA‑256; maintain separate signed hash logs where possible.
- **Documentation**: Who, what, when, where, why; contemporaneous notes.
- **Repeatability**: Scripts & checklists to eliminate guesswork.

---

# Acquisition Checklist

- [ ] Case ticket opened; legal authority verified.
- [ ] Photograph device, ports, labels; label Item ID.
- [ ] Write‑blocker connected and tested.
- [ ] Record device details (make/model/SN, storage size).
- [ ] Choose image type (RAW/E01) and tool.
- [ ] Start acquisition; capture logs and hashes.
- [ ] Verify image hash; store in `Findings/hashes.sha256`.
- [ ] Secure original evidence; work only on verified copy.

---

# Handy Imaging & Mounting Commands

```bash
# Identify device
lsblk -o NAME,SIZE,TYPE,MOUNTPOINT


# RAW image with dd (use dc3dd/dcfldd for hash logging)
sudo dd if=/dev/sdX of=/evidence/disk.raw bs=4M status=progress conv=noerror,sync


# EWF (E01) with ewfacquire
sudo ewfacquire -t /evidence/case01 -u /dev/sdX


# Verify hashes
sha256sum /evidence/disk.raw > Findings/hashes.sha256
sha256sum -c Findings/hashes.sha256


# Partition map
mmls disk.raw


# Mount NTFS partition (read‑only)
sudo mount -o ro,loop,show_sys_files,streams_interface=windows,offset=$((START*512)) disk.raw /mnt/evidence
```
---

# Tool Usage Notes

```bash
**Autopsy**
- New Case → Add Data Source → Disk Image → Ingest modules (Hash Lookup, File Type ID, EXIF, Keyword Search, Web Artifacts, Recent Activity).
- Tag artefacts; export reports (HTML/CSV/PDF) for inclusion in `Findings/`.


**The Sleuth Kit (TSK)**
- `mmls`, `fsstat`, `fls`, `icat`, `tsk_recover` for low‑level extraction.


**Plaso (log2timeline/psort)**
- `log2timeline.py evidence.plaso /mnt/evidence`
- `psort.py -o L2tcsv -w timeline.csv evidence.plaso`
```

---

