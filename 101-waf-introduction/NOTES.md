# Notes – WAF: Introduction (TryHackMe)

## 🔥 What is a WAF?
A **Web Application Firewall** is a security control that protects web applications by filtering malicious HTTP/S traffic. Unlike network firewalls, WAFs work at **Layer 7 (Application Layer)**.

---

## 🔄 Evolution of Firewalls
1. Packet Filters — Allowed/blocked based on IP/Port  
2. Stateful Firewalls — Tracked connection states  
3. Next-Gen Firewalls — Added DPI & application awareness  
4. **WAFs** — Deep HTTP inspection + application security rules  

---

## 🧱 WAF Detection Techniques
### ✔ Signature-Based Detection
- Uses regex or predefined patterns  
- Detects known threats (SQLi, XSS, LFI, RFI)  
- Fast but vulnerable to bypasses  

### ✔ Behavioural / Anomaly-Based Detection
- Assigns anomaly scores based on request behaviour  
- Blocks when threshold is reached  
- Harder to bypass but prone to false positives  

---

## 🔍 WAF Fingerprinting Methods
### Passive Fingerprinting
- Inspect response headers  
- Detect cookies, banners, custom error pages  

### Active Fingerprinting
- Send crafted payloads and observe responses  
- Example: SQLi test payloads, XSS probes  

---

## 🧩 WAF Rules (OWASP CRS)
Example structure from CRS:
- Rule ID  
- Regex pattern  
- Phase (1 or 2)  
- Action (block, deny, log)  
- Score thresholds  

Rules detect:
- SQL injection  
- XSS  
- Path traversal  
- Command injection  
- Protocol anomalies  

---

## ⚠️ WAF Limitations
- Bypasses via encoding (URL encoding, base64, hex)  
- Over-reliance on signatures  
- False positives (blocking legitimate traffic)  
- Misconfiguration  
- No protection for logic flaws (auth bypass, IDOR)  
- Cannot block zero-days that bypass application logic  

---

## 🧪 OWASP WAFControl VM
- Used for observing WAF behaviour  
- Useful for testing rule hits and bypass payloads  
