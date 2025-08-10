# Example analysis checklist

## When analyzing an email:

Identify sender and recipient addresses (check for lookalikes and typos).

Inspect Received: chain for origination IP and anomalies.

Check SPF/DKIM/DMARC results.

Check From: vs Return-Path vs Reply-To.

Analyze URLs in the body (hover to inspect but do not click).

Look for credential-harvesting forms, suspicious attachments, or urgent social engineering content.

Document findings and recommended action (quarantine, block sender, report).

# Tools & scripts
scripts/parse_email_header.py — small Python script to extract common header fields and show SPF/DKIM/Received order.

Use mailheader.org, MXToolbox, or local tools like exim/postfix logs when available for deeper analysis (links in notes).

# Sample artifacts
examples/sample-header.txt — real-looking, sanitized email header for practice.

examples/sample-body.html — sanitized phishing email body for analysis exercises.

examples/sample-analysis.md — my walkthrough and notes for the sample.

# Notes & Tips
Always sanitize sensitive data before sharing publicly.

Never open attachments or links from untrusted samples on your primary machine — use a VM or sandbox.

BEC (Business Email Compromise) is when an attacker gains control of a legitimate internal account and uses it to request fraudulent actions — often used in interviews as a common term.

# Contribution
Feel free to open issues, suggest improvements, or submit PRs with additional sample emails, improved parsing, or more detailed checklists.

