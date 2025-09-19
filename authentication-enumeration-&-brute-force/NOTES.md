# NOTES — Enumeration & Brute Force
## Lab setup

- Start machine and get MACHINE_IP.

- Add to /etc/hosts:
```markdown
MACHINE_IP enum.thm
```
- Wait ~3 minutes and browse http://enum.thm.

## High-level approach

- Recon & surface: browse the app, capture requests with Burp.

- Look for any pages that leak information (verbose errors, user lookup, reset forms).

- Enumerate usernames using server responses, public information (OSINT), and trial lists.

- Use targeted brute-force only when usernames are known.

- Exploit logic flaws (password reset flows, Basic Auth misconfigurations).

## Common sources of enumeration

- Verbose error messages on login, reset, or forgot-password flows.

- Timing differences between valid/invalid usernames.

- Differences in response bodies or HTTP status codes.

- Client-side JS that exposes endpoints or debug info.

- Public pages (profiles, comments) and metadata.

## Burp workflow tips

- Use Intercept off and run a normal flow while capturing with Proxy -> HTTP history.

- Send suspicious requests to Repeater to test parameter tampering and observe error changes.

- Use Intruder or Logger++ to test username lists when the app responds differently for valid/invalid users.

## OSINT tips for username discovery

- Check robots.txt, sitemap, or public /users endpoints.

- Search the company/target name + "employees" or GitHub/LinkedIn for likely usernames.

- Build a username wordlist from names, emails, and public handles.
