# Cheatsheet — Quick Commands & Concepts


## Git / Repo
- Clone: `git clone <repo_url>`
- Branch: `git checkout -b feature/devsecops-notes`
- Commit: `git add . && git commit -m "docs: add tryhackme devsecops notes"`
- Push: `git push origin feature/devsecops-notes`


## Common Tools (Quick Usage)
- **Semgrep** (SAST): `semgrep --config p/ci` or `semgrep --config=rules/ path/`
- **Trivy** (containers / SCA): `trivy image <image:tag>`
- **OWASP ZAP** (DAST quick scan): `zap-cli quick-scan --self-contained --start-options '-daemon' http://localhost:8080`
- **tfsec** (Terraform): `tfsec .`
- **Checkov**: `checkov -d .`


## CI/CD Best Practices
- Run unit tests, lint, and SAST on PRs (fast checks).
- Run DAST and full SCA on scheduled builds or pre-prod.
- Fail builds on critical/high vulnerability or prevent merging until fixed.
- Rotate and store secrets in managed secret stores; never check into Git.


## Shifting Left Quick Checklist
- Security requirements included in ticket acceptance criteria
- Threat model for each feature or major release
- Developers run local SAST before creating PRs
- Automated dependency scanning enabled
- Secrets scanning enabled in the CI


## Short Definitions
- **SAST**: Static analysis of source code to find vulnerabilities without executing the program.
- **DAST**: Tests a running application to find runtime vulnerabilities.
- **SCA**: Scans software dependencies for known vulnerabilities.
- **IaC Security**: Checks for misconfigurations in Terraform/CloudFormation/ARM.
