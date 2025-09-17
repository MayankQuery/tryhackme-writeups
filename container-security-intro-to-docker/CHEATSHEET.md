# Docker Cheatsheet — quick reference


## Common docker commands
- Pull an image: `docker pull <image>`
- Run a container: `docker run [options] <image> [command]`
- List running: `docker ps`
- List all: `docker ps -a`
- Stop a container: `docker stop <id>`
- Remove container: `docker rm <id>`
- Remove image: `docker rmi <image>`
- Build image: `docker build -t <name> .`
- Show image history: `docker history <image>`
- Inspect container: `docker inspect <container>`
- Execute inside container: `docker exec -it <container> sh`
- Check logs: `docker logs <container>`


## Useful flags
- `-it` interactive
- `--rm` remove after exit
- `-d` detached
- `--name NAME` set container name
- `-p HOST:CONTAINER` port mapping
- `-v HOST:CONTAINER` volume mount
- `--network` attach to network


## Dockerfile quick template
FROM ubuntu:22.04 WORKDIR /app COPY . /app RUN apt-get update && apt-get install -y python3 python3-pip RUN pip3 install -r requirements.txt EXPOSE 80 CMD ["python3", "app.py"]

## docker-compose.yml minimal example
```yaml
version: '3.8'
services:
web:
build: .
ports:
- "8080:80"
volumes:
- .:/app
db:
image: postgres:15
environment:
POSTGRES_PASSWORD: example
```

## Docker socket notes (security)

- Socket path: /var/run/docker.sock

- Attack surface: if /var/run/docker.sock is mounted into a container, the container can control Docker and mount host directories into new containers, which may expose host files.

### Mitigations:

- Avoid mounting the socket into untrusted containers

- Use rootless Docker where possible

- Use container runtimes and policies (e.g., user namespaces, AppArmor, SELinux)

### Quick debugging tips

- Container fails to start: docker logs <container>

- Cannot connect to container: check port mapping and firewall

- Image build fails: examine the failing RUN step in the Dockerfile output; rebuild with --no-cache if necessary
