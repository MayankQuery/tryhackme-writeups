# Imaging Basics


- **Forensic imaging**: bit-for-bit copy of storage media preserving allocated and unallocated space.
- **Why**: allows analysis without modifying original evidence; supports legal admissibility.
- **Key concepts**:
- Acquisition: raw (`.img`) vs container formats (E01)
- Integrity: cryptographic hashing (SHA-256 strongly recommended)
- Chain of custody: who handled evidence, when, where
- Write protection: hardware write-blocker is preferred

---

# Environment Preparation


Checklist before acquisition:
- ❏ Isolate acquisition host (prefer offline)
- ❏ Time sync & timezone logged
- ❏ Hardware write-blocker available and connected
- ❏ Sufficient storage for image + 20% overhead
- ❏ Tool versions recorded (`dd`, `dcfldd`, `ewfacquire`, `sha256sum`)
- ❏ Case metadata filled (`templates/case-metadata.yml`)

---

# Linux Imaging Commands — Quick Reference


## Identify devices
- `lsblk -f`
- `sudo fdisk -l`
- `blkid`


## Set read-only (software hint)
```bash
sudo blockdev --setro /dev/sdX
```

## Raw acquisition (dd)
```bash
sudo dd if=/dev/sdX of=/evidence/case001.img bs=4M conv=noerror,sync status=progress
```
---

## dcfldd (hash-on-the-fly)
```bash
sudo dcfldd if=/dev/sdX of=/evidence/case001.img bs=4M conv=noerror,sync hash=sha256 hashlog=/evidence/case001.sha256.log
```

---

## E01 (ewfacquire)
```bash
ewfacquire -u -t /evidence/case001.E01 /dev/sdX
```

---

## Mount readonly
```bash
sudo losetup --find --show -P /evidence/case001.img
sudo mount -o ro,loop /evidence/case001.img /mnt/img
```

---

# Integrity Checking


- Use at least **SHA-256**; keep MD5 for legacy parity if needed.
- Compute hashes at these points:
1. (If possible) at source prior to imaging
2. During acquisition (hash-on-the-fly)
3. After image creation
4. After any copy/move of the image
- Tools: `sha256sum`, `md5sum`, `hashdeep`, `ewfverify`
---
