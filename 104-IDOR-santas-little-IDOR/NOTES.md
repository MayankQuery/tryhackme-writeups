# Notes – IDOR: Santa’s Little IDOR 🎅🔐

This file contains all conceptual notes from the TryHackMe IDOR room.

---

## 🔐 What is IDOR?

**IDOR (Insecure Direct Object Reference)** is an access control flaw where a user can directly manipulate an identifier to access someone else’s data.

Example:
```html
/view_profile?user_id=10 → change to user_id=11
```

It occurs when:

- The application trusts user-supplied object references  
- No authorization check verifies data ownership  

---

## 🔑 Authentication vs Authorization

### **Authentication**
Verifying *who* you are.

### **Authorization**
Verifying *what you can access*.

Authorization **must** occur after authentication.

---

## 🧗 Privilege Escalation Types

### **Vertical privilege escalation**
Normal user → Admin functionality

### **Horizontal privilege escalation** (IDOR)
Normal user → Other normal user's data  
**Most IDORs are horizontal.**

---

## 🛠️ Forms of IDOR Observed in This Room

### 1️⃣ **Plain Numeric IDOR**
- Session data stored in localStorage  
- Changing `user_id` displayed another user’s dashboard

### 2️⃣ **Base64-encoded IDOR**
Example:
`Mg==` is Base64 → `2`
Still easy to guess → still vulnerable.

### 3️⃣ **Hash-based References (MD5)**
Looks random, but:
- Deterministic
- Predictable if input known

### 4️⃣ **UUID v1-based IDOR**
UUID v1 uses:
- Timestamp
- MAC address

If timestamp range is known, UUIDs become guessable → IDOR possible.

---

## 🎯 How to Fix IDOR

- Server-side authorization checks on *every* request  
- Never rely on:
  - Encoding (Base64)
  - Hashing (MD5/SHA1)
  - Sequential IDs  
- Use access control checks like:
```java
if (request.user_id != object.owner_id) {
deny();
}
```

- Monitor logs for repeated unauthorized access attempts  
- Generate objects with unguessable random identifiers (UUIDv4)

---

## 🧠 Key Insight

**Hiding identifiers ≠ preventing IDOR**  
Only **proper authorization** prevents IDOR exploitation.
