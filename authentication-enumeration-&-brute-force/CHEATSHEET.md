Cheatsheet — Quick commands & regex
Recon & probing
# Host discovery (already provided by room)
# HTTP headers
curl -I http://enum.thm


# Full request
curl -v http://enum.thm/login
Directory / file discovery
gobuster dir -u http://enum.thm -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -t 50
Username / password enumeration
# Simple curl loop (password reset/login)
for u in $(cat usernames.txt); do curl -s -X POST -d "username=$u" http://enum.thm/forgot-password | grep -i "sent" && echo "FOUND $u"; done


# Hydra (HTTP form / basic)
hydra -L usernames.txt -P passwords.txt enum.thm http-get /protected
Burp Intruder tips

Use clusterbomb/username list in position, grep for distinct response strings.

Set a reasonable throttle and use a small list first.

Regex examples for parsing

Extract token from HTML: token=([A-Za-z0-9_-]{8,})

Check for email: ([a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})

Remediation checklist (for defenders)

Return uniform error messages on login/password-reset.

Implement rate-limiting + lockout for repeated failed attempts.

Use cryptographically secure, single-use, time-limited tokens for resets.

Enforce strong password policies and MFA for sensitive accounts.
