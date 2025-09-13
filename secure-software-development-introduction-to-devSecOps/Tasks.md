# Task 1 — Introduction


**Objective:** Understand what the room will cover and the learning path.


**Notes / Answer:**
- DevSecOps is the practice of integrating security into the SDLC and DevOps processes.
- The room covers the history of software development models, the concept of shifting left, and the cultural aspects of DevSecOps.
- This lab is the first in a DevSecOps learning path that progresses into CI/CD security, pipeline attacks/defense, and IaC.

---

# Task 2 — DevOps: A New Hope


**Objective:** Understand the motivations behind DevOps and how it changed software delivery.


**Notes / Answer:**
- DevOps combines development and operations to enable faster, more reliable releases.
- Key practices: continuous integration, continuous delivery/deployment (CI/CD), infrastructure as code, monitoring, and automation.
- DevOps introduced an "infinite loop" model of continuous feedback and improvement.

---

# Task 3 — The Infinite Loop


**Objective:** Learn the DevOps infinity loop and where security fits.


**Notes / Answer:**
- The loop: Plan → Code → Build → Test → Release → Deploy → Operate → Monitor → Plan
- Security should be applied at multiple points: threat modeling in Plan, SAST during Code/Build, DAST in Test, runtime protections in Operate/Monitor.

---

# Task 4 — Shifting Left


**Objective:** Explain shifting left and its advantages.


**Notes / Answer:**
- "Shift left" means integrating security earlier in the development lifecycle.
- Advantages: faster fixes, lower cost to remediate, fewer production incidents, and improved developer security awareness.
- Example controls: pre-commit hooks, pre-merge CI gates, automated dependency scanners, secure code reviews.

---

# Task 5 — DevSecOps: Security Strikes Back


**Objective:** Define DevSecOps and key responsibilities.


**Notes / Answer:**
- DevSecOps makes security a shared responsibility.
- Responsibilities include: embedding automated security tests, enabling secure defaults, secret management, dependency management, and runtime monitoring.
- The goal is to reduce time-to-detect and time-to-remediate vulnerabilities.

---

# Task 6 — DevSecOps Culture


**Objective:** Understand cultural changes needed to adopt DevSecOps.


**Notes / Answer:**
- Encourage collaboration between dev, ops, and security — security as code and security champions within teams.
- Use blameless postmortems and continuous learning.
- Make security metrics visible and part of team KPIs.

---

# Task 7 — Exercise: Fuel Trouble


**Objective:** Apply concepts from the room to a short exercise.


**Example exercise (answer outline):**
- Identify the security weaknesses in a fictional CI pipeline that:
- Does not run dependency scanning
- Stores secrets in plaintext in the repo
- Has no SAST configured on PRs


**Suggested remediation steps:**
1. Add automated dependency scanning (SCA) to the pipeline; configure to raise alerts or fail on high CVE severity.
2. Move secrets to a managed secret store (e.g., Vault) and add secret scanning to CI.
3. Add SAST (Semgrep/SonarQube) to PR checks and block merges when critical rules fail.
4. Add a scheduled DAST run against a staging environment and add monitoring/alerts for runtime anomalies.
5. Implement a developer onboarding checklist that includes running local SAST and dependency checks.


**Answer notes:**
- Emphasize automation and measurable gates (e.g., PRs must pass SAST and dependency checks).
- Propose threat modeling for critical features and scheduled dependency audits.

