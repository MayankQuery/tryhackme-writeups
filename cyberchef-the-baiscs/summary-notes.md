# Summary Notes – TryHackMe: CyberChef – The Basics

This document summarizes all tasks, concepts, operations, and key takeaways from the TryHackMe room [CyberChef: The Basics](https://tryhackme.com/room/cyberchefbasic).

---

## Task 1: Introduction

**Goal:** Understand what CyberChef is and why it is useful.

- CyberChef is a browser-based tool by GCHQ designed for:
  - Data decoding/encoding
  - Format conversion
  - Data extraction (e.g., IPs, emails)
  - Encryption/decryption
- No installation required; runs fully in-browser.

---

## Task 2: Accessing the Tool

**Access CyberChef:**
- Direct URL: [https://gchq.github.io/CyberChef/](https://gchq.github.io/CyberChef/)

**Features:**
- Works offline
- Drag-and-drop operations
- Searchable list of functions

---

## Task 3: Navigating the Interface

**Interface Sections:**
1. **Operation List (Left Panel):** All available functions (e.g., Base64 decode, Extract IPs).
2. **Recipe Panel (Middle):** Where you build a sequence of operations (drag-and-drop).
3. **Input/Output (Right Panel):** Input your raw data and see the result after applying recipes.

**Useful Buttons:**
- `Bake`: Execute the recipe
- `Clear`: Reset the recipe
- `Export Recipe`: Save your transformation logic
- `Import Recipe`: Load saved logic

---

## Task 4: Before Anything Else

- **Order matters**: CyberChef applies operations in the order they are listed.
- You can use "magic operations" like `Magic` or `Detect File Type` to analyze unknown content.

---

## Task 5: Practice, Practice, Practice

**Sample Exercises:**

1. **Base64 Decoding**
   - Input: `SGVsbG8gd29ybGQ=`
   - Operation: `From Base64`
   - Output: `Hello world`

2. **URL Decoding**
   - Input: `Mayank%20Query%21`
   - Operation: `URL Decode`
   - Output: `Mayank Query!`

3. **Extracting Emails/IPs**
   - Input: `Contact me at admin@example.com or ping 192.168.1.1`
   - Operation: `Extract Email Addresses` and `Extract IP Addresses`
   - Output: `admin@example.com`, `192.168.1.1`

---

## Task 6: Your First Official Cook

**Exercise:** Create a full recipe using multiple steps

**Result:** Data is decoded, ciphered, and reversed.

You can export this recipe as JSON and share or reuse it.

---

## Task 7: Conclusion

- CyberChef is an essential utility for:
  - CTFs
  - Malware analysis
  - Forensics
  - Data exploration

**Advantages:**
- No coding needed
- Fast prototyping of data workflows
- Portable and lightweight

---

## 🔗 References

- TryHackMe Room: [https://tryhackme.com/room/cyberchefbasic](https://tryhackme.com/room/cyberchefbasic)
- Official CyberChef: [https://gchq.github.io/CyberChef/](https://gchq.github.io/CyberChef/)

---

## ✍️ Authored by

**Mayank Pathak**  
[GitHub: @MayankQuery](https://github.com/MayankQuery)

