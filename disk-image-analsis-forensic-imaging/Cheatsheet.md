# Forensic Imaging Cheatsheet — One Page


## Identify & prepare
- `lsblk -f` — list devices
- `sudo blockdev --setro /dev/sdX` — set read-only (software)


## Acquire (fast)
- `sudo dd if=/dev/sdX of=/evidence/case.img bs=4M conv=noerror,sync status=progress`


## Hash
- `sha256sum /path/to/image.img`
- `md5sum /path/to/image.img`


## Mount readonly
- `sudo mount -o ro,loop /path/to/image.img /mnt/img`


## Verify E01
- `ewfverify /path/to/image.E01`


## Best practices
- Use hardware write-blocker when possible
- Record tool versions & timestamps
- Never publish images or logs with flags
