# TryHackMe — Phishing Emails in Action — Notes

## Overview
Room: **Phishing Emails in Action**  
Difficulty: Easy  
Time taken: ~30 minutes  
Module: SOC Level 1 — Phishing  

These are my personal notes from completing the TryHackMe room **"Phishing Emails in Action"**, where I analysed multiple real-world phishing email examples to identify their indicators and malicious intent.

---

## Task 1 — Introduction
- Room objective: Learn to detect phishing attempts by reviewing actual phishing email samples.
- Focus: Recognising visual and technical clues that indicate malicious intent.
- Awareness is key — phishing works because it exploits human trust and urgency.

---

## Task 2 — Cancel your PayPal order
- **Scenario:** Fake PayPal order cancellation email claiming a transaction you didn’t make.
- **Indicators:**
  - Sender address suspicious: e.g., `paypal-alerts@secure-paypal-verify.com` (lookalike domain).
  - Urgency and fear tactics — "Your account will be charged unless..."
  - Link in email points to non-PayPal domain.

---

## Task 3 — Track your package
- **Scenario:** Package tracking notification from an unknown source.
- **Indicators:**
  - No prior order — context mismatch.
  - Tracking link leads to phishing site.
  - Generic greeting instead of customer name.

---

## Task 4 — Select your email provider to view document
- **Scenario:** Document sharing email requiring you to log in via your email provider.
- **Indicators:**
  - Link points to credential-harvesting page mimicking email login.
  - HTTPS padlock may still be present — but certificate is for unrelated domain.
  - Poor quality logo and formatting inconsistencies.

---

## Task 5 — Please update your payment details
- **Scenario:** Request to update payment details to avoid service interruption.
- **Indicators:**
  - Threat of account suspension.
  - Fake support link.
  - Unusual grammar and spelling mistakes.

---

## Task 6 — Your recent purchase
- **Scenario:** Email confirming a purchase you never made.
- **Indicators:**
  - Encourages clicking a "cancel order" link.
  - Link does not go to vendor's official domain.
  - Spoofed email header.

---

## Task 7 — DHL Express Courier Shipping notice
- **Scenario:** Courier delivery notice with link to schedule delivery.
- **Indicators:**
  - Link leads to phishing site or malware.
  - Mismatched sender domain (not DHL).
  - No tracking number validation.

---

## Task 8 — Conclusion
- **Summary:**
  - All examples relied on urgency, spoofed branding, and fake links.
  - Technical checks (viewing full headers, hovering links) are vital.
- **Defensive steps:**
  - Verify via official website or app, not email links.
  - Enable MFA.
  - Report suspicious messages to IT/security team.

---

## Final Takeaways
- **Human vigilance** is the strongest first line of defense against phishing.
- Use a **phishing checklist**:
  - Check sender’s full email address.
  - Hover over links before clicking.
  - Be cautious with urgent requests.
  - Avoid opening unexpected attachments.
  - Verify with the source directly.
- Training and awareness reduce the risk of falling victim.

---

## References
- https://www.knowbe4.com/phishing  
- https://www.itgovernance.co.uk/blog/5-ways-to-detect-a-phishing-email  
- https://cheapsslsecurity.com/blog/10-phishing-email-examples-you-need-to-see/  
- https://phishingquiz.withgoogle.com
