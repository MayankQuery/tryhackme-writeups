# Tasks & Walkthrough — Intro to Pipeline Automation

Use this file to copy sensible answers and explanations for the room tasks. If the room has exact questions, paste them here and replace the answers below.

## Task 1 — Introduction

Summary: Automation speeds deliveries but expands attack surface — attackers can target the pipeline to gain persistent or widespread access.

Suggested answer snippet:

- Automation centralises power. With manual processes, an attacker must compromise an individual human or machine; with pipelines, a single compromise can give access to build artifacts, credentials, and multiple environments. Therefore pipeline security is critical.

## Task 2 — DevOps Pipelines Explained

Key points to include:

- Definition of pipeline stages: Source, Build, Test, Package, Release, Deploy, Monitor.

- How automation ties these stages together with tools and runners.

Possible answer:

- A pipeline is a chain of automated stages that transform code into deployed software. Each stage can be automated with CI/CD tools and runs on ephemeral runners/agents.

## Task 3 — Source Code and Version Control

Key concepts:

- Use feature branches, pull requests, code review.

- Protect main branches with branch protection rules (require PR reviews, CI passing).

- Do not commit secrets; use .gitignore and secret scanning.

Sample action items:

- Enable branch protection in the repo

- Use a secret scanning tool (GitHub Secret Scanning, truffleHog)

## Task 4 — Dependency Management

Key concepts:

- Pin dependencies with exact versions (avoid floating ^ or ~ unless intentional)

- Use lockfiles (package-lock.json, poetry.lock, Pipfile.lock)

- Scan dependencies (OWASP Dependency-Check, Snyk, Dependabot)

Supply chain note:

- Consider reproducible builds and validate package checksums to mitigate tampered dependencies.

## Task 5 — Automated Testing

Key concepts:

- Unit, integration, and acceptance testing

- Run tests in CI; failing tests block merges/deploys

- Use test coverage and gating

Security tests:

- SAST (static analysis), DAST (dynamic analysis) integrated into pipeline

## Task 6 — Continuous Integration and Delivery

Key concepts:

- CI: automates build & tests on each commit

- CD: automates release/deploy to environments

- Use gated rollouts and approvals for production deployments

## Task 7 — Environments

Key concepts:

- Keep environments isolated

- Use different credentials per environment

- Promote artifacts between environments instead of rebuilding

## Task 8 — Challenge (example answers)

- Since the original room challenge varies, here's a general approach:

- Identify the secret or weak point shown (e.g., a token in pipeline logs or a hard-coded secret in YAML).

- Demonstrate how to extract it from the pipeline metadata.

- Suggest fixes: rotate the secret, remove it from code, use secret manager, restrict token scope.

Sample remediation steps:

- Rotate compromised token immediately.

- Replace hard-coded secrets with a secrets manager and update the pipeline to fetch secrets at runtime.

## Task 9 — Conclusion

Summary answer:

- Pipeline automation accelerates delivery but requires strong security controls: least privilege, secret management, dependency verification, and robust logging/monitoring. Treat pipelines as first-class assets in threat modelling.
