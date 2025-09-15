# Notes — Intro to Pipeline Automation
## 1. What is a DevOps pipeline?

- A DevOps pipeline is an automated sequence of steps that take source code changes and produce a deployable artifact. Typical stages include: source control -> build -> test -> package -> deploy -> monitor.

## 2. Why automate pipelines?

- Speed: faster feedback loops and deployments

- Consistency: repeatable processes reduce human error

- Scalability: repeatable across multiple projects/environments

## 3. Common pipeline tools

- Source control: Git, GitHub, GitLab

- CI/CD: Jenkins, GitHub Actions, GitLab CI, CircleCI

- Build tools: Maven, Gradle, npm

- Containerization/orchestration: Docker, Kubernetes

- Package & dependency managers: npm, pip, Maven Central

- Secret management: HashiCorp Vault, AWS Secrets Manager

## 4. Pipeline security concerns (high level)

- Credential leakage: storing secrets in plaintext (repos, YAML, history)

- Compromised runners/agents: shared runners with attacker access

- Insecure dependencies: supply-chain attacks via malicious packages

- Misconfigured IAM/permissions: overly broad roles for automation users

- Artifact tampering: unsigned artifacts or unaudited registries

## 5. Secure pipeline design principles

- Least privilege: grant minimal permissions to pipeline principals

- Secrets handling: use secret stores and avoid committing secrets

- Immutable artifacts: build once, promote across environments

- Strong audit & logging: enable pipeline logs + monitoring

- Dependency provenance: pin versions and verify checksums/signatures

- Environment segmentation: separate build, staging, and prod environments

## 6. Quick example: GitHub Actions security notes

- Do not store secrets as plain files; use GitHub Secrets

- Carefully vet third-party actions (prefer official or pinned versions)

- Avoid workflow_dispatch that exposes tokens incorrectly
