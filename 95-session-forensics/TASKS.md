# Session Forensics — Task answers & writeups

> NOTE: paste these into TryHackMe where required. Replace placeholders (e.g., `REDACTED_TOKEN`) with sanitized data you collected during the lab.

---

## Task 1 — Introduction
**Q:** What will you investigate in this room?  
**A:** We'll investigate session types (cookies and JWTs), decode tokens to inspect claims, search application logs for suspicious session usage, identify indicators of compromise, and perform containment & remediation steps.

---

## Task 2 — Recap: Session & JWT
**Q:** What differences exist between server-side sessions and JWTs?  
**A:**  
- Server-side sessions: token is an opaque identifier; session state stored on server; server can revoke sessions centrally.  
- JWTs: self-contained; include claims and expiry in payload; verification is via signature; revocation requires additional systems (blacklist/short expiry/rotation).

**Q:** Name two security flags for cookies and why they matter.  
**A:** `HttpOnly` (prevents JS access, mitigating XSS theft), `Secure` (transmit only over HTTPS, prevents token exposure over plain HTTP). `SameSite` helps mitigate CSRF.

---

## Task 3 — Decoding and Inspecting Tokens
**Example token decode (sanitized)**  
Token (sanitized): `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.REDACTED.PARTSIG`

**Steps to decode payload:**

- base64url decode payload
```bash
echo "REDACTED" | tr '_-' '/+' | base64 -d | jq
```
### What to look for in payload:

- sub / user_id (account)

- exp (expiry timestamp)

- iat (issued at)

- jti (unique token id)

- custom claims like roles, is_admin

### Observation sample answer:

- exp was set to far future (30 days) — risky.

- jti was present — can be used for token tracking.

- No aud or iss claims — missing issuer/audience validation.

## Task 4 — Session Forensics, Log Investigation
### Approach

- Identify token or session ID from captured data.

- Search logs for occurrences (access logs & application logs).

- Correlate timestamps, IPs, and user-agent strings.

- Look for anomalies (multiple IPs using same token, requests right after token creation from different IP).

### Example commands

- search for token substring in logs
```bash
grep -R "REDACTED_TOKEN_PART" /var/log/*
```
- correlate by jti
```bash
grep -R "jti\":\"REDACTED_JTI" /var/log/app/* | less
```
- show related requests in access log
```bash
grep "REDACTED_USER_OR_IP" /var/log/nginx/access.log | tail -n 100
```
### Sample findings (fill with lab data)

- jti: abc123 used from IP 10.10.14.5 at 2025-10-01T12:05:23Z and then from 93.184.216.34 a minute later → token reuse from different IPs → likely compromise.

## Task 5 — Investigation Findings, Containment and Remediation
### Findings (sample)

- The session token REDACTED was used by two distinct IP addresses minutes apart.

- Token had exp set to 30 days; token reuse window large.

- The cookie lacked HttpOnly or Secure flags in the test environment.

### Containment steps

- Revoke the session on server side (delete session store entry or add jti to blacklist).

- Rotate affected credentials/tokens and force logout of all active sessions for user(s).

- If signing key exposure suspected, rotate signing keys and issue new tokens.

### Remediation & long-term fixes

- Set HttpOnly and Secure on cookies; configure SameSite=strict or lax appropriately.

- Decrease token lifetime (short exp) and implement refresh tokens with rotation.

- Implement anomaly-based alerts for token reuse / IP jumps.

- Educate users and enforce 2FA for high privilege accounts.

## Task 6 — Conclusion
- Summary: Successful session forensics combines token inspection, log correlation, and rapid containment. Implement defensive controls (secure cookie flags, short expiry, token introspection/blacklist) and monitoring to reduce exposure.



If you want, I can:
- add an MIT license file,
- create a `.gitignore` and `CONTRIBUTING.md`, or
- format these into a ready-to-create GitHub repo ZIP.

Which one would you like next?
