# Windows Logging for SOC – Cheatsheet

---

## 🔐 Security Log – Authentication

| Event ID | Description |
|--------|-------------|
| 4624 | Successful logon |
| 4625 | Failed logon |
| 4634 | Logoff |
| 4648 | Logon with explicit credentials |

---

## 👤 Security Log – User Management

| Event ID | Description |
|--------|-------------|
| 4720 | User account created |
| 4722 | User account enabled |
| 4726 | User account deleted |
| 4732 | User added to local group |
| 4728 | User added to global group |

---

## ⚙️ Sysmon Event IDs

| Event ID | Description |
|--------|-------------|
| 1 | Process creation |
| 3 | Network connection |
| 11 | File creation |
| 13 | Registry modification |

---

## 🧾 PowerShell Logging

- Module Logging
- Script Block Logging
- Command Line Logging

---

## 🔎 SOC Tips

- Correlate authentication failures with source IPs
- Monitor PowerShell usage by non-admin users
- Watch for unusual parent-child process relationships
