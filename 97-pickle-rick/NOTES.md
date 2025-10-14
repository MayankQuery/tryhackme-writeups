# 🗒️ Notes — TryHackMe Pickle Rick

- The web portal accepts Linux commands — acts as a pseudo shell.
- `cat` is restricted, but `tac`, `strings`, and `grep .` work.
- Hidden credentials were found in `robots.txt` and page source.
- Privilege escalation through unrestricted sudo access (no password required).
- A perfect beginner-level room for learning:
  - Web enumeration
  - Command execution
  - Privilege escalation
