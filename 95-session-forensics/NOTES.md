# Session Forensics — Notes & Walkthrough

## 1) What is session forensics?
Session forensics is the process of investigating authentication/session artifacts (cookies, session IDs, JWTs, tokens) and application logs to determine how a session was created, used, and possibly compromised.

---

## 2) Common session types
- **Session cookie** (server-side): opaque ID stored in a cookie, mapped to server session store.
- **JWT (JSON Web Token)**: self-contained token with header.payload.signature (base64url).
- **Stateless tokens**: API keys, bearer tokens.
- **Session fixation tokens**: attacker forces victim to use an attacker-controlled token.

---

## 3) Inspecting tokens (quick principles)
### JWT structure
HEADER.PAYLOAD.SIGNATURE

Base64url-decode the header and payload to read claims:
- header = `echo 'eyJ...' | base64 --decode` (use base64url-aware tool or Python)
- payload contains `sub`, `exp`, `iat`, `roles`, `jti`, `iss`, `aud` etc.

Example: decode with Python (no signature verification)
```python
import base64, json
def b64url_decode(s):
    s += '=' * (-len(s) % 4)
    return base64.urlsafe_b64decode(s)
token = "HEADER.PAYLOAD.SIG"
h,p,_ = token.split('.')
print(json.loads(b64url_decode(h)))
print(json.loads(b64url_decode(p)))
```
### Cookies / Session IDs

- Look at Set-Cookie headers for HttpOnly, Secure, SameSite.

- Opaque session IDs should be mapped to server logs for user, IP, timestamps.

## 4) Log sources to check

- Web server logs (nginx/apache) — connection details, user-agent.

- Application logs — login events, token issuance, session creation, session invalidation.

- Authentication service logs — token creation and revocation.

- Reverse proxy / WAF logs — anomalies and blocked requests.

- Database logs (if session store is DB-backed) — session creation/deletion events.

Important fields: timestamp, IP, user-agent, requested resource, session id/JWT jti, username/email.

## 5) Indicators of compromise (IoC)

- Sudden session usage from new/foreign IPs.

- Multiple distinct IPs using same session token.

- Long-lived sessions past exp due to invalid token handling.

- Token reuse after logout or after server-side session invalidation.

- Suspicious user-agent strings or automation patterns.

## 6) Detection & alerts

- Monitor token reuse: same jti used from different IPs / geo-locations.

- Detect missing HttpOnly or Secure on cookies in production.

- Alert on exp claims far in future (e.g., exp > 30 days).

- Alert when sub (or user) logs in from IP with different country within short time.

## 7) Containment & remediation steps

- Immediately revoke affected session tokens / server-side sessions.

- Force password reset for impacted accounts (if compromise confirmed).

- Invalidate all active sessions for user(s).

- Patch vulnerabilities: fix insecure cookie flags, shorten session expiration, rotate signing keys if necessary.

- Review logs to find the initial access vector and close it (CSRF, XSS, credential stuffing).

- Notify affected users per policy.

## 8) Example investigative commands

- Find occurrences of a token in logs:
```bash
grep -R "SESSION_ID_OR_JWT_PART" /var/log/
```

- Search access logs for IP / user agent activity:
```bash
grep "user@example.com" /var/log/nginx/access.log | tail -n 50
```

- Pretty-print JWT payload using jq + python:
```python
python3 - <<'PY'
import base64, json, sys
t = sys.argv[1]
p = t.split('.')[1]
p += '=' * (-len(p) % 4)
print(json.dumps(json.loads(base64.urlsafe_b64decode(p)), indent=2))
PY
```
## 9) Notes on safe handling

- Never paste real secrets or tokens in public repos.

- Replace tokens with placeholders REDACTED_TOKEN before committing.


Useful regex

JWT token pattern (rough): [A-Za-z0-9\-_]+\.[A-Za-z0-9\-_]+\.[A-Za-z0-9\-_]+

Session cookie pattern: Set-Cookie: session=[A-Za-z0-9\-_=]+;
