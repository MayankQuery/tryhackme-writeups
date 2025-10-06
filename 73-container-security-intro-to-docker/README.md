# Intro to Docker (TryHackMe) — Repository


**Room:** Intro to Docker v2.1 (TryHackMe)
**Estimated time:** 35 min
**Completion progress (example):** 90%


## What this repo contains
- `README.md` — this overview and quick start
- `NOTES.md` — detailed notes and explanations for each task
- `TASKS.md` — the tasks and how to approach them (copy-paste answers where appropriate)
- `CHEATSHEET.md` — compact command and config cheatsheet (Docker commands, Dockerfile, docker-compose examples)


## Learning objectives
By the end of this room you should be able to:
- Understand basic Docker CLI syntax
- Run and deploy containers
- Know how images distribute containers
- Create simple Dockerfiles and build images
- Use Docker Compose for multi-container setups
- Understand the risks of the Docker socket and how it can be abused


## Prerequisites
- Basic Linux command-line familiarity (ls, cd, cat, cp, mv, grep)
- Internet access to pull images
- Docker installed locally (or use the TryHackMe AttackBox)


## Quick start (commands you'll use)
```bash
# Pull and run a simple container
docker run --rm -it alpine sh


# List containers (running and stopped)
docker ps -a


# Build an image from a Dockerfile
docker build -t myimage:latest .


# Run docker-compose up
docker compose up -d


# Inspect logs
docker logs <container_name_or_id>
```
