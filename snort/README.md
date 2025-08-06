# Snort Intrusion Detection - TryHackMe Room

This repository contains my notes, rules, and practical exercises completed during the [Snort Room](https://tryhackme.com/room/snort) on TryHackMe's SOC Level 1 Path.

## Room Summary

The **Snort Room** introduces the use of Snort as an Intrusion Detection/Prevention System (IDS/IPS). Key learnings:

- Fundamentals of IDS/IPS systems
- Snort operating modes:
  - Sniffer Mode
  - Packet Logger Mode
  - IDS/IPS Mode
  - PCAP Analysis Mode
- Rule writing and structure
- Snort's operation logic

## What I Practiced

| Mode              | Description |
|------------------|-------------|
| Sniffer Mode     | Real-time packet monitoring |
| Packet Logger    | Saving and analyzing traffic later |
| IDS/IPS Mode     | Using Snort with custom rules to detect and block threats |
| PCAP Analysis    | Investigating threats from `.pcap` files |

## Screenshot
![Room Completion](https://github.com/MayankQuery/tryhackme-writeups/blob/main/snort/images/snort-completion.png)

## Snort Rules
Example custom rule:
```snort
alert tcp any any -> any 80 (msg:"Potential HTTP Traffic Detected"; sid:1000001;)
