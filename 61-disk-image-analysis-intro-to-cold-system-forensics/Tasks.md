# Task 1 – Introduction


**Key ideas**
- *Cold forensics* = offline analysis of powered‑off systems or images.
- Priorities: **preservation → integrity → reproducibility**.
- Hashing (MD5/SHA‑256) to verify integrity across copies.


**Reflection**
- I’ll use this repo as a living record of my workflow and evidence handling.

---

# Task 2 – Challenges and Opportunities


**Challenges**
- No RAM artefacts or volatile network state.
- Encrypted disks, full‑disk/volume encryption.
- Device diversity (filesystems, containers, VMs).


**Opportunities**
- Repeatable: no runtime changes.
- Lower risk to evidence (write‑blocked workflow).
- Time to perform methodical deep‑dive.


**Mitigations**
- Acquire *all* relevant media (external drives, mobile, cloud exports where authorized).
- Use *triage images* when full imaging is impractical.
- Document every step in chain of custody.

---

# Task 3 – Data Acquisition & Preservation


**Acquisition modes**
- Physical/raw image (bit‑for‑bit): best for integrity and later re‑analysis.
- Logical acquisition: faster, limited scope.
- EWF/EnCase (`.E01`) with metadata and chunked compression.


**Integrity**
- Dual hashing at acquire and at verify: `SHA‑256` preferred.
- Store hashes separately in `Findings/hashes.sha256`.


**Chain of Custody**
- Use the template in `Notes/chain_of_custody_template.md`.


**Minimal command snippets**
```bash
# RAW image with dc3dd (includes hashing)
sudo dc3dd if=/dev/sdX of=/evidence/disk.raw hash=sha256 hlog=/evidence/disk.raw.sha256 log=/evidence/dc3dd.log


# EWF image with ewfacquire
sudo ewfacquire -t /evidence/case01 -u -C "Case01 - Laptop A" /dev/sdX


# Verify
sha256sum /evidence/disk.raw > Findings/hashes.sha256
sha256sum -c Findings/hashes.sha256
```

---

# Task 4 – Forensic Tools & Techniques


**Partitioning & Filesystems (The Sleuth Kit)**
- `mmls disk.raw` → partition layout
- `fls -m / -r -o <start_sector> disk.raw` → file listing


**Mounting (Linux)**
- See `Scripts/mount_image_linux.sh` for loop‑mounting NTFS/ext partitions read‑only.


**GUI Workflows**
- **Autopsy**: Ingest modules (hash lookup, file type ID, keyword search, EXIF, web artefacts).
- **FTK Imager**: Preview, logical export, E01 creation.


**Timelining**
- `log2timeline.py` → `.plaso`; then `psort.py` produce CSV for analysis.

---

# Task 5 – Practical


Use this space to record *your* workflow on the room’s practical component without spoilers.


**My approach**
1. Verified image integrity (SHA‑256 match).
2. Partition recon with `mmls`; mounted target partition read‑only.
3. Ran triage (browser history, downloads, recent files, recycle bin, user profiles).
4. Built a super‑timeline with Plaso; filtered by case times of interest.
5. Correlated artefacts (file MAC times, shellbags, LNKs, jump lists, prefetch where applicable).


**Key artefacts logged**
- [ ] Suspicious executables or scripts
- [ ] Persistence (startup items, scheduled tasks, services)
- [ ] Data exfil indicators (archive tools, cloud clients, removable media)
- [ ] Encryption activity traces


Fill details in `Findings/case_summary.md` and `Findings/evidence_register.csv`.

---

# Task 6 – Conclusion


**Takeaways**
- Cold forensics prioritizes **repeatability** and **evidence integrity**.
- Strong documentation + hashing = defensible results.
- Tool diversity helps handle varied image/container formats.


**Next**
- Practice with memory + disk combos (hybrid cases).
- Build SOPs for imaging and first‑hour triage.
