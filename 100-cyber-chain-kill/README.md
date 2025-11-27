# TryHackMe: Cyber Kill Chain — Write-Up & Notes

## Overview
This repository contains my structured notes and explanations from the TryHackMe “Cyber Kill Chain” room. The Cyber Kill Chain is a model developed by Lockheed Martin that explains the 7 stages of a cyber attack. Understanding each stage helps defenders interrupt attacks early.

---

## Cyber Kill Chain — 7 Phases

### 1. Reconnaissance
The attacker gathers information about the target.
- OSINT
- Scanning
- Service enumeration  
Defense: monitoring, OSINT reduction.

### 2. Weaponisation
The attacker creates a payload based on discovered vulnerabilities.  
Defense: malware scanning, sandboxing.

### 3. Delivery
The payload is sent to the victim.  
Defense: email filtering, secure gateways.

### 4. Exploitation
Payload executes and exploits vulnerabilities.  
Defense: patching, EDR, whitelisting.

### 5. Installation
Attacker installs backdoors or persistence mechanisms.  
Defense: antivirus, FIM, behavioral monitoring.

### 6. Command & Control (C2)
Attacker establishes a channel to control the machine.  
Defense: DNS filtering, network monitoring.

### 7. Actions on Objectives
Attacker performs final goals: data theft, ransomware, lateral movement.  
Defense: SIEM, segmentation, IAM hardening.

---

## Room Question Answer
**How many phases comprise the Cyber Kill Chain?**  
7

---

## Learning Outcomes
- Understanding each kill chain phase
- Real-world examples of attacker behavior
- Defensive measures per stage
- How organizations break attack chains

---

## Conclusion
The Cyber Kill Chain provides clear visibility into an attacker’s steps, allowing defenders to strengthen detection, prevention, and incident response strategies.
