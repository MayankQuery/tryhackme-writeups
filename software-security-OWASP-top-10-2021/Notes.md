# NOTES — OWASP Top 10 - 2021 (TryHackMe)

> Use this file to keep your working notes, commands you ran, recon results, and brief summaries per topic.

---

## Lab metadata
- Room: OWASP Top 10 - 2021
- VM: owasp_top10_2021_v1.2-badr
- IP: 10.201.85.202
- Time started: __________________
- Time ended: __________________
- VM snapshot / notes: take screenshots for your evidence.

---

## General Recon
- Ping: `ping -c 3 10.201.85.202`
- Nmap quick: `nmap -sC -sV -oN nmap_initial.txt 10.201.85.202`
- Note open ports & services:
  - HTTP/HTTPS, SSH, other.

---

## Topic notes (summary lines to expand while you work)

### 1. Broken Access Control
- Definition: restrictions not properly enforced.
- Common vectors: IDOR, forced browsing, privilege escalation through predictable IDs.
- Tools: browser, Burp Suite, dirb/ffuf for hidden endpoints.

### 2. Cryptographic Failures
- Definition: weak/incorrect crypto usage or storage.
- Check for: weak algorithms, reversible encryption, JWT misconfig, password stored in plaintext, predictable IVs.
- Tools: openssl, hashcat, jwt.io, python scripts.

### 3. Injection
- SQLi / Command injection / LDAP etc.
- Approach: identify input point → craft payload → extract data.
- Tools: sqlmap (careful), Burp, manual payloads.

### 4. Insecure Design
- High level: missing threat model, insecure flows, auth bypass by design.
- Focus on logic flaws.

### 5. Security Misconfiguration
- Examples: default credentials, verbose errors, unnecessary services, open S3 buckets.

### 6. Vulnerable & Outdated Components
- Check versions in banner, package manifests.
- Use searchsploit or exploit-db for known CVEs.

### 7. Identification & Authentication Failures
- Weak password reset flows, session fixation, missing MFA, broken brute-force protection.

### 8. Software & Data Integrity Failures
- Unsigned updates, trusting user-supplied content (deserialization), insecure CI/CD.

### 9. Logging & Monitoring Failures
- Missing logs, insufficient alerting — useful for post-compromise persistence.

### 10. SSRF
- When server side can fetch external/internal URLs. Use to reach internal services.

---

## Evidence / Answers
- Task 1 (Introduction): Completed (Y/N) __
- Task X: Short answer / flag:
  - Task 4 (IDOR): Flag → `THM{...}` (record)
  - Keep a table of tasks and flags here.

---

## Post-lab reflection
- What did I learn?
- What tools do I need to practice more?
- Next rooms / exercises recommended: Web Fundamentals, Burp Suite Academy.

