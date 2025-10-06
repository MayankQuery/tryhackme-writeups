# Intro to Docker — TASKS (copy/paste ready)


> Use this file to track the answers you will submit in the TryHackMe room. Replace `<ANSWER>` with the correct answer you discovered.


## Task 1 — Introduction
Q: No answer required.


## Task 2 — Basic Docker Syntax
Q: What flag makes a container run in the background?
A: `-d` (detached mode)


Q: Which command lists all containers (including stopped ones)?
A: `docker ps -a`


## Task 3 — Running Your First Container
Q: What command runs a container interactively using the image `alpine`?
A: `docker run --rm -it alpine sh`


## Task 4 — Intro to Dockerfiles
Q: Which Dockerfile instruction sets the base image?
A: `FROM`


Q: Build command to create image named `myimage`:
A: `docker build -t myimage .`


## Task 5 — Intro to Docker Compose
Q: What file do you write Compose configurations to?
A: `docker-compose.yml` or `docker-compose.yaml` (note: modern CLI supports `docker compose`)


## Task 6 — Intro to the Docker Socket
Q: What is the common path for the Docker socket on Linux?
A: `/var/run/docker.sock`


Q: Why is mounting the Docker socket into a container dangerous?
A: Because it allows the container to control the Docker daemon and create/manage containers on the host — leading to potential host compromise.


## Task 7 — Practical
- Follow the practical steps in the room. Notes on standard commands you will use below:
- `docker build -t practice .`
- `docker run --rm -it practice sh`
- `docker exec -it <container> bash`
- `docker logs <container>`

