# Tasks — Walkthrough & Suggested Answers


> Use these as copy-paste answers or reference when completing TryHackMe tasks. They are written to match the TryHackMe room sections: Task 1..Task 7.


## Task 1 — Introduction
**Prompt:** What is the goal of this room?
**Suggested answer:** To learn the Software Development Lifecycle (SDLC) and how to integrate security into each phase (SecSDLC), plus understand CALMS and relevant DevOps security metrics.


## Task 2 — SDLC
**Prompt:** Define SDLC and list its phases.
**Suggested answer:** SDLC is a process to design, develop, test, deploy and maintain software. Common phases: Requirements, Design, Implementation, Testing, Deployment, Operations & Maintenance.


## Task 3 — SDLC Phases Part 1
**Prompt:** Describe security activities in Requirements and Design phases.
**Suggested answer:**
- **Requirements:** capture security & compliance requirements, define data classification, identify regulatory needs.
- **Design:** perform threat modeling (DFDs, STRIDE), select secure architecture patterns, define authentication & authorization model.


## Task 4 — SDLC Phases Part 2
**Prompt:** Describe security activities in Implementation, Testing, and Deployment phases.
**Suggested answer:**
- **Implementation:** apply secure coding standards, run SAST pre-merge, conduct code reviews.
- **Testing:** run DAST, penetration tests, dependency scanning, fuzzing where applicable.
- **Deployment:** use IaC scanning, enforce least-privilege configs, scan images, manage secrets securely.


## Task 5 — Keep CALMS
**Prompt:** What is CALMS and why is it important?
**Suggested answer:** CALMS stands for Culture, Automation, Lean, Measurement, Sharing. It describes a holistic approach to DevOps and DevSecOps — improving culture, automating security checks, measuring metrics, and sharing knowledge leads to secure and fast delivery.


## Task 6 — DevOps Metrics
**Prompt:** Name key metrics that help measure DevOps and security maturity.
**Suggested answer:** Deployment frequency, lead time for changes, change failure rate, MTTR, time to remediate vulnerabilities.


## Task 7 — Production of the Droids
**Prompt:** How does automation and policy-as-code help produce reliable deployments?
**Suggested answer:** Automation standardizes builds and tests, reduces human error, enforces security gates in CI/CD. Policy-as-code codifies security rules; when combined with automated checks, it ensures only compliant artifacts reach production.

---
