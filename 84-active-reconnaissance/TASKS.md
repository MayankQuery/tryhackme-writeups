# TASKS.md

# Active Recon — Task Answers 

**Target IP:** `10.201.30.77`

### Task 1 — Introduction
- **Answer:** No answer needed. (Read and ensure AttackBox is ready and you understand active vs passive recon.)

### Task 2 — Web Browser
- **What to do:** Open `http://10.201.30.77` in your browser, open Developer Tools (F12), inspect the page source and Network tab.
- **What to look for (answers to report):**
  - Page title / visible content
  - Response headers (Server, Content-Type, cookies)
  - Any interesting endpoints (JS files, API endpoints)
  - `robots.txt` presence or contents
- **Example command (curl):**
```curl
curl -I http://10.201.30.77
```
- Use the `-I` output to capture headers.

### Task 3 — Ping
- **Command:** `ping -c 4 10.201.30.77`
- **Example expected output (interpretation):**
- If reachable: you will see 4 packets transmitted, replies with RTT times and summary of min/avg/max/mdev.
- If blocked: ping will show timeouts or 100% packet loss.

### Task 4 — Traceroute
- **Command (Linux):** `traceroute -n 10.201.30.77`
- **What to record:** hops, IPs, and whether TTL expired (shows path length). Use `-n` to avoid reverse DNS delays.

### Task 5 — Telnet
- **Command:** `telnet 10.201.30.77 80`
- **Action:** After connection, issue:
```bash
GET / HTTP/1.1
Host: 10.201.30.77
```
- **Record:** HTTP response status, server banner, cookies, any redirect.

### Task 6 — Netcat
- **Port check (single):** `nc -v 10.201.30.77 80`
- **Range scan:** `nc -zv 10.201.30.77 1-1024`
- **Banner grab (HTTP):**
```bash
printf "GET / HTTP/1.1\r\nHost: 10.201.30.77\r\n\r\n" | nc 10.201.30.77 80
```
- **Record results**: open ports, services, banners.

### Task 7 — Putting It All Together
- **Summary answer to submit:**
- I used the browser devtools to inspect the site and network requests. I used `ping` to confirm reachability, `traceroute` to identify the network path, `telnet` and `nc` to interact with and probe the HTTP service on port 80 and to capture banners. I recorded response headers and network responses and noted any interesting endpoints or server fingerprints. (Ensure all outputs/screenshots are included in your report.)

---

**Notes for submission:** paste outputs or screenshots for each command above. If a tool is blocked (e.g., ICMP disabled), note that in the task answer and proceed with other checks (curl, telnet, nc).



