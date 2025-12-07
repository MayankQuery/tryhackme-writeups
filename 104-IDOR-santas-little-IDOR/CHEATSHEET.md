# IDOR Cheatsheet 🎄🔐

Quick reference for IDOR exploitation & detection.

---

## 🔍 1. Identify Object References

Look for:
- `id=`
- `user_id=`
- `product=`
- `child=`
- Base64 strings (`Mg==`)
- Hashes (`c4ca4238a0b923820dcc509a6f75849b`)
- UUIDs (`550e8400-e29b-11d4-a716-446655440000`)

---

## 🛠️ 2. Try Horizontal Escalation

Modify IDs:
```perl
?id=1 → ?id=2
```

Modify stored session values:
```perl
localStorage.setItem('auth_user', '{"user_id": 11}')
```

---

## 📦 3. Base64 Decode/Encode

Decode:
```makefile
echo Mg== | base64 -d
```

Encode:
```makefile
echo -n 2 | base64
```

---

## 🔐 4. Hash Identification

Use online hash identifiers:
- MD5?
- SHA1?
- SHA256?

If you know the original value → generate your own hash.

---

## 🕒 5. UUID v1 Guessing

UUID v1 includes:
- Timestamp  
- MAC address  

If timestamp range is known → reconstruct UUIDs using brute force.

---

## ⚠️ 6. Indicators of IDOR Vulnerability

- Direct numeric IDs in URLs  
- No authentication required  
- Ability to modify localStorage/cookies to impersonate users  
- Encoded IDs instead of secured access control  
- Lack of server-side validation  

---

## ✔️ 7. Fixing IDOR (For Developers)

- Enforce server-side ownership checks  
- Regenerate session tokens securely  
- Use UUIDv4 (random) instead of sequential IDs  
- Implement RBAC/ABAC authorization  
- Log suspicious access attempts  
