# TASKS.md

# Hypervisor Internals — Task Answers & Practical Steps

> Note: The TryHackMe room divides content into tasks. Below are concise answers and a suggested practical workflow you can paste into your TryHackMe report.

## Task 1 — Introduction
**Question:** (No answer needed)  
**Notes:** Virtualization is the abstraction of physical hardware to create multiple isolated virtual machines (VMs). Hosts that provide virtualization are hypervisors.

---

## Task 2 — Types of Hypervisors
**Q:** What are the two main types of hypervisors and an example of each?  
**A:**
- **Type 1 (Bare-metal):** Runs directly on hardware. Example: **VMware ESXi** (also: Xen, KVM when used in host mode).  
- **Type 2 (Hosted):** Runs on top of a host OS. Example: **VirtualBox** (also: VMware Workstation, VMware Fusion).

---

## Task 3 — Hypervisor Landscape
**Short summary answer:**  
- **Enterprise/cloud**: VMware ESXi, Microsoft Hyper-V, KVM (libvirt), Xen.  
- **Desktop/lab**: VirtualBox, VMware Workstation.  
- Hypervisors support many features: snapshots, live migration, paravirtualized drivers, management consoles.

---

## Task 4 — Hypervisors in Cyber Security
**Short summary answer:**  
- Hypervisors provide isolation — but also a single point of failure if compromised.  
- Management interfaces and guest tools expand attack surface.  
- VM introspection can be used for monitoring/malware analysis.  
- Defenders should harden host and limit admin access.

---

## Task 5 — Hypervisor Internals
**Key internals to mention:**
- vCPU scheduling, memory management (ballooning, hugepages), device emulation vs paravirtualization (virtio), virtualization of I/O, storage formats, management plane.

---

## Task 6 — Guest Additions
**Q:** Why are guest additions useful and why can they be risky?  
**A:** Useful for performance, drivers, clipboard/file sharing, time sync. Risky because they run inside the guest with privileged access (kernel modules/agents); they expand attack surface and, if malicious or vulnerable, could be used to compromise guest or help facilitate breakout or data leakage.

---

## Task 7 — Practical
**Suggested lab workflow / commands**:

1. Check host virtualization support
```bash
lscpu | grep -E 'VMX|SVM'
egrep --color 'vmx|svm' /proc/cpuinfo
```
2. Check libvirt / KVM status (if on a Linux host)
```bash
sudo systemctl status libvirtd
virsh list --all
```
3. List VirtualBox VMs (if using VirtualBox)
```bash
VBoxManage list vms
```
4. Inspect a VM's XML (libvirt) to see devices and drivers
```bash
virsh dumpxml <vm-name> | sed -n '1,200p'
```
5. Check for guest additions/services inside a VM (example commands run in guest)
(list services that indicate guest additions)
```bash
ps aux | egrep 'vmtools|vboxservice|qemu-guest-agent|virtio'
lsmod | egrep 'vbox|virtio|vmware|vmmemctl'
```
6. Inspect disk image info (qemu)
```bash
qemu-img info disk.qcow2
```
7. Look for nested virtualization availability (host)
```bash
cat /sys/module/kvm_intel/parameters/nested 2>/dev/null || echo "No nested param file"
```
8. General forensic tip: snapshot before making changes
libvirt snapshot example
```bash
virsh snapshot-create-as --domain <vm-name> snap1 "before-lab" --disk-only --atomic
```

**Practical notes / observations to include in report:**
- Show evidence of virtualization support (lscpu output).  
- Show VM list and note whether it's Type 1/Type 2.  
- Dump VM config (dumpxml) and highlight any paravirtual drivers (virtio) and guest agents.  
- Record any guest additions present (services/modules).

---

## Example answers (short) to paste in TryHackMe:
- **What is a hypervisor?** A program that creates and manages virtual machines by abstracting hardware resources.  
- **Give an example of Type 1 and Type 2 hypervisors:** Type 1 — VMware ESXi; Type 2 — VirtualBox.  
- **Why are guest additions risky?** They provide enhanced functionality at the cost of increasing the guest's attack surface and adding privileged components that may be exploited.

---
