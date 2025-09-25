## Task 1 — Introduction
- Read the room description and understand Nessus basics.


## Task 2 — Installation
- If running locally: download and install Nessus from Tenable (Deb/RPM/Windows installer). Start the Nessus service and access the web UI at `https://localhost:8834`.
- Note: In AttackBox, Nessus may already be present; open it from the left pane or from the browser.


## Task 3 — Navigation and Scans
- Create a new scan: `New Scan` -> choose template (Basic Network Scan / Web Application Tests).
- Target: `10.201.60.200`.
- Start scan and monitor progress.


## Task 4 — Scanning!
- Wait for the scan to complete — web scans can take several minutes.
- Open scan results; filter by plugin ID or by keywords (e.g., `.bak`, `login.php`, `Clickjacking`).


## Task 5 — Scanning a Web Application!
**Room questions & answers** (copy these into the room answers; they were observed during the scan):


1. **What is the plugin id of the plugin that determines the HTTP server type and version?**
- **Answer:** `10107`


2. **What authentication page is discovered by the scanner that transmits credentials in cleartext?**
- **Answer:** `login.php`


3. **What is the file extension of the config backup?**
- **Answer:** `.bak`


4. **Which directory contains example documents? (This will be in a php directory)**
- **Answer:** `/external/phpids/0.6/docs/examples/`


5. **What vulnerability is this application susceptible to that is associated with X-Frame-Options?**
- **Answer:** `Clickjacking`


> Tip: Use the Nessus web interface search/filter to quickly find results by plugin id or keyword.


---
