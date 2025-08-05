# 🧠 Summary Notes - Traffic Analysis Essentials (TryHackMe)

This document contains key takeaways from the TryHackMe room **Traffic Analysis Essentials**, a part of the SOC Level 1 learning path.

---

## 🔐 Task 1: Introduction

- Traffic analysis is a fundamental skill for Security Operations Center (SOC) analysts.
- Helps identify malicious activity, troubleshoot issues, and understand network behavior.
- This room focuses on teaching how to examine network data and recognize anomalies.

---

## 🌐 Task 2: Network Security and Network Data

### 🔸 What is Network Security?

- Network Security: Protecting network infrastructure from unauthorized access, misuse, or theft.
- Involves:
  - Firewalls
  - IDS/IPS
  - Network segmentation
  - VPNs
  - Zero Trust models

### 🔸 Network Traffic & Data

- Network traffic includes all data moving across a network.
- Protocols involved:
  - **TCP/UDP**: Transport protocols
  - **DNS**: Resolves domain names to IPs
  - **HTTP/HTTPS**: Web traffic
  - **SMTP/IMAP/POP3**: Email protocols

### 🔸 Packet Structure

- A network packet has:
  - Header (source, destination, protocol)
  - Payload (actual data)

### 🔸 Capturing Network Data

- Tools:
  - **Wireshark**: GUI-based network analyzer
  - **tcpdump**: CLI-based packet sniffer

---

## 📈 Task 3: Traffic Analysis

### 🔸 Why Analyze Traffic?

- Detect intrusions, malware, or data exfiltration
- Understand attack patterns
- Investigate anomalies

### 🔸 Key Analysis Techniques

1. **Protocol Analysis**
   - What type of traffic is seen? (DNS, HTTP, etc.)
2. **Behavioral Analysis**
   - Is the traffic consistent with known good behavior?
3. **Signature-Based Analysis**
   - Matching known attack patterns (Snort/Suricata rules)

### 🔸 Indicators of Compromise (IOCs)

- Unusual ports or destinations
- Repeated failed login attempts
- Large or unexpected data transfers
- Communication with known malicious IPs/domains

### 🔸 Wireshark Filters Examples

- `http` – shows HTTP traffic
- `ip.addr == 192.168.1.1` – filter packets to/from a specific IP
- `tcp.port == 80` – filter packets on port 80
- `dns` – view DNS queries/responses

---

## ✅ Task 4: Conclusion

- Network traffic analysis is vital for detecting threats in real-time.
- Wireshark is a core tool every SOC analyst should know.
- Understanding network protocols and their behavior is the foundation of good defense.

---

## 📌 Useful Resources

- [Wireshark Filters Cheat Sheet](https://cheatography.com/stefano-picco/cheat-sheets/wireshark-display-filter/)
- [OWASP Traffic Analysis Tools](https://owasp.org/www-community/Vulnerability_Scanning_Tools)

---

📝 **Completed By:** Mayank Pathak  
🔗 [GitHub Profile](https://github.com/MayankQuery)
