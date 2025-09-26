# TASKS — Checklist & hints

This file mirrors the TryHackMe room tasks and gives short, actionable steps and hints you can paste into an issue tracker.

### Task 1 — Introduction
**Objective:** Read the intro and understand goals.  
**Steps:** Mark complete when you can list the components of an enterprise network.  
**Hint:** Focus on what the perimeter protects.  

### Task 2 — Lab Connection
**Objective:** Connect to the AttackBox or VM.  
**Steps:** Verify network connectivity with `ip a` and `ping 8.8.8.8`.  
**Hint:** If you have connection issues, switch NAT/Bridged in VirtualBox or confirm VPN is off.  

### Task 3 — A Network - Overview
**Objective:** Understand network components.  
**Steps:** Draw (or write) the simple diagram: Internet -> Edge -> Firewall -> DMZ -> Internal  
**Hint:** Label typical services found in DMZ (web, mail) and Internal (AD, DB).  

### Task 4 — Network Visibility
**Objective:** Capture and inspect network traffic.  
**Steps:** Run `sudo tcpdump -i eth0 -w /tmp/cap.pcap` while generating traffic; open in Wireshark.  
**Hint:** Use `tcpdump -nn` to avoid name resolution when timestamps matter.  

### Task 5 — Network Perimeter
**Objective:** Describe perimeter device roles.  
**Steps:** List devices and a sentence for each role.  
**Hint:** Remember IDS != IPS: IDS alerts, IPS may block.  

### Task 6 — Monitoring & Protecting
**Objective:** Understand sensors and log pipeline.  
**Steps:** Explain how logs flow from device -> aggregator -> SIEM.  
**Hint:** Mention at least one network sensor (Snort/Suricata).  

### Task 7 — Perimeter Logs: Investigating the Breach
**Objective:** Investigate logs for suspicious activity.  
**Steps:** Use grep/tshark/awk to find repeated events and identify source IP(s). Recommend containment steps.  
**Hint:** Start with timestamps; make a timeline of events.  

### Task 8 — Conclusion
**Objective:** Summarize key lessons and next steps for further practice.  
**Steps:** Suggest further TryHackMe rooms: `Blue Team Fundamentals`, `Network Forensics`, `SOC` rooms.  

---
## Licence
Use this content for study and learning. Attribution appreciated but not required.
