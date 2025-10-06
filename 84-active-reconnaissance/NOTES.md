# Active Reconnaissance — Notes & Walkthrough

**Target IP:** `10.201.30.77`

## Task 1 — Introduction
- Passive vs active reconnaissance:
  - Passive = collecting information without directly contacting the target (public sources).
  - Active = contacting the target (ping, traceroute, telnet, web requests) — may be logged.
- Important: don’t perform active recon without written authorization.

## Task 2 — Web Browser (Developer Tools)
1. Open the target URL (if a web server exists) in your browser (http://10.201.30.77 or hostname).
2. Open Developer Tools (F12):
   - **Elements / Inspector** — view HTML and visible content.
   - **Network** — reload page and inspect requests/responses (status codes, sizes, times).
   - **Headers** — look for `Server`, `X-Powered-By`, cookies, Content-Type, etc.
   - **Console** — JS errors, helpful fingerprints.
3. Check `robots.txt` (`http://10.201.30.77/robots.txt`) and `/.git` or `/.env` (be ethical).
4. Use `View Source` to find comments, hidden metadata and client-side endpoints.

Example quick browser checks:
- Visit: `http://10.201.30.77/`
- Open Network tab → reload → click the main document → check Response Headers.

## Task 3 — Ping
- Purpose: check reachability and latency.
- Example:
```bash
ping -c 4 10.201.30.77
```
- `-c 4` → send 4 packets
- Note round-trip times (min/avg/max/mdev).
- If ICMP blocked, ping may fail even when services are up.

## Task 4 — Traceroute
- Purpose: map the network path to the target.
- Example (Linux):
```bash
traceroute -n 10.201.30.77
```
- `-n` avoids DNS lookups for speed.
- Example (macOS/BSD):
```bash
traceroute 10.201.30.77
```
- Windows equivalent: `tracert 10.201.30.77`.

## Task 5 — Telnet
- Use telnet to test raw TCP connections (simple protocol interaction).
- Example: test HTTP on port 80
```bash
telnet 10.201.30.77 80
```
Then type:
```bash
GET / HTTP/1.1
Host: 10.201.30.77
```
(Press Enter twice after headers)
- Telnet shows raw response headers and body; useful for quick banner grabbing.

## Task 6 — Netcat (nc)
- `nc` is great for testing open ports, banner grabbing and simple transfers.
- Check single port:
```bash
nc -v 10.201.30.77 80
```
- Scan a range (quick check):
```bash
nc -zv 10.201.30.77 1-1024
```
- `-z` zero-I/O mode (scan)
- `-v` verbose
- Use `nc` to send an HTTP GET like telnet:
```bash
printf "GET / HTTP/1.1\r\nHost: 10.201.30.77\r\n\r\n" | nc 10.201.30.77 80
```

## Task 7 — Putting It All Together
- Combine browser checks with simple port checks:
1. Browser → identify site, endpoints, content, JS endpoints.
2. Ping/Traceroute → check connectivity and network path.
3. Telnet/Netcat → test specific service ports and grab banners.
- Keep logs of commands and outputs (screenshots or terminal paste) for reporting.

## Notes & ethics
- Always work within scope and with authorization.
- Active recon leaves logs; if performing red-team work, coordinate with the blue team and ensure legal approval.



