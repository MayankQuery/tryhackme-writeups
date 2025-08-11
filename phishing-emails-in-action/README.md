# TryHackMe — Phishing Emails in Action

![TryHackMe Room Completed](https://img.shields.io/badge/TryHackMe-Completed-brightgreen)

## Overview
**Room:** Phishing Emails in Action  
**Module:** SOC Level 1 — Phishing  
**Difficulty:** Easy  
**Estimated time:** 30 min  
**Room Author(s):** tryhackme, TactfulTurtle

This repository contains my notes, findings, and takeaways from completing the TryHackMe room **"Phishing Emails in Action"**, where I analysed multiple real-world phishing email samples and learned to identify common phishing indicators.

---

## Contents
- `README.md` — this file  
- `notes.md` — my detailed notes & answers to room tasks  
- `screenshots/` — screenshots of the room UI, sample emails and indicators (add your images here)  
- `resources.md` — collection of helpful links and references

---

## Tasks / Lab Flow
I completed the following tasks in the room:

1. Introduction  
2. Cancel your PayPal order — identify indicators in a fake PayPal cancellation email  
3. Track your package — spotting delivery-tracking phishing lures  
4. Select your email provider to view document — credential-harvesting tactic  
5. Please update your payment details — urgency & fake payment forms  
6. Your recent purchase — spoofed purchase receipts  
7. DHL Express Courier Shipping notice — shipping scam techniques  
8. Conclusion — summary & prevention tips

(Full walkthrough with screenshots is in `notes.md`.)

---

## What I learned
- How to identify common phishing indicators: suspicious sender address, mismatched URLs, poor grammar, incorrect branding and logos, urgent/pressure language, unexpected attachments, and requests for credentials or payment info.
- Practical techniques attackers use to make emails look legitimate (spoofed display names, lookalike domains, redirectors).
- Defensive steps: check full email headers, hover to inspect links, verify sender via OTP/secondary channel, mark/report phishing in your provider, enable MFA, keep software updated.
- Awareness and training are key — human vigilance is one of the best defenses.

---

## Example checklist to analyze an email
When assessing a suspicious email, I use this quick checklist:
- Who is the sender (full email address)?  
- Does the display name match the actual address?  
- Are links pointing to the expected domain? (hover to check)  
- Is there an unexpected attachment? (don't open)  
- Is the message pushing urgency/fear/greed?  
- Are logos/branding consistent and high-quality?  
- Confirm via official app/website or contact support via known channels.

---

## Screenshots
(Place screenshots in `screenshots/` and reference them here — e.g. `screenshots/paypal_fake.png`)

---

## Resources & Further Reading
- https://www.knowbe4.com/phishing  
- https://www.itgovernance.co.uk/blog/5-ways-to-detect-a-phishing-email  
- https://cheapsslsecurity.com/blog/10-phishing-email-examples-you-need-to-see/  
- https://phishingquiz.withgoogle.com

---

## How to reproduce / run
This room is TryHackMe-hosted and interactive. To reproduce:
1. Create a free account at TryHackMe (https://tryhackme.com).  
2. Search for **"Phishing Emails in Action"** (module: SOC Level 1).  
3. Launch the room and follow the tasks.  
4. Save screenshots and paste them into `screenshots/` for documentation.

---

## Notes & Answers
See `notes.md` for step-by-step answers and my observations for each task. (Add your task answers to that file.)

---
