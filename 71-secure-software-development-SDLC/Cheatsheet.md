# Cheatsheet — SDLC / SecSDLC Quick Reference

## SDLC phases (one-liner)
- **Reqs:** Capture security & compliance needs
- **Design:** Threat model + secure architecture
- **Implement:** Secure code + code review
- **Test:** SAST/DAST/SCA + functional tests
- **Deploy:** Harden + IaC scanning
- **Operate:** Monitoring + patching + incident response

## Quick secure coding rules
- Validate input server-side
- Use parameterized queries for DB access
- Implement proper auth & session management
- Principle of least privilege for services & accounts
- Fail securely and log safely (no PII in logs)
  
## Threat modeling checklist
- Identify assets
- Draw data flow diagram (DFD)
- Mark trust boundaries
- List threats using STRIDE
- Prioritize with risk matrix (Impact x Likelihood)

## CI/CD gates (must-have)
- Unit tests pass
- SAST score threshold
- Dependency check: no critical vulnerabilities
- Container scan: no high severity
- Secret scanning: none
- Manual approval for production deploys

## Common tools (quick)
- SAST: SonarQube, Semgrep, Bandit
- DAST: OWASP ZAP, Burp Suite
- SCA: Snyk, Dependabot
- Container: Trivy, Clair
- IaC scanning: Checkov, tfsec

## DevOps metrics (top 5)
1. Deployment frequency
2. Lead time for changes
3. Change failure rate
4. MTTR
5. Vulnerability remediation time
