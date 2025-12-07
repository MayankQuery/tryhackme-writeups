# IDOR – Santa’s Little IDOR | TryHackMe 🎅🔐

This repository contains my write-up, notes, cheat sheet, and solved tasks for the TryHackMe room **“IDOR – Santa’s Little IDOR”**, part of Advent of Cyber 2025.

The room focuses on understanding **Insecure Direct Object Reference (IDOR)** vulnerabilities through hands-on exploitation and analysis of a vulnerable web application.

---

## 🎄 Room Overview

In this room, I learned:

- What **IDOR** (Insecure Direct Object Reference) is  
- How authentication, authorization & privilege escalation relate to IDOR  
- How to exploit visible, encoded, hashed, and algorithm-based references  
- How to perform:
  - Horizontal privilege escalation  
  - IDOR through **Base64**, **MD5**, and **UUID v1 timestamps**  
- How developers mistakenly rely on *encoding*, *obfuscation*, and *hashing* instead of real access control  
- How to fix IDOR securely (server-side authorization checks)

---

## 🧪 Key Techniques Practiced

- Observing API requests via browser developer tools  
- Modifying session data, cookies, and localStorage  
- Changing numeric IDs  
- Decoding Base64 references  
- Identifying hashed references  
- Understanding UUID v1 predictability  
- Performing IDOR-based horizontal privilege escalation  

---

## 📌 Final Answer Summary

| Question | Answer |
|---------|--------|
| What does IDOR stand for? | **Insecure Direct Object Reference** |
| What type of privilege escalation is IDOR? | **Horizontal** |
| Parent with 10 children (user_id)? | **15** |
| Bonus Tasks | No fixed answers required |

---

## 📂 Repository Structure

📁 IDOR-Santas-Little-IDOR
├── README.md
├── NOTES.md
├── CHEATSHEET.md
└── TASKS.md

---

## 🎅 Skills Strengthened

- Web Security  
- Access Control Testing  
- IDOR Exploitation  
- API Analysis  
- Web Application Pentesting  
- Data Reference Enumeration  

---
