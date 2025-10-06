# Active Recon Cheatsheet — Quick Commands

## Browser
- Open DevTools: `F12` or `Ctrl+Shift+I`
- Network tab: reload page to see requests
- Check `robots.txt`: `http://<ip>/robots.txt`
- Check `.env` / `.git` only if authorized

## Ping
- `ping -c 4 10.201.30.77`  → send 4 ICMP requests

## Traceroute
- Linux: `traceroute -n 10.201.30.77`
- macOS/BSD: `traceroute 10.201.30.77`
- Windows: `tracert 10.201.30.77`

## Telnet
- Connect to port: `telnet 10.201.30.77 80`
- Send HTTP request manually:
```bash
GET / HTTP/1.1
Host: 10.201.30.77
```

## Netcat (nc)
- Check single port: `nc -v 10.201.30.77 80`
- Scan range: `nc -zv 10.201.30.77 1-1024`
- Banner grab via HTTP:
```bash
printf "GET / HTTP/1.1\r\nHost: 10.201.30.77\r\n\r\n" | nc 10.201.30.77 80
```

## Helpful extras
- `curl -I http://10.201.30.77`  — show response headers
- `curl -sS http://10.201.30.77 | head` — quick look at page content
- `nmap -sS -sV 10.201.30.77` — deeper port scanning (if allowed)

