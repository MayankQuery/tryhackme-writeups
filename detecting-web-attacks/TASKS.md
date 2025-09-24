
# Tasks - Detecting Web Attacks

## Task 1: Introduction
- Understand objectives: Detecting web attacks using logs, network analysis, and WAFs.
- No answer required.

---

## Task 2: Client-Side Attacks
- Learn about **XSS** and **CSRF**.
- Indicators:
  - `<script>` injections in logs.
  - Suspicious POST requests without CSRF tokens.

---

## Task 3: Server-Side Attacks
- Identify SQLi, Command Injection, and File Inclusion.
- Logs may show:
  - `UNION SELECT`
  - `/etc/passwd`
  - Shell commands

---

## Task 4: Log-Based Detection
- Use server logs to detect:
  - Repeated failed logins.
  - Suspicious query parameters.
  - Error codes like `500`, `403`.

---

## Task 5: Network-Based Detection
- Analyze PCAP files with Wireshark.
- Look for:
  - Suspicious HTTP traffic.
  - DNS tunneling attempts.
  - Abnormal outbound traffic.

---

## Task 6: Web Application Firewall
- Learn how WAFs filter malicious traffic.
- Understand WAF limitations.

---

## Task 7: Conclusion
- Recap detection methods.
- Recommend combining **logs + PCAP + WAF** for best defense.
