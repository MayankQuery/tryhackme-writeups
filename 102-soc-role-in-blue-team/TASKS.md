# TASKS — TryHackMe: SOC Role in Blue Team

## Task 1 — Introduction
**Q:** (No answer required)  
**Notes:** The room introduces the SOC role, structure, and career path.

---

## Task 2 — Security Hierarchy
**Q:** Where does a SOC fit in a company's security structure?  
**A:** The SOC typically reports to the organization's security leadership (CISO / Head of Security) and interfaces with IT, legal, HR, threat intel, and incident response teams.

---

## Task 3 — Meet the Blue Team
**Q:** What is the Blue Team and what do they do?  
**A:** The Blue Team defends the organization by monitoring systems, detecting threats, responding to incidents, and improving defenses.

---

## Task 4 — Advancing SOC Career
**Q:** What are the typical steps to progress from SOC L1 onward?  
**A:** L1 (triage) → L2 (investigation & remediation) → L3 / Threat Hunter (detection engineering & hunting) → Team Lead / SOC Manager → Head of Security / CISO.

**Q:** What skills should you develop to progress?  
**A:** Log analysis, EDR/forensics, scripting, threat intel interpretation, incident response, detection engineering, and leadership skills.

---

## Task 5 — Final Challenge
**Q:** How would you approach an alert that looks like a brute force attempt? (Example triage steps)  
**A:**  
1. Note alert details (user, IP, time).  
2. Check for related failed attempts across systems.  
3. Confirm whether the IP is known/blacklisted.  
4. If attack confirmed: block IP, reset/lock affected account, escalate to L2 for deeper investigation and containment.  
5. Document actions and communicate to stakeholders.

---

## Task 6 — Conclusion
**Summary:** The SOC is a key defensive function in cybersecurity. Start as L1 to gain exposure to tools and processes, then build investigation and hunting skills to progress. Always focus on process documentation, automation, and continuous learning.

---

## Quick paste-ready answers (for TryHackMe)
- **What does an L1 analyst do?** Alert triage, initial investigation, ticketing, escalation.  
- **What tools do SOC analysts use?** SIEM (Splunk/Sentinel), EDR (CrowdStrike), network tools (Zeek, tcpdump), ticketing tools.  
- **What is the career progression?** L1 → L2 → L3/Threat Hunter → Lead/Manager → CISO.
