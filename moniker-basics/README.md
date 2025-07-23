# CVE-2024-21413 – Moniker Link Exploitation

This repository documents my hands-on learning from the **TryHackMe room: Moniker Link (CVE-2024-21413)**, which demonstrates how attackers can exploit the Outlook vulnerability to bypass Protected View and leak user credentials.

---

## **Overview**
- **CVE:** CVE-2024-21413  
- **Vulnerability Type:** Security Feature Bypass in Microsoft Outlook  
- **Impact:** Credential leakage through crafted Moniker links.  
- **Room Link:** [TryHackMe – Moniker Link](https://tryhackme.com/room/monikerlinkcve202421413)

---

## **Learning Objectives**
1. Understand the vulnerability in Outlook's Protected View.
2. Craft a malicious Moniker link to extract NTLMv2 hashes.
3. Learn exploitation techniques and tools for credential harvesting.
4. Explore detection and remediation strategies.

---

## **Key Exploitation Steps**
1. **Identify the target:** Outlook client vulnerable to CVE-2024-21413.
2. **Crafting a malicious RTF file:** Embed Moniker links to trigger NTLM authentication.
3. **Credential harvesting:** Use Responder or other SMB servers to capture hashes.
4. **Detection & Mitigation:** Learn how Microsoft patched the vulnerability and best practices.

---

## **Tools Used**
- **TryHackMe AttackBox**
- **Responder**
- **Python (PoC scripts)**
- **Outlook client simulation**

---

## **Remediation**
- Apply the **February 2024 Patch Tuesday** security updates.
- Disable NTLM authentication when possible.
- Use **Protected View** and disable automatic content loading.

---

## **ScreenShot**
![Room Completion]()

---
