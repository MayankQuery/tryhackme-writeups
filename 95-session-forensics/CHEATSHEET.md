# Session Forensics — Cheatsheet (Quick commands & tools)

## Decoding JWT (quick)
- Using base64 (be careful with base64url padding):
```bash
# header
echo 'HEADER' | tr '_-' '/+' | base64 -d
# payload
echo 'PAYLOAD' | tr '_-' '/+' | base64 -d | jq
```

- Python one-liner (no verification):
```python
python3 -c "import base64,json,sys; p=sys.argv[1].split('.')[1]+'='*(-len(sys.argv[1].split('.')[1])%4); print(__import__('json').dumps(__import__('json').loads(base64.urlsafe_b64decode(p)), indent=2))" "HEADER.PAYLOAD.SIG"
```
## Search logs
- find token occurrences
```bash
grep -R "PART_OF_TOKEN" /var/log/*
```
- find requests from IP
```bash
grep "1.2.3.4" /var/log/nginx/access.log | tail -n 50
```
- find suspicious user-agent
```bash
grep -i "python-requests" /var/log/nginx/access.log
```
## Common tools

- jq — JSON parsing

- openssl — signature verification (if needed)

- burpsuite / browser devtools — inspect cookies & requests

- python — small token handling scripts

## Example: Verify JWT signature (RS256) using OpenSSL
- Extract header/payload, base64url-decode to a file, then verify with public key:
- (Better to use jwt libraries; this is illustrative)

## Quick REMEDIATION checklist

 - Revoke sessions

 - Rotate keys/tokens if signature keys compromised

 - Force password resets (if needed)

 - Enable Secure & HttpOnly on cookies

 - Review session expiry & idle timeout

 - Add 2FA where possible

## Useful regex

- JWT token pattern (rough): [A-Za-z0-9\-_]+\.[A-Za-z0-9\-_]+\.[A-Za-z0-9\-_]+

- Session cookie pattern: Set-Cookie: session=[A-Za-z0-9\-_=]+;
