# Notes — AD: Basic Enumeration

## 1) Introduction
Active Directory enumeration is the first, critical phase in internal network penetration testing. With VPN access but no credentials, the goal is to discover domain layout, valid users, hostnames, services, and misconfigurations that can give an initial foothold.

---

## 2) High-level approach
1. **Confirm connectivity** to the lab network and identify reachable hosts/subnets.  
2. **Network mapping**: identify live hosts and open services (SMB, LDAP, RDP, Kerberos).  
3. **SMB & AD enumeration**: gather domain names, domain controllers, shares, user lists, and machine accounts. Tools like `enum4linux`, `smbclient`, `rpcclient`, `ldapsearch` (or `ldapdomaindump`) are useful.  
4. **User enumeration**: figure out valid usernames (via anonymous SMB, LDAP queries, or service responses).  
5. **Password spraying**: use a conservative list of common/default passwords with rate-limiting to avoid account lockouts.  
6. **Credential discovery**: inspect config files, accessible shares, or misconfigured services for credentials.  
7. **Initial access**: when valid credentials are found, use them to access workstation/SMB to escalate further (pivot or collect more creds).

---

## 3) Practical notes & safety
- This is a **lab environment only** — never run these techniques against production or external networks without permission.  
- Use low-rate password spraying (e.g., one username per domain per time window) to avoid lockouts.  
- Preserve evidence (screenshots, command history) for your report.

---

## 4) Typical workflow (example)
1. `nmap` to find hosts and services on the lab subnet.  
2. `enum4linux` or `smbclient -L` to enumerate SMB shares and domain info.  
3. `rpcclient` and `smbclient` to list users/groups and read accessible files.  
4. `ldapsearch` / `samba-tool` / `ldapdomaindump` to fetch domain objects (if anonymous LDAP allowed).  
5. Use a small, tested password list and `kerbrute`/`crackmapexec`/`hydra` (with care) for password spraying.  
6. If credentials found, access SMB or RDP to move laterally and look for sensitive files containing credentials (config files, scripts, backups).

---

## 5) Evidence & reporting
- Save commands and outputs (e.g., `nmap` scans, `enum4linux` outputs).  
- Note timestamps and hostnames for reproducibility.  
- In the write-up, include a summary of how the valid credentials were obtained and what was accessed after.

