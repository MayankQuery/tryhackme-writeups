# Task 01 — Introduction

**Objective:** Understand the room scope and topics (OWASP Top 10 - 2021).

**Summary:**  
This room covers the 10 major web security risk categories identified by OWASP (2021 edition) and includes hands-on challenges for each.

**Actions / Notes:**  
- Read the room intro.
- Note the VM name: `owasp_top10_2021_v1.2-badr` and IP: `10.201.85.202`.
- Ensure AttackBox or local Kali is set up.

---

# Task 02 — Accessing Machines

**Objective:** Start the VM/AttackBox and confirm connectivity.

**Commands tried:**
- `ping -c 3 10.201.85.202`
- `nmap -sC -sV -oN nmap_initial.txt 10.201.85.202`

**Results / Notes:**
- Paste nmap open ports & services here.
- If web is on port 80/443, open in browser: `http://10.201.85.202`.

---

# Task 03 — Broken Access Control (Theory)

**Objective:** Learn what Broken Access Control means and common exploitation techniques.

**Key points:**
- Broken access control allows unauthorized actions.
- Common exploitation: IDOR, forced browsing, elevation via parameter tampering.

**References:** NOTES.md -> Broken Access Control

---

# Task 04 — Broken Access Control (IDOR Challenge)

**Objective:** Exploit IDOR to access data you shouldn't.

**Steps I took**
1. Found endpoint `/user/<id>` (example).
2. Burp intercept and changed `id=2` to `id=1`.
3. Observed different user profile data returned.

**Commands / Requests**
- Example request: `GET /profile?id=2 HTTP/1.1`
- Tamper to: `GET /profile?id=1 HTTP/1.1`

**Flag / Answer:**
- Flag (if provided by lab): `THM{...}`

**Remediation notes:**  
Implement proper authorization checks server-side. Do not rely on client-side controls or predictable identifiers.

---

# Task 05 — Cryptographic Failures (Theory)

**Objective:** Understand common crypto issues: outdated algorithms, weak storage, improper randomization.

**Checklist:**
- Look for plaintext secrets.
- JWT issues: missing signature validation, algorithm=none.
- Weak password hashing: MD5, unsalted SHA1.

**Notes:** Expand with findings from supporting materials and challenge.

---

# Task 06 — Cryptographic Failures (Supporting Material 1)

**Summary of supporting material 1:**  
- Key points and any example outputs.

**Commands & Observations:**  
- (Paste commands you ran here.)

---

# Task 07 — Cryptographic Failures (Supporting Material 2)

**Summary of supporting material 2:**  
- Key points and example exploit or observation.

---

# Task 08 — Cryptographic Failures (Challenge)

**Objective:** Solve the lab challenge for crypto failures.

**Approach & Steps:**  
1. Hypothesis: (e.g., password stored hashed with MD5)  
2. Commands used: `hashcat -m 0` or `john` etc.  
3. Result: (paste cracked password or finding)

**Flag / Answer:**  
- Flag: `THM{...}`

**Mitigation:** Use PBKDF2/Argon2/Bcrypt with salts; avoid rolling your own crypto.

---

# Task 09 — Injection (Theory)

**Objective:** Review injection types (SQLi, command injection, NoSQLi).

**Checklist:**
- Identify input points.
- Try basic payloads.
- Use safe, manual testing first.

---

# Task 10 — Command Injection (3.1 Command Injection)

**Objective:** Identify and exploit command injection.

**Steps:**  
- Test payloads like `; whoami`, `&& id`, or `| cat /etc/passwd`.
- Use URL encoding if necessary.

**Example:**  
`POST /vuln` body: `ip=127.0.0.1; cat /etc/passwd`

**Flag / Answer:** `THM{...}`

**Mitigation:** Validate and sanitize input; use safe APIs; drop shell access.

---

# Task 11 — Insecure Design

**Objective:** Recognize design-level problems that enable exploitation.

**Notes:**  
- Logic flaws may require reasoning rather than typical payloads.
- Look at multi-step flows like registration, invite systems, payments.

**Action:** Describe any design flaw found in the challenge.

---

# Task 12 — Security Misconfiguration

**Objective:** Discover configuration mistakes (default creds, open admin pages).

**Tools:** nikto, dirb, Burp to view error messages.

**Example findings:**  
- Admin panel at `/admin` with default creds.
- Sensitive files exposed: `/backup.zip` etc.

---

# Task 13 — Vulnerable & Outdated Components

**Objective:** Identify outdated libs and components.

**Approach:**  
- Check service banners, `package.json`, `composer.lock`, `requirements.txt`.
- Search for known CVEs (searchsploit).

---

# Task 14 — Vulnerable & Outdated Components - Exploit

**Objective:** Exploit known CVE from components.

**Steps:**  
1. Identify component & version.  
2. Search exploit-db or searchsploit.  
3. Test exploit in controlled manner.

---

# Task 15 — Vulnerable & Outdated Components - Lab

**Lab activities & results:**  
- Paste commands & outputs.

---

# Task 16 — Identification & Authentication Failures

**Objective:** Examine auth flows for weaknesses: weak resets, session tokens leaked, no MFA.

**Tests:**  
- Password reset token predictability
- Enumeration in login pages
- Session fixation attempts

---

# Task 17 — Identification & Authentication Failures Practical

**Steps & Evidence:**  
- Demonstration of exploit (if available).
- Commands, Burp captures, final result.

---

# Task 18 — Software & Data Integrity Failures

**Objective:** Look for unsigned/unchecked updates or vulnerable CI artifacts.

**Notes:**  
- Check upload endpoints for deserialization attacks.
- Check update endpoints for lack of signing.

---

# Task 19 — Software Integrity Failures

**Notes & Findings:**  
- Document use of dependencies from untrusted sources.
- Any evidence of tampering.

---

# Task 20 — Data Integrity Failures

**Objective:** Find scenarios where data can be manipulated to cause harm.

**Examples:** Tampering with price values, tampering with signatures.

---

# Task 21 — Security Logging & Monitoring Failures

**Objective:** Test whether the app logs suspicious actions and whether alerts would trigger.

**Notes:** If no logs or alerts, it makes detection of compromise harder.

---

# Task 22 — Server-Side Request Forgery (SSRF)

**Objective:** Exploit SSRF to reach internal resources.

**Tests:**  
- Use `http://127.0.0.1:80/` and `http://[::1]:80/` in SSRF parameters.
- Test cloud metadata endpoints only in lab environments (e.g., `http://169.254.169.254/`).

**Example probe via curl:**  
`curl 'http://10.201.85.202/ssrf?url=http://127.0.0.1:80' -v`

---

# Task 23 — What Next?

**After completing the room:**
- Review all notes and clean up any sensitive data before pushing to public GitHub.
- Practice vulnerable patterns on local labs (DVWA, WebGoat, Juice Shop).
- Read OWASP Web Security Testing Guide (WSTG).
- Try related rooms: Web Fundamentals, Burp Suite Academy, Vulnerable Containers.

**Personal action items:**  
- [ ] Create follow-up practice tasks
- [ ] Build a personal CTF portfolio entry
- [ ] Share writeup on LinkedIn (sanitized) or blog
