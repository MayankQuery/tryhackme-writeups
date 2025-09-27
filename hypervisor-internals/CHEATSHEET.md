# Hypervisor Internals — Cheatsheet

## Quick Concepts
- **Type 1** = Bare-metal (ESXi, Xen, KVM as host)  
- **Type 2** = Hosted (VirtualBox, VMware Workstation)  
- **Guest Additions** = vendor guest tools (enhanced drivers + features)

## Useful commands (Linux host / KVM / VirtualBox / general)
> **Check CPU virtualization support**
```markdown
lscpu | grep -E 'VMX|SVM' # VMX = Intel VT-x, SVM = AMD-V
egrep --color 'vmx|svm' /proc/cpuinfo
```

> **Check virtualization packages / services**
- libvirt / qemu
```bash
systemctl status libvirtd
virsh list --all
```

- VirtualBox
```bash
VBoxManage --version
VBoxManage list vms
```


> **QEMU / libvirt common**
- list VMs
```bash
virsh list --all
```

- start/stop
```bash
virsh start <vm-name>
virsh shutdown <vm-name>
```

- inspect domain xml
```bash
virsh dumpxml <vm-name>
```


> **VirtualBox**
- list VMs
```bash
VBoxManage list vms
```
- control
```bash
VBoxManage startvm "<vm-name>" --type headless
VBoxManage controlvm "<vm-name>" acpipowerbutton
```


> **QEMU image handling**
```bash
qemu-img info disk.qcow2
qemu-img convert -O raw disk.qcow2 disk.raw
```

> **Check modules & nested virtualization**
```bash
lsmod | grep kvm
dmesg | grep -i kvm
```

- Enable nested (example for Intel)
```bash
modprobe -r kvm_intel
modprobe kvm_intel nested=1
```


## Filesystems / formats
- **qcow2** — QEMU copy-on-write (snapshots)  
- **raw** — simple raw disk (fast)  
- **VMDK** — VMware disk format  
- **VHD/VHDX** — Microsoft Virtual Hard Disk

## Common signs of guest additions/tools installed
- Services: `vmtoolsd`, `vboxservice`, `qemu-guest-agent`
- Kernel modules: `vboxguest`, `vmmemctl`, `virtio_*`

## Security checks
- Is management interface exposed? (vCenter, libvirt tcp socket)  
- Are guest additions up to date?  
- Is host patched for hypervisor CVEs?  
- Are snapshots accessible with correct permissions?

## Acronyms
- **VT-x / AMD-V** — CPU virtualization extensions  
- **VMM** — Virtual Machine Monitor (another term for hypervisor)  
- **VCPU** — virtual CPU  
- **IOMMU** — Input–Output Memory Management Unit (SR-IOV, passthrough)  
- **SR-IOV** — Single Root I/O Virtualization (network passthrough)
