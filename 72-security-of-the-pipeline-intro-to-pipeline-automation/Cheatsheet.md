# Cheatsheet — Quick Reference
## Quick commands & checks

- Check Git history for secrets:
```markdown
git log --all -S 'password' --source --patch
```

- Search for exposed tokens in YAML/CI config:
```markdown
grep -R "SECRET\|TOKEN\|PASSWORD" -n .github .gitlab ci || true
```

- Run dependency audit (npm):
```markdown
npm audit --json
```

- Check Docker images for vulnerabilities:
```markdown
docker scan <image>
Pipeline security checklist
```

## Short best-practices

- Build once, promote often — don’t rebuild for each environment

- Treat pipeline logs as sensitive data — redact secrets

- Use ephemeral runners/agents when possible

- Rotate tokens and keys on a schedule

## Attribution / Further reading

- OWASP Software Supply Chain Guidelines

- The Principles of Secure DevOps

- GitHub Actions security hardening guide
