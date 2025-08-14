# Intro to Log Analysis – TryHackMe
 
**Room Difficulty:** Easy  
**Completion:** 100%  
**Time:** ~60 min

## Overview
This repository documents my learnings and hands-on exercises from the TryHackMe room **"Intro to Log Analysis"**.  
The room covers **log analysis best practices, investigation theory, detection engineering, and essential tools** for both manual and automated log analysis.

## Learning Objectives
- Understand **log analysis best practices** for security monitoring.
- Learn **investigation theory** to identify potential security incidents.
- Explore **detection engineering** concepts.
- Compare **automated vs manual** log analysis.
- Gain hands-on experience with:
  - Command-line log analysis tools (grep, awk, sed)
  - Regular expressions for pattern matching
  - CyberChef for data transformation
  - YARA & Sigma for rule-based detection

## Tools & Technologies
- **Command Line Utilities:** grep, awk, sed
- **Pattern Matching:** Regular Expressions (Regex)
- **Data Analysis:** CyberChef
- **Rule-Based Detection:** YARA, Sigma
- **OS:** Linux

## Screenshot
![Room Completion](https://github.com/MayankQuery/tryhackme-writeups/blob/main/intro-to-log-analysis/images/intro-to-log-analysis-completion.png)
![Room Practice]()

## Sample Commands
```bash
# Find suspicious IP addresses in logs
grep -E "192\.168\.|10\." sample_logs.log

# Extract failed login attempts
grep "Failed password" sample_logs.log | awk '{print $1, $2, $3, $11}'

# Apply YARA rules to detect threats
yara yara_rule_sample.yar sample_logs.log
```
## Key Takeaways

- Logs are critical for incident detection and investigation.

- Using the right tools & regular expressions can dramatically reduce analysis time.

- Automated tools speed up repetitive tasks, while manual analysis ensures context awareness.

- Rule-based systems like YARA and Sigma help standardize detection.
  
