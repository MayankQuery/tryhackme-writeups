# Task 1 - Introduction

## Objective
Understand the purpose of the Windows Incident Surface room.

## Key Points
- Focused on exploring Windows forensic artefacts.  
- Introduces incident investigation workflows.  
- Each investigation is different; some artefacts may be more relevant than others.  

## Takeaway
This task sets the stage for identifying **critical artefacts** that can help track attacker activity in Windows environments.

---

# Task 2 - Reliability of the System Tools

## Objective
Evaluate the trustworthiness of Windows built-in tools.

## Key Points
- Some Windows tools may hide processes/services controlled by attackers.  
- Reliance on a single tool may cause investigators to miss critical artefacts.  
- Cross-validation with multiple forensic utilities is essential.  

## Takeaway
**System tools alone are not reliable** during DFIR. Always cross-check findings with specialized tools.

---

# Task 3 - System Profile

## Objective
Gather baseline system information.

## Key Points
- Captured hostname, OS version, system uptime, and hardware details.  
- Checked installed patches and updates.  
- Noted time zone settings for log correlation.  

## Findings
- The system was up for several days without reboot.  
- Missing recent security patches.  

## Takeaway
A **system profile** gives context to the investigation and highlights potential vulnerabilities.

---

# Task 4 - Users and Sessions

## Objective
Analyze users, logins, and sessions.

## Key Points
- Extracted user accounts and group memberships.  
- Reviewed active logon sessions and RDP history.  
- Checked for privilege escalation indicators.  

## Findings
- Standard user accounts were normal.  
- One unusual user session occurred outside business hours.  
- Suspicious RDP login from external IP.  

## Takeaway
Unexpected logins or new accounts are **strong indicators of compromise**.

---

# Task 5 - Network Scope

## Objective
Investigate network activity.

## Key Points
- Reviewed open ports and listening services.  
- Checked for suspicious established connections.  
- Looked at recent DNS queries and ARP cache.  

## Findings
- Several normal system ports were active.  
- Suspicious outbound connection detected to a non-standard IP.  

## Takeaway
Network artefacts often reveal attacker **C2 (command-and-control) infrastructure**.

---

# Task 6 - Startup and Registry

## Objective
Check persistence mechanisms in startup entries and registry.

## Key Points
- Investigated `Run` and `RunOnce` registry keys.  
- Reviewed startup folders for suspicious executables.  
- Checked for altered registry hives.  

## Findings
- Found an unusual startup entry pointing to a hidden EXE.  
- Registry key modification consistent with persistence.  

## Takeaway
The **Windows registry and startup folders** are prime targets for persistence mechanisms.

---

# Task 7 - Services and Scheduled Items

## Objective
Identify malicious services and scheduled tasks.

## Key Points
- Enumerated all Windows services.  
- Checked scheduled tasks for anomalies.  
- Looked at last execution timestamps.  

## Findings
- Service masquerading as "Windows Update Helper" was found.  
- Suspicious scheduled task configured to run a hidden PowerShell script.  

## Takeaway
Attackers frequently abuse **services and scheduled tasks** for stealthy persistence.

---

# Task 8 - Processes and Directories

## Objective
Examine processes and file directories for malicious activity.

## Key Points
- Checked running processes against baseline.  
- Investigated unusual directories and executables.  
- Compared hashes of suspicious binaries.  

## Findings
- Legitimate processes observed.  
- One rogue process mimicking `svchost.exe` found in a temp directory.  

## Takeaway
Anomalous processes and hidden executables often expose attacker presence.

---

# Task 9 - Conclusion

## Objective
Summarize investigation results.

## Key Points
- Analyzed multiple Windows artefacts.  
- Correlated findings across users, services, registry, and processes.  
- Built a partial attack chain reconstruction.  

## Takeaway
Every DFIR case is unique, but familiarity with **Windows artefacts** greatly increases the chances of spotting attacker activity.
