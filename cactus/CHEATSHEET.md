# Cactus — Task Answers (paste-ready)

## Task 1 — Introduction
**Q:** What is CVE-2022-46169 and why is it critical?  
**A:** CVE-2022-46169 is an unauthenticated remote code execution and authentication bypass vulnerability impacting Cacti versions prior to 1.2.3. It is critical because it allows attackers to execute arbitrary commands remotely without valid credentials, leading to full system compromise. CVSS reported high severity (9.8) due to ease of exploitation and impact.

---

## Task 2 — Exploitation: Authentication Bypass
**Q:** What evidence shows an authentication bypass exists?  
**A:** Evidence includes accessible functionality / admin pages without a valid session token, or being able to interact with privileged endpoints after manipulating request parameters that should require authentication. In-lab, this is demonstrated by accessing certain endpoints or functionality normally protected by login.

---

## Task 3 — Exploitation: Command Injection
**Q:** What input vector allowed command execution?  
**A:** The vulnerable parameter is passed to a backend command or shell without proper sanitization/escaping. Supplying crafted input results in the backend executing unintended commands. (Lab demonstrates the concept; no exploit payloads posted here.)

---

## Task 4 — Detection: Log Analysis and Alerting
**Q:** Which logs indicated malicious activity?  
**A:** Web server access logs and application logs showed anomalous POST/GET requests with unusual parameters or encoded payloads. Kibana alerts were triggered on long payloads, suspicious user-agents, or sequences of requests resembling automatic exploitation.

---

## Task 5 — Detection: SIEM
**Q:** How to detect similar attacks in a production SIEM?  
**A:** Create detections for:
- Unexpected high-entropy or encoded parameters.
- Requests to endpoints that normally don't accept long payloads.
- Sudden spikes in traffic from a single IP to admin endpoints.
- Execution indicators in application logs (e.g., system() calls logged or unusual command outputs captured).

---

## Task 6 — Mitigation
**Q:** What immediate and long-term mitigations should be applied?  
**A:** Immediate: restrict access to Cacti UI via firewall/VPN; apply vendor patch (update to >= 1.2.3). Long-term: input validation, WAF, principle of least privilege, regular patching, and SIEM monitoring with tailored detection rules.

---

## Task 7 — Conclusion
**Q:** Final summary of the incident/room?  
**A:** CVE-2022-46169 demonstrates how input-validation and authentication issues can lead to full RCE. The lab highlights importance of patching, restricting access, and logging/monitoring to detect exploitation early. Practice in a controlled environment improves both offensive and defensive skills.

---
