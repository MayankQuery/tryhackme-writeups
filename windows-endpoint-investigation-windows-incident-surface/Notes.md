# Windows Incident Artefacts

## Common Artefacts
- **System Profile** → Hostname, OS, uptime, installed patches.  
- **Users & Sessions** → Accounts, group memberships, login activity.  
- **Network Scope** → Connections, open ports, DNS, ARP cache.  
- **Startup & Registry** → `Run` keys, startup executables, persistence.  
- **Services & Tasks** → Malicious services, scheduled jobs for persistence.  
- **Processes & Directories** → Hidden executables, rogue binaries, file anomalies.  

## Best Practices
- Cross-check system tool outputs with forensic utilities.  
- Correlate logs with time zone and system time.  
- Build a timeline of attacker actions.  

---

# Windows DFIR Investigation Methodology

1. **Establish Baseline**
   - Profile system, uptime, and OS details.  
   - Check for missing patches.  

2. **User & Session Analysis**
   - Review user accounts and groups.  
   - Check logon/logoff patterns and RDP activity.  

3. **Network Scope**
   - Examine active connections and DNS queries.  
   - Flag suspicious IPs/domains.  

4. **Persistence Checks**
   - Registry, startup items, services, and scheduled tasks.  

5. **Process & File Analysis**
   - Investigate processes, hashes, and directories.  
   - Spot unusual executables.  

6. **Correlation**
   - Link findings across artefacts to reconstruct attack chain.  
