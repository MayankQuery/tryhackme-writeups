# Notes — Introduction to DevSecOps


## 1. What is DevSecOps?
DevSecOps extends DevOps by integrating security into every stage of the software development lifecycle (SDLC). Instead of security being a final gate, it becomes an integral part of development, testing, and deployment.


Key idea: **shift security left** — detect and fix security issues earlier, when they are cheaper and easier to fix.


## 2. History & Evolution of Software Development Models
- **Waterfall** — linear, phase-based model: requirements → design → implementation → verification → maintenance. Slow feedback, late discovery of issues.
- **Iterative models** — introduced faster cycles and repeated improvement.
- **Agile** — short iterations (sprints), close collaboration between business and engineering, continuous feedback.
- **DevOps** — integrates development and operations to deliver faster, more reliable releases. Emphasizes CI/CD, automation, monitoring.
- **DevSecOps** — adds security practices and automation into DevOps pipelines. Cultural change + tooling.


## 3. The Infinite Loop (DevOps Diagram)
DevOps is often represented as an infinity loop: Plan → Code → Build → Test → Release → Deploy → Operate → Monitor → (back to Plan). Security inserts into multiple phases:
- Threat modeling in Planning
- Secure coding and SAST in Code/Build
- Dependency scanning and SCA in Build/Test
- Runtime protections and monitoring in Operate/Monitor


## 4. Shifting Left
- Move security activities earlier in the SDLC: design reviews, automated security testing, dependency checks.
- Benefits: fewer vulnerabilities in production, improved developer security awareness, faster remediation cycles.


## 5. DevSecOps Culture
- Collaboration across teams (dev, ops, security).
- Shared responsibility for security, not just a central security team.
- Automation-first mindset: automate security checks where possible.
- Continuous learning: blameless postmortems, red-team/blue-team exercises, and training.


## 6. Common Tools / Concepts
- CI/CD: Jenkins, GitHub Actions, GitLab CI, CircleCI.
- SAST (Static Application Security Testing): SonarQube, Semgrep, Checkmarx.
- DAST (Dynamic Application Security Testing): OWASP ZAP, Burp Suite.
- SCA (Software Composition Analysis): Dependabot, Snyk, Whitesource.
- IaC Scanning: tfsec, Checkov, Polaris.
- Secret scanning / management: HashiCorp Vault, AWS Secrets Manager, GitHub Secrets.
- Container security: Trivy, Clair.


## 7. The Learning Path (Short)
1. Intro to DevSecOps (this room)
2. Security of the pipeline (SAST, DAST, SCA, dependency management)
3. Security in the pipeline (attack/defend CI/CD)
4. Infrastructure as Code security (Terraform, Docker, Kubernetes)


## 8. Tips for the Room
- Pause and take notes on definitions and diagrams.
- When the lab asks "how would you fix this?" propose an automated control (e.g., block PRs with failing SAST).
- Practice running SAST/DAST locally if a machine is provided.
