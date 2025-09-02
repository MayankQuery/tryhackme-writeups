# Acquisition Tips

- Minimize footprint; document exact tool version & hash.
- Prefer hypervisor snapshots for VMs when possible.
- Hash artifacts (SHA-256) immediately after capture.
- Record timezone, hostname, logged-in users, and running EDR.

---

# Core Concepts

- Order of volatility & acquisition strategy
- Process, thread, handle, module, network socket basics
- Windows vs Linux memory differences
- Symbol files / profiles (less needed in Volatility 3)

---

# Linux Memory Artifacts

- Processes, namespaces, cgroups
- `/proc`-linked structures, sockets, open files
- Kernel modules (LKM), rootkits (DKOM traces)
- Credential material in process memory (tokens, SSH agents)

---

# Memory Triage Checklist

- [ ] Identify OS/Build and time context (`windows.info` / `linux.banner`).
- [ ] Survey processes (`pslist`, `pstree`, `psscan`).
- [ ] Pivot suspicious parents, unsigned modules, RWX regions (`malfind`, `dlllist`).
- [ ] Enumerate network sockets and correlate with processes (`netscan`/`netstat`).
- [ ] Pull command lines, environment, and recent consoles (`cmdline`, `consoles`/bash history analogues).
- [ ] Look for credential access activity (LSASS, SSP, DPAPI).
- [ ] Dump suspicious PIDs for static review (`memmap --dump`).
- [ ] Extract IOCs (IPs/domains/hashes) and map to ATT&CK.
- [ ] Document timeline and findings in `Findings/`.

---

# Volatility 3 Cheatsheet

Assume Windows image at `image.mem`:

```bash
# Basic info
vol -f image.mem windows.info

# Process list & tree
vol -f image.mem windows.pslist
vol -f image.mem windows.pstree
vol -f image.mem windows.psscan

# Command line & environment
vol -f image.mem windows.cmdline
vol -f image.mem windows.envars

# DLLs & modules
vol -f image.mem windows.dlllist
vol -f image.mem windows.driverscan

# Networking
vol -f image.mem windows.netscan

# Handles
vol -f image.mem windows.handles --pid <PID>

# Malfind-like detection (injected code / RWX)
vol -f image.mem windows.malfind

# LSASS hunt (requires appropriate perms)
vol -f image.mem windows.pslist | grep -i lsass
vol -f image.mem windows.ldrmodules --pid <LSASS_PID>

# Dump suspicious process memory
vol -f image.mem windows.memmap --dump --pid <PID> --output-dir dumps/

# YARA scanning
vol -f image.mem yarascan.YaraScan --yara-rules 'wide: /mimikatz|Invoke-Obfuscation|amsi/'
```

Linux image examples:

```bash
vol -f linux.mem linux.pslist
vol -f linux.mem linux.lsmod
vol -f linux.mem linux.netstat
vol -f linux.mem linux.bash.BashHash
```

---

# Windows Memory Artifacts

- Processes & Parentage (`pslist`, `pstree`)
- DLLs & Modules (`dlllist`, `ldrmodules` analogues)
- Handles (`handles`), sockets (`netscan`), registry hives in memory
- LSASS & SSPs; credential material; WDIGEST/WDAP policies
- Shim cache isn't in RAM, but prefetch, command line args may appear

> Red flags: unsigned DLLs, RWX sections, anomalous thread starts.

