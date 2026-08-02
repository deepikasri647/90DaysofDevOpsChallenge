# 🐋 Ultimate One-Liner Docker & Compose Cheat Sheet

---

## 📦 Container Lifecycle
* `docker run -d -p 8080:80 --name my-app nginx` — Run container in detached mode with port mapping.
* `docker run -it ubuntu bash` — Run container in interactive terminal mode.
* `docker ps` — List running containers.
* `docker ps -a` — List all containers (including stopped ones).
* `docker stop <container>` — Gracefully stop a running container (`SIGTERM`).
* `docker start <container>` — Start a stopped container.
* `docker restart <container>` — Restart a container.
* `docker kill <container>` — Force stop a container immediately (`SIGKILL`).
* `docker rm <container>` — Remove a stopped container.
* `docker rm -f <container>` — Force remove a running container.
* `docker logs -f <container>` — Follow live stdout/stderr logs of a container.
* `docker exec -it <container> bash` — Open an interactive shell inside a running container.
* `docker inspect <container>` — Output low-level JSON metadata (IP, mounts, ports) of a container.

---

## 🖼️ Image Operations
* `docker build -t app:v1 .` — Build an image from a Dockerfile in current context.
* `docker build --no-cache -t app:v1 .` — Build image without using cached layers.
* `docker images` — List locally available images.
* `docker pull <image>:<tag>` — Download an image from Docker Hub.
* `docker tag local-image:v1 username/repo:v1` — Tag an image for registry push.
* `docker push username/repo:v1` — Push an image to Docker Hub.
* `docker rmi <image>` — Delete a local image.
* `docker image history <image>` — View layer history and sizes of an image.

---

## 💾 Volumes (Data Persistence)
* `docker volume create <vol_name>` — Create a named volume.
* `docker volume ls` — List all named volumes.
* `docker volume inspect <vol_name>` — View host storage path details for a volume.
* `docker volume rm <vol_name>` — Remove a named volume.
* `docker run -v vol_name:/data app` — Attach a named volume to a container.
* `docker run -v /host/path:/container/path app` — Bind mount a host directory into a container.

---

## 🌐 Networking
* `docker network ls` — List all Docker networks.
* `docker network create --driver bridge <net_name>` — Create a custom bridge network.
* `docker network inspect <net_name>` — View containers connected to a network.
* `docker network connect <net_name> <container>` — Connect a running container to a network.
* `docker network disconnect <net_name> <container>` — Disconnect a container from a network.

---

## 🐙 Docker Compose
* `docker compose up -d` — Build, create, and start multi-container stack in detached mode.
* `docker compose up --build -d` — Force rebuild images and restart stack.
* `docker compose down` — Stop and remove containers and networks created by Compose.
* `docker compose down -v` — Stop and remove containers, networks, **and named volumes**.
* `docker compose ps` — List running services managed by Compose.
* `docker compose logs -f [service]` — Follow live logs for Compose services.
* `docker compose exec <service> bash` — Execute interactive command inside a Compose service.
* `docker compose stop` / `docker compose start` — Stop or start Compose services without removing them.

---

## 🧹 System Cleanup & Maintenance
* `docker system df` — Check total disk space consumed by images, containers, and volumes.
* `docker container prune -f` — Remove all stopped containers.
* `docker image prune -a -f` — Remove all unused/dangling images.
* `docker volume prune -f` — Remove all unattached named volumes.
* `docker system prune -a --volumes -f` — Nuclear option: Remove ALL stopped containers, unused networks, unreferenced images, and volumes!

---

## 📜 Dockerfile Directive Quick Reference

| Instruction | Purpose |
|---|---|
| `FROM` | Sets the base image (e.g., `alpine:3.19`, `node:18-alpine`). |
| `WORKDIR` | Sets active working directory inside the container. |
| `COPY` | Copies files from host machine to container filesystem. |
| `RUN` | Executes bash commands during **build phase** (creates new image layer). |
| `EXPOSE` | Documents intended container listening port. |
| `ENV` | Sets environment variables inside container runtime. |
| `USER` | Switches execution user (e.g., `USER appuser` for non-root security). |
| `CMD` | Default runtime command or arguments (easily overridden during `docker run`). |
| `ENTRYPOINT` | Fixed executable binary target that always runs on container startup. |
