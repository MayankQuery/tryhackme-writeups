# Cheatsheet — Quick Tips & Commands

## Browser & Web inspection
- Open DevTools: `F12` (Chrome/Firefox) → Network & Console tabs
- View HTTP request body & response headers to understand form submissions and cookies.

## Common quick checks
- Check page source / hidden fields.
- Look for predictable usernames or admin pages (e.g., `/admin`, `/user`, `/profile`).
- Try simple inputs: `' OR '1'='1` (for SQLi learning in safe labs only).
- Test for reflected XSS by submitting `<script>alert(1)</script>` in non-production labs.

## Useful tools (lab/Kali)
- `curl` — quick HTTP testing: `curl -i -X POST -d "user=test&pass=test" http://bookface.local/login`
- `burpsuite` (intercept & modify requests) — use in a controlled lab environment.
- `wfuzz` / `dirb` — simple directory brute-forcing (lab only).

## Quick command examples
- Save HTTP request to file:
  - `curl -s -D - http://example.local/path -o response.html`
- Simple GET:
  - `curl "http://bookface.local/profile?id=1"`
- Follow redirects and show headers:
  - `curl -i -L http://bookface.local`

## Hints for BookFace task (non-spoiler)
- Inspect profile pages and messages.
- Look for any default or sample accounts.
- If the room gives hints, use them before searching online answers.

