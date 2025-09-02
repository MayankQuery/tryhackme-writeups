# Task 1 — Introduction

**Focus**: What memory analysis is, when to use it, and what evidence RAM can reveal in DFIR.

## Key Ideas
- Volatile memory = data that disappears on shutdown; contains processes, connections, injected code.
- Complements disk forensics; often shows *live* attacker activity.
- Capture order of volatility matters.

## My Notes
- Why this matters for blue team investigations:
  - Detects in-memory-only malware/persistence.
  - Recovers credentials/artifacts not written to disk.

## No questions to answer for this task.

---

# Task 2 — Volatile Memory

## Concepts
- **Memory hierarchy**: registers → cache → RAM → disk (increasing capacity, decreasing speed).
- **RAM layout**: kernel space, user space; processes own VAS segments (code, heap, stack).
- **Artifacts**: processes, threads, DLLs, handles, network sockets, command history (depending on OS), clipboard.

## Notes / Doodles
- Common blue-team pivots: unusual parent-child, unsigned modules, RWX memory regions, networked processes.

## Check Yourself
- Describe the difference between user space and kernel space.
- Why are RWX pages suspicious?

---

# Task 3 — Memory Dumps

## Acquisition Approaches
- **Windows**: DumpIt, winpmem, WSDD, comae-kd.
- **Linux**: LiME (Loadable Kernel Module), `dd`/`makedumpfile` (context-dependent).
- **Hypervisors**: VM snapshots, .vmem/.vmsn.

## Acquisition Challenges
- Anti-IR tampering (DKOM, hooked APIs), AV/EDR interference.
- Pagefile vs. RAM image gap.
- Image format & symbol support for tools.

## Integrity
- Hash your images (SHA-256), record chain of custody, note time/source.

---

# Task 4 — Memory Analysis Attack Fingerprints

## Patterns to Hunt
- **Process anomalies**: orphaned children, suspicious parent (e.g., `winword.exe` → `powershell.exe`).
- **Module/DLL flags**: unsigned, `Temp`-loaded, RWX sections, hollowed PE.
- **Network**: uncommon listening ports, external C2, loopback beacons.
- **Credential access**: LSASS access handles, SSP DLLs, mimikatz strings.
- **Injection**: APC injection, thread start in suspicious region, `CreateRemoteThread` artifacts.
- **Persistence in-memory**: reflective loaders, inline hooks, ETW/AMSI patching.

## Document Weirdness
- IOC list (hashes, IPs, domains).
- TTP mapping (MITRE ATT&CK technique IDs).

---

# Task 5 — Practical

Use `Practical/Walkthrough.md` for a step-by-step investigation. Capture commands, short outputs, and screenshots.

> Tip: Keep raw tool outputs in a separate `outputs/` folder (ignored by Git).

---

# Task 6 — Conclusion

## My Takeaways
- Memory forensics quickly surfaces live adversary activity.
- Volatility 3 + focused triage = fast wins.
- Practice building hypotheses and validating with multiple plugins.

## Next Steps
- Add a real case under `Findings/Case_YYYY-MM-DD/` and publish key learnings.
