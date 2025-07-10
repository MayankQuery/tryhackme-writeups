# TryHackMe: DNS in Detail 

**Room Link**: [DNS in Detail - TryHackMe](https://tryhackme.com/room/dnsindetail)  
**Difficulty**: Easy  
**Category**: Pre-Security  
**Completion Date**: July 11, 2025

## Description
This room provided a comprehensive introduction to how DNS (Domain Name System) works — from its structure and record types to how a DNS request flows through the internet.

---

## Key Takeaways

- **What is DNS?**  
  DNS translates human-friendly domain names to IP addresses that computers understand.

- **Domain Hierarchy**  
  The hierarchical structure includes root, TLD, domain, and subdomain levels.

- **DNS Record Types**  
  - **A Record**: Maps domain to IP (e.g., `www.website.thm` → `10.10.10.10`)  
  - **CNAME**: Alias record (e.g., `shop.website.thm` → `shops.myshopify.com`)  
  - **MX**: Mail exchange with priority (e.g., priority `30`)  
  - **TXT**: Verifies domain ownership (e.g., `THM{7012BBA60997F35A9516C2E16D2944FF}`)

- **Making a DNS Request**  
  Learned how DNS queries are sent and received, including command-line tools for practical use.

---

## Flags Answered

| Question | Answer |
|---------|--------|
| CNAME of `shop.website.thm` | `shops.myshopify.com` |
| TXT Record of `website.thm` | `THM{7012BBA60997F35A9516C2E16D2944FF}` |
| MX Record Priority | `30` |
| A Record of `www.website.thm` | `10.10.10.10` |

---

## Proof of Completion
![Room Completed](https://github.com/MayankQuery/tryhackme-writeups/blob/main/dns-in-detail/images/dns-in-detail-completion.png) 
![Room Terminal](https://github.com/MayankQuery/tryhackme-writeups/blob/main/dns-in-detail/images/dns-in-detail-completion.png) 

---

## What I Learned
Understanding DNS is critical for cybersecurity professionals — from identifying misconfigured DNS records to DNS-based attacks like spoofing or tunneling. This room laid the foundation for further exploration into network and web security.

---

## Author: [MayankQuery](https://github.com/MayankQuery)
