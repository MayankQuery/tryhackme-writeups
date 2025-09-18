# Notes - TryHackMe: Intro to IaC

## 1. Introduction
- IaC = **Infrastructure as Code**: managing and provisioning infrastructure using **code/config files** instead of manual processes.
- It is **integral to DevSecOps** since it ensures automation, consistency, and scalability.

---

## 2. Why IaC?
- **Consistency**: No "it works on my machine" issue.
- **Speed**: Automates provisioning → reduces deployment time.
- **Scalability**: Spin up/down environments easily.
- **Security**: Policies can be embedded into infrastructure code.
- **Version Control**: Infrastructure managed like source code (Git).

---

## 3. IaC - The Concept
- IaC treats infrastructure the same way as application code.
- Tools follow **declarative** (what you want) or **imperative** (step by step) approaches.
- Two key stages:
  - **Provisioning**: Setting up the resources (VMs, networks, storage).
  - **Configuring**: Installing/configuring applications on provisioned resources.

---

## 4. IaC Tools (Part 1)
- **Terraform** → Declarative, cloud-agnostic provisioning tool.
- **AWS CloudFormation** → AWS-native IaC tool.
- **Azure Resource Manager (ARM)** → Azure-native.

---

## 5. IaC Tools (Part 2)
- **Ansible** → Configuration management, agentless, YAML playbooks.
- **Puppet** → Declarative config management, agent-based.
- **Chef** → Ruby DSL, automation/config management.
- **SaltStack** → Config mgmt + remote execution.

---

## 6. IaC Lifecycle
1. **Write** → Define infra in code.
2. **Plan** → Validate/preview before changes.
3. **Provision** → Deploy resources.
4. **Configure** → Apply configurations/software.
5. **Monitor** → Ensure drift detection.
6. **Destroy** → Tear down when no longer needed.

---

## 7. Virtualisation & IaC
- Virtualisation = foundation of IaC.
- Types:
  - **Virtual Machines (VMs)** → OS-level abstraction.
  - **Containers (Docker, Kubernetes)** → Lightweight, faster deployment.
- Both enable scalable, reproducible infrastructure.

---

## 8. On-Prem vs Cloud-Based IaC
- **On-Prem IaC**:
  - Greater control/security.
  - Complex setup, costly.
- **Cloud IaC**:
  - Easy scalability, pay-as-you-go.
  - Reduced management overhead.

---

## 9. The Final Push
- IaC is the **backbone of modern DevOps/DevSecOps**.
- Knowing the right tools and lifecycle is crucial for automation and secure infrastructure delivery.

