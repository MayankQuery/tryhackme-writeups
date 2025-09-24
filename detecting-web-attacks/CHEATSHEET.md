# Cheatsheet - Detecting Web Attacks

## Client-Side Indicators
- `<script>` in parameters → XSS attempt
- Suspicious POST without CSRF tokens → CSRF
- Long encoded payloads in URL → Obfuscation attempt

---

## Server-Side Indicators
- `UNION SELECT`, `' OR 1=1 --` → SQLi
- `;`, `&&`, `||`, `cat /etc/passwd` → Command Injection
- `../../etc/passwd` → Local File Inclusion
- `http://evil.com/malware.php` → Remote File Inclusion

---

## Log Analysis
- Check for:
  - `500`, `403`, `404` anomalies
  - Repeated failed logins
  - Suspicious user agents (`sqlmap`, `nikto`)

---

## Network Analysis
- Tools: **Wireshark / tcpdump**
- Detect:
  - Suspicious HTTP payloads
  - Large data exfiltration
  - Malicious DNS queries

---

## WAF Detection
- Blocks known attack signatures
- Can log attempts like:
  - SQL keywords
  - Script injections
  - Path traversal sequences

