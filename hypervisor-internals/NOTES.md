# NOTES.md

# Hypervisor Internals — Notes

## 1. Introduction to Virtualization
- **Virtualization**: Creating multiple isolated virtual environments (VMs) on shared physical hardware by abstracting compute, memory, storage, and I/O.
- **Virtual Machine (VM)**: A software-emulated machine that runs an OS and apps like a physical machine.
- **Host**: Physical machine running a hypervisor.
- **Guest**: VM running on top of hypervisor.

## 2. Benefits of Virtualization
- **Cost savings**: Consolidate servers; fewer physical machines.
- **High availability**: Live migration, failover possible.
- **Easier management**: Central consoles, snapshots, templating.
- **Scalability**: Allocate resources per-VM, scale as needed.
- **Isolation**: Fault isolation between guests.

## 3. Types of Hypervisors
- **Type 1 (Bare-metal)**: Runs directly on hardware. Examples: VMware ESXi, Microsoft Hyper-V (server), Xen, KVM (often considered Type 1 when run on a host with libvirt), Oracle VM Server.
  - Pros: Better performance, security boundary, enterprise features.
- **Type 2 (Hosted)**: Runs on top of a host OS. Examples: VirtualBox, VMware Workstation/Fusion.
  - Pros: Easier for desktop use, good for labs and dev.

## 4. Hypervisor Landscape
- **VMware**: ESXi, vSphere ecosystem — widely used in enterprise.
- **Microsoft**: Hyper-V — integrated with Windows Server and Azure stack.
- **KVM**: Kernel-based Virtual Machine — Linux native virtualization; commonly managed by libvirt/virt-manager, widely used in cloud (OpenStack).
- **Xen**: Used by some cloud providers (e.g., historically AWS used Xen).
- **VirtualBox / VMware Workstation**: Desktop hypervisors for labs.
- **Containers vs VMs**: Containers (Docker) are lightweight OS-level isolation; not replacement for full hardware virtualization.

## 5. Hypervisor Internals (high level)
- **Virtual CPU (vCPU)** scheduling — hypervisor multiplexes physical CPU to vCPUs.
- **Memory management** — techniques such as ballooning, page sharing, nested paging, memory overcommit.
- **I/O virtualization** — para-virtualized drivers (virtio) vs emulated devices.
- **Device emulation** — hypervisor may emulate NICs, disks, etc., or provide paravirtualized drivers.
- **Storage** — virtual disks (raw, qcow2, VMDK, VHD), snapshot mechanisms.
- **Management plane** — admin APIs, consoles, orchestration (libvirt, vCenter).
- **Control plane vs data plane** — control plane handles admin tasks; data plane handles VM I/O.

## 6. Guest Additions / Tools
- Guest additions (VMware Tools, VirtualBox Guest Additions, QEMU guest agents):
  - Provide drivers and features: clipboard sharing, shared folders, time sync, improved graphics and network drivers, graceful shutdown support.
  - **Security risk**: these run inside guest OS and increase attack surface (privileged drivers, kernel modules, or guest-agent services). Malicious code or misconfiguration may allow escape or data exfiltration.

## 7. Hypervisors in Cybersecurity
- **Attack surface**: hypervisors and management interfaces are prime targets; compromising host can affect many guests.
- **Isolation**: security relies on strict isolation; misconfig or vulnerabilities can lead to breakout (guest → host).
- **Forensics**: VM introspection lets defenders monitor guests from host.
- **Lab use**: hypervisors are essential to build reproducible testbeds (vuln VMs, CTFs, malware analysis).

## 8. Practical tips for labs
- Enable virtualization support in BIOS/UEFI (Intel VT-x / AMD-V).
- Keep management plane access restricted and patched (vCenter, libvirt sockets).
- Use snapshots for quick rollbacks during labs.
- When testing, prefer offline snapshots and isolated networks.

