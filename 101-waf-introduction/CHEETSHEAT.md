# WAF Cheatsheet — TryHackMe

## 🔥 Quick Definitions
**WAF:** Web Application Firewall  
**CRS:** Core Rule Set (OWASP)  
**Anomaly Score:** Behavioural detection metric  

---

## 🛡️ WAF Detection Types
### ✔ Signature-Based
- Regex patterns  
- Matches known attacks  
Example:  
`SELECT.*FROM`  
`<script>`  
`/etc/passwd`

### ✔ Behavioural/Anomaly
- Tracks request behaviour  
- Increments score on suspicious patterns  
- Blocks if score hits threshold  

---

## 🔍 WAF Fingerprinting
### Passive:
- Response headers  
- Cookie names  
- Server banners  

### Active:
- Send SQLi probes → check error messages  
- Send XSS probes → check filtering behavior  

---

## 🧱 Common WAF Rules (OWASP CRS)
- SQLi: `ARGS:username` contains `' OR '1'='1`  
- XSS: `<script>`  
- LFI: `../etc/passwd`  
- Command injection: `; ls`  

---

## ⚠ Common Bypass Techniques
- Double URL encoding  
- Uppercase/lowercase mutations  
- JSON interpretation confusion  
- Breaking signatures (`SEL/**/ECT`)  
- Appending null bytes  
- Base64 encoded payloads  

---

## 🛠 Tools for WAF Testing
- WAFW00f (fingerprinting)  
- BurpSuite (manual testing)  
- Nmap NSE scripts  
- CRS test payloads  
- Custom fuzzers  

---

## 🧠 Good Practices for Developers
- Do NOT rely on WAF alone  
- Use input validation  
- Set strict content security policies  
- Patch backend systems  
- Rate limit endpoints  
