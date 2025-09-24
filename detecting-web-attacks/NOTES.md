
# Notes - Detecting Web Attacks

## 🌐 Client-Side Attacks
- **XSS (Cross-Site Scripting):**
  - Injection of malicious scripts into web pages.
  - Detected in logs via `<script>` tags, suspicious parameters, unusual user agents.
- **CSRF (Cross-Site Request Forgery):**
  - Exploits authenticated sessions.
  - Harder to detect; often tied to unusual POST requests or missing CSRF tokens.

---

## 🖥 Server-Side Attacks
- **SQL Injection (SQLi):**
  - Queries with `' OR 1=1 --`, `UNION SELECT`, etc.
  - Detected in logs via error patterns and suspicious DB queries.
- **Command Injection:**
  - Inputs with `;`, `&&`, `||`, system commands like `cat /etc/passwd`.
- **File Inclusion (LFI/RFI):**
  - Requests with `../../etc/passwd` or `http://malicious-site/malware.php`.

---

## 📜 Log-Based Detection
- Look for:
  - Unusual HTTP methods (PUT, DELETE).
  - Repeated failed login attempts (brute force).
  - SQL error messages in logs.
  - XSS payload patterns in request logs.

---

## 📡 Network-Based Detection
- **PCAP Analysis with Wireshark:**
  - Detect suspicious payloads in HTTP requests.
  - Identify abnormal DNS queries (exfiltration).
  - Look for large or unexpected outbound traffic.

---

## 🔰 Web Application Firewall (WAF)
- Acts as a shield filtering malicious traffic.
- Uses **rules/signatures** to block known attack payloads.
- Detects SQLi, XSS, Command Injection, etc.
- Limitation: Can be bypassed with obfuscation/encoding.

---

## 📝 Key Takeaways
- Combine **log-based + network-based** methods for stronger detection.
- WAFs provide **preventive filtering**, but logs/pcaps confirm what slipped through.
