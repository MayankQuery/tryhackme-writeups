# Cheatsheet — AD: Basic Enumeration (quick commands & tips)

> **Important:** Use only in authorized lab environments.

## Network & Host Discovery
- Quick host discovery (ICMP + SYN):
```bash
nmap -sS -Pn -T4 10.211.11.0/24
```
- Scan for common AD services (SMB, LDAP, Kerberos, RDP):

```bash
nmap -p 88,135,139,389,445,464,636,3268,3389 -sV -Pn 10.211.11.0/24
```
## SMB / AD Enumeration
- List SMB shares (anonymous):

```bash
smbclient -L //10.201.127.21 -N
```
- Use enum4linux for aggregated SMB/NetBIOS/AD info:

```bash
enum4linux -a 10.201.127.21
```
- RPC client for user/group enumeration:

```bash
rpcclient -U "" 10.201.127.21
# then use `enumdomusers`, `querydominfo`, etc.
```
## LDAP / Domain Info (if LDAP accessible)
- Basic LDAP query (replace domain and server):

```bash
ldapsearch -x -h 10.201.127.21 -b "DC=example,DC=local" "(objectClass=user)"
```
## Password Spraying (use carefully)
- Example with CrackMapExec (CMETool):

```bash
crackmapexec smb 10.211.11.0/24 -u users.txt -p 'Summer2024' --continue-on-success
```
- With Kerbrute (username enum / spray):

```bash
kerbrute userenum -domain example.local -users users.txt 10.201.127.21
```
Spray safely: use one password across many users, wait between tries, and avoid account lockouts.

## Inspect SMB files / download
- Connect and download files:

```bash
smbclient //10.201.127.21/ShareName -U 'DOMAIN\username'
# within smbclient:
# get file.txt
```
## Useful small commands
- Check routing (confirm lab subnet visibility):

```bash
ip route
```
- Save command output for reporting:

```bash
nmap -sS -p- -oN nmap_full.txt 10.201.127.21
```
## Notes on tool alternatives
- crackmapexec — versatile for SMB/AD checks and credential testing.

- bloodhound (with SharpHound) — map AD relationships (requires credentials).

- ldapdomaindump — dump LDAP objects if accessible.
---
