# Notes — SDLC (Secure Software Development)


## 1. What is SDLC?
The Software Development Lifecycle (SDLC) is a structured process to design, build, test, and maintain software. Core goals are predictability, quality, and minimizing risk.


### Typical SDLC phases
1. **Requirements** — gather business and security requirements
2. **Design** — system and architecture design, threat modeling
3. **Implementation** — development, secure coding practices
4. **Testing** — functional + security testing (SAST/DAST)
5. **Deployment** — CI/CD, secure configurations
6. **Operations & Maintenance** — monitoring, patching, incident response


> Note: Some models merge or reorder phases (Waterfall, Agile, DevOps). For secure development, integrate security activities into every phase (shift-left).


## 2. Security SDLC (SecSDLC) — mapping security activities
- **Requirements:** define security controls, compliance needs, data classification
- **Design:** architecture review, threat modeling (STRIDE), security patterns
- **Implementation:** secure coding standards (OWASP top 10 awareness), code reviews, SAST
- **Testing:** DAST, dependency scanning, fuzzing, pen-testing if possible
- **Deployment:** IaC scanning, secrets management, hardened images
- **Operations:** runtime monitoring, EDR, patch management, incident response runbooks


## 3. Threat modeling basics
- Use STRIDE to categorize threats: Spoofing, Tampering, Repudiation, Information disclosure, Denial of service, Elevation of privilege.
- Identify assets, define trust boundaries, list entry points, create attack trees, prioritize using risk matrix.


## 4. CALMS model
- **Culture** — security mindset across teams
- **Automation** — CI/CD, tests, scans
- **Lean** — reduce waste; focus on rapid feedback
- **Measurement** — metrics (MTTR, lead time, deployment frequency, escape rate)
- **Sharing** — knowledge sharing, blameless postmortems


## 5. DevOps & Security Metrics
Useful metrics to track security posture in SDLC:
- **MTTR (Mean Time To Recovery)** — time to recover from incidents
- **Mean Time To Detect (MTTD)**
- **Vulnerabilities opened vs closed** (per sprint)
- **Time to remediate critical vulnerabilities**
- **Deployment frequency** and **Change failure rate**
- **Security test coverage** (SAST/DAST automated coverage)


## 6. "Production of the Droids" — interpretation
This TryHackMe task likely uses a metaphor: building reliable CI/CD pipelines and automation to 'produce' stable deployments. Focus on automation, tests, and policy-as-code.


## 7. Practical checklist
- Add SAST in pre-merge pipelines
- Add DAST / SCA in CI/CD with gating rules
- Scan container images in build pipeline
- Protect secrets with a vault (HashiCorp Vault, AWS Secrets Manager)
- Use branch protection & required code reviews
