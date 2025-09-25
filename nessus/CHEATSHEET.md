

## Quick Nessus / Scanning Cheats


### Starting Nessus (Kali / Debian systems)
- Install (example):
- `sudo dpkg -i Nessus-<version>-debian6_amd64.deb`
- `sudo systemctl start nessusd`
- Visit: `https://localhost:8834`


### Common Nessus Templates
- Basic Network Scan — good for host/service discovery
- Advanced Scan / Web Application Tests — better for web app specifics


### Useful GUI Tricks
- Filter by **Plugin ID** (e.g., `10107`) in the results to jump to specific checks.
- Use the **Filter** box to search for filenames (`.bak`), paths (`/external/phpids/`), or page names (`login.php`).
- Click a result to see details: description, risk factor, affected hosts, output & remediation.


### Quick checks to run manually (from Kali)
- **HTTP header check:**
- `curl -I http://10.201.60.200/` — look for `Server:` header and `X-Frame-Options`.
- **Download suspicious backup:**
- `curl -O http://10.201.60.200/path/to/file.bak` (only in lab environment / with permission)
- **Inspect login page:**
- `curl -s http://10.201.60.200/login.php | sed -n '1,200p'` — look at form fields and `action` attribute.


### Interpreting X-Frame-Options results
- If `X-Frame-Options` is missing or set to `ALLOWALL`, the site is at risk of **clickjacking**.
- Remedy: set `X-Frame-Options: DENY` or `SAMEORIGIN` or add CSP `frame-ancestors` rules.


### When you see `.bak`, `.old`, `.sav` files
- They may contain sensitive info: inspect contents for database credentials or configuration strings.


### Recommended follow-up workflow after a scan
1. Triage High/Critical results.
2. Review web-specific findings and probe manually with curl/browser to confirm.
3. Note file paths and plugin ids for reporting / room answers.
4. Validate fixes (if possible) by re-scanning.


---
