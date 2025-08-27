# Evidence Summary

## Key Discoveries
- Suspicious RDP login outside of normal hours.  
- Malicious service ("Windows Update Helper") identified.  
- Scheduled task executing hidden PowerShell script.  
- Rogue `svchost.exe` running from temp directory.  

## Implications
- Attacker established persistence via **registry + services**.  
- Possible lateral movement using **RDP connections**.  
- Malicious process indicates post-compromise execution.  

---

# Attack Correlation

## Attack Chain Reconstruction
1. **Initial Access**  
   - Suspicious RDP session suggests compromised credentials.  

2. **Persistence**  
   - Malicious registry entry + startup item.  
   - Fake Windows service for persistence.  

3. **Execution**  
   - Hidden PowerShell script triggered by scheduled task.  
   - Rogue executable mimicking `svchost.exe`.  

4. **C2 Communication**  
   - Outbound connection to suspicious IP address.  

## Conclusion
Findings point to a **credential theft → RDP login → persistence via registry/services → execution via scheduled tasks** attack chain. 

---
