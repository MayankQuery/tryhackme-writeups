
## Environment / Setup
- Using AttackBox or Kali Linux that has network access to the target VM `10.201.60.200`.
- Nessus can run locally or be provided by the lab. If installing on Kali, download the .deb from Tenable and install with `dpkg -i` then enable the service.


## Nessus Scan Tips
- Use the **Basic Network Scan** to fingerprint services and capture common vulnerabilities.
- For web apps, use a **Web Application Tests** or **Advanced Web Scan** template if available — this will look for web-specific issues (sensitive files, cleartext auth pages, clickjacking indicators, etc.).
- Adjust scan credentials (if you have valid creds) for authenticated checks — but for the lab, unauthenticated scans will usually find the items asked.


## Observations from this room (example scan highlights)
- **HTTP server fingerprinting plugin id:** `10107` — this plugin determines the HTTP server type and version.
- **Auth page transmitting creds in cleartext:** `login.php` — discovered by the web scanner.
- **Config backup file extension found:** `.bak` — backup files commonly use `.bak` and may contain sensitive configuration data.
- **Directory containing example documents (in a php directory):** `/external/phpids/0.6/docs/examples/` — example docs often contain sample code and info.
- **Vulnerability related to X-Frame-Options:** **Clickjacking** — absence or misconfiguration of X-Frame-Options can permit clickjacking.


## Interpreting plugin output
- High / Critical results should be reviewed first — they often indicate remote code execution, SQLi, or exposure of sensitive data.
- Info-level or low-level results (server banners, version numbers) are useful for manual follow-up (e.g., verify version vs. public CVEs).
- Look for file paths in plugin output — these point to locations where sensitive files/configs exist.


## Common follow-ups
- When you find `.bak` or `.old` files: try to retrieve and inspect them (if allowed) for credentials or configuration strings.
- For cleartext login pages: verify the form action and request to see whether credentials are being submitted over HTTP (unsecured).
- For clickjacking: check response headers for `X-Frame-Options` or `Content-Security-Policy` frame-ancestors directives.


---
