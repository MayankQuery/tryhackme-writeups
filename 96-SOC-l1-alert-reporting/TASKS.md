# SOC L1 Alert Reporting — Task Writeups

---

## Task 1 — Introduction
**Summary:**  
This room teaches how L1 SOC analysts should **report**, **escalate**, and **communicate** alerts efficiently to ensure high-risk events are handled properly.

---

## Task 2 — Alert Funnel

**Q1:** What is the process of passing suspicious alerts to an L2 analyst for review?  
**A:** **Alert Escalation**

**Q2:** What is the process of formally describing alert details and findings?  
**A:** **Alert Reporting**

**Explanation:**  
L1 analysts review and triage alerts; when they find potential True Positives, they report them and escalate to L2 for deeper investigation. Proper documentation ensures no context is lost during handoff.

---

## Task 3 — Reporting Guide
**Objective:** Learn how to write detailed alert reports.

**Key Steps:**
1. Document the alert source and summary  
2. Add investigation steps (commands, screenshots, logs)  
3. Describe results — true/false positive  
4. Provide recommendations or next actions  

**Tip:** Use consistent SOC reporting templates to maintain clarity and compliance.

---

## Task 4 — Escalation Guide
**Objective:** Learn when and how to escalate alerts.

**Steps:**
1. Validate the alert thoroughly  
2. Attach all relevant evidence  
3. Escalate through official SOC ticketing system  
4. Notify L2 via internal communication channels  

**Criteria for Escalation:**
- Confirmed malware indicators  
- Suspicious privilege escalations  
- Unusual lateral movement  
- Repeated login failures from foreign IPs  

---

## Task 5 — SOC Communication
**Objective:** Understand how to communicate within a SOC.

**Best Practices:**
- Be **clear** and **concise**  
- Use **approved channels** only  
- Keep **records** of all communications  
- Never share sensitive data outside SOC tools  

**Example:**  
L1 asks IT: “Can you confirm if administrative access was granted to user X?”  
L1 asks HR: “Can you verify if employee Y recently joined?”  

---

## Task 6 — Conclusion
**Summary:**  
The room emphasized how **Alert Reporting**, **Escalation**, and **Communication** form the backbone of effective SOC operations.  
Good reporting ensures L2 analysts can act quickly; proper escalation prevents incidents from being overlooked; and effective communication ensures collaboration between teams.

---

## ✅ Key Takeaways
- L1 → L2 → DFIR = structured escalation  
- Document everything  
- Communicate professionally  
- Reporting quality defines SOC efficiency  

---

## ✍️ Personal Reflection
This room improved my understanding of how structured communication and evidence-based reporting contribute to an efficient SOC workflow. I now understand that **alert escalation is not just forwarding tickets—it’s transferring responsibility with context and clarity.**
