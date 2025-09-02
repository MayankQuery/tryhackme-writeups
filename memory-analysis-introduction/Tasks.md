# DumpIt (Windows)

- One-click acquisition to `.raw`/`.mem`.
- Run as admin; minimize system activity; hash output.

---

# LiME (Linux)

- Kernel module to acquire memory to raw or lime format.
- Build against target kernel headers; capture to external drive when possible.

---

# MemProcFS (Windows/Linux)

- Mounts memory images as a filesystem for point-and-click exploration.
- Great for carving files, PE dumps, and process inspection.
- Pair with YARA for quick sweeps.

---

# pypykatz

- Offline parsing of LSASS dumps for credential material.
- Use only when authorized in a lab context.

---

# strings

- Baseline triage: `strings -a image.mem | grep -i <keyword>`
- Combine with Vol3 dumps for targeted review.

---

# Volatility 3

- Install: `pip install volatility3`
- Usage pattern: `vol -f <image> <plugin> [options]`
- Symbols: Vol3 auto-handles many; ensure correct plugins for your OS.
- Output tips: redirect to TSV/JSON when possible for later parsing.

