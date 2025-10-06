# Notes — Learning Cyber Security

## 1) Why learn how the web works?
Understanding how web applications function (HTTP requests/responses, forms, cookies, sessions) is the foundation for finding and understanding web vulnerabilities. Attacking sites is not magic — it’s about knowing how parts work and where they can fail.

## 2) Key topic overviews
- **Web Application Security:** Inputs, authentication, session management, SQLi, XSS, CSRF, file upload issues. Practice: interacting with forms, observing requests, and manipulating inputs.
- **Network Security:** Basics of IP, ports, common services (HTTP, SSH), scanning, and how attackers find targets.
- **System/Endpoint Security:** User privileges, services, log files, and how malware/persistence works.
- **Malware Basics:** Types of malware, how they propagate, and basic detection concepts.
- **Defensive Thinking:** Logs, IDS, patching, backups — defenders focus on containment and detection.

## 3) How to approach the BookFace challenge
- Click **View Site** and interact with the application.
- Inspect HTTP requests (browser DevTools → Network).
- Try typical beginner techniques: test inputs, look for user account pages, and attempt common simple enumerations.
- The room asks for the username of the BookFace account you take over — practice finding it rather than having it handed to you. If stuck, check hints in the room.

## 4) Learning Roadmap (next rooms)
- Beginner: Web Fundamentals → Web Basics / OWASP Top 10 rooms
- Intermediate: SQLi / XSS / Authentication Bypass
- Practical: Capture The Flag style vulnerable apps (e.g., BookFace), followed by TryHackMe web rooms
- Defensive: Intro to SOC, Logging, and Incident Response rooms

## 5) Safety & Ethics
- Only test on labs and machines you have permission to use (like TryHackMe).
- Do not practice offensive techniques on public websites or networks.

