# Intro to Docker — NOTES


## Task 1 — Introduction
- Docker is a containerization platform. Containers package apps and their dependencies.
- Images are the immutable templates used to create containers.
- Containers run from images and can be ephemeral (removed when stopped) or persistent if volumes are used.


## Task 2 — Basic Docker Syntax
- `docker run [options] image [command]` — create & run a container.
- `-it` interactive + pseudo-TTY
- `--rm` remove container after exit
- `-d` run detached
- `--name` set container name
- `-p host:container` map ports
- `-v host:container` mount volumes


Examples:
- `docker run --rm -it ubuntu:22.04 bash`
- `docker run -d --name web -p 8080:80 nginx`


## Task 3 — Running Your First Container
Notes:
- `docker ps` shows running containers.
- `docker ps -a` shows all.
- `docker inspect <id>` shows low-level info.
- `docker exec -it <container> bash` lets you run commands inside a running container.


Common gotchas:
- If `docker run` fails due to pulling image, check internet access or Docker Hub rate limits.
- Some images use `sh` not `bash` (alpine uses `sh`).


## Task 4 — Intro to Dockerfiles
- Dockerfile basic structure:
- `FROM` base image
- `RUN` commands to execute at build time
- `COPY` / `ADD` to include files
- `WORKDIR` to set working directory
- `EXPOSE` to document ports (not a runtime mapping)
- `CMD` or `ENTRYPOINT` to set default runtime command

## Task 5 — Intro to Docker Compose
- Compose lets you define multi-container applications in `docker-compose.yml`.
- `docker compose up` reads `docker-compose.yml` (V2 CLI recommended: `docker compose` not `docker-compose`).


Example `docker-compose.yml` excerpt:
```yaml
version: "3.8"
services:
web:
build: .
ports:
- "8080:80"
db:
image: mysql:8
environment:
MYSQL_ROOT_PASSWORD: example
```

## Task 6 — Intro to the Docker Socket

The Docker daemon listens on a socket (usually /var/run/docker.sock).

If a container can access the socket (mounted as a volume), it can control Docker (create containers, mount host files, escalate to RCE).

Security note: Avoid mounting the Docker socket into containers unless absolutely necessary.

Exploit concept (do not misuse): mounting the socket allows docker commands in the container which effectively gives root on the host if the daemon runs as root.

## Task 7 — Practical

Build and run an image from a provided Dockerfile.

Use docker inspect, docker logs, and docker exec to explore containers.

Identify misconfigurations such as exposed sockets, weak credentials, or sensitive files mounted into containers.

### Tips while practicing:

Use --read-only and user options to harden containers when testing.

Look for docker run -v /:/host or similar – high-risk.
