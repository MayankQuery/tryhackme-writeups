# Cheatsheet - Intro to IaC

## IaC Basics
- **IaC**: Manage infrastructure with code → automation, consistency, scalability.
- **Two types**:
  - **Provisioning**: Create infra (VMs, storage, networks).
  - **Configuration**: Set up software/services.

---

## IaC Approaches
- **Declarative** → Define *what* you want (Terraform, CloudFormation).
- **Imperative** → Define *how* to achieve it (Ansible scripts, Bash).

---

## IaC Tools
### Provisioning
- **Terraform** → Cloud-agnostic.
- **CloudFormation** → AWS-native.
- **ARM Templates** → Azure-native.

### Configuration
- **Ansible** → Agentless, YAML playbooks.
- **Puppet** → Declarative, agent-based.
- **Chef** → Ruby DSL.
- **SaltStack** → Config + orchestration.

---

## IaC Lifecycle
1. Write  
2. Plan  
3. Provision  
4. Configure  
5. Monitor  
6. Destroy  

---

## Virtualisation & IaC
- **VMs** → Full OS virtualization.  
- **Containers** → Lightweight, fast, scalable.  

---

## On-Prem vs Cloud IaC
- **On-Prem** → High control, costly, secure.  
- **Cloud** → Scalable, flexible, cost-efficient.

