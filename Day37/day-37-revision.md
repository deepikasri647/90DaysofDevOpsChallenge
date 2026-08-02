## 📋 Task 1: Self-Assessment Checklist

*  Run a container from Docker Hub (interactive + detached) — **Can do confidently**
*  List, stop, remove containers and images — **Can do confidently**
*  Explain image layers and how caching works — **Can do confidently**
*  Write a Dockerfile from scratch with `FROM`, `RUN`, `COPY`, `WORKDIR`, `CMD` — **Can do confidently**
*  Explain `CMD` vs `ENTRYPOINT` — **Can do confidently**
*  Build and tag a custom image — **Can do confidently**
*  Create and use named volumes — **Can do confidently**
*  Use bind mounts — **Can do confidently**
*  Create custom networks and connect containers — **Can do confidently**
*  Write a `docker-compose.yml` for a multi-container app — **Can do confidently**
*  Use environment variables and `.env` files in Compose — **Can do confidently**
*  Write a multi-stage Dockerfile — **Can do confidently**
*  Push an image to Docker Hub (`deepikasri674`) — **Can do confidently**
*  Use healthchecks and `depends_on` (`condition: service_healthy`) — **Can do confidently**

---

## ⚡ Task 2: Quick-Fire Memory Verification Answers

1. **What is the difference between an image and a container?**
   * An **Image** is a read-only, executable template/blueprint. A **Container** is a running, stateful instance of an image with a thin writeable layer on top.
2. **What happens to data inside a container when you remove it?**
   * Unless stored in a persistent **Named Volume** or **Bind Mount**, all data written to the container's temporary writable layer is permanently deleted.
3. **How do two containers on the same custom network communicate?**
   * They resolve and reach each other using their **Container/Service Names** via Docker's built-in **Embedded DNS Server** (e.g., `ping backend-db`).
4. **What does `docker compose down -v` do differently from `docker compose down`?**
   * `docker compose down` stops and removes containers and networks. The `-v` flag additionally deletes attached **Named Volumes**, destroying persistent database data.
5. **Why are multi-stage builds useful?**
   * They separate the compilation/build environment from the runtime environment, drastically reducing final image sizes (e.g., from ~800MB to ~15MB) and stripping out unnecessary build tools to reduce security vulnerabilities.
6. **What is the difference between `COPY` and `ADD`?**
   * `COPY` copies local files/directories from the host to the container. `ADD` does the same but also supports extracting local `.tar` archives automatically and downloading remote URLs (best practice: prefer `COPY` for clarity).
7. **What does `-p 8080:80` mean?**
   * It maps host port `8080` to container port `80` (`-p <host_port>:<container_port>`).
8. **How do you check how much disk space Docker is using?**
   * Run `docker system df`.

---

## 🎯 Task 3: Revisited Weak Spots

1. **Custom Network Service Discovery:** Re-practiced creating explicit user-defined bridge networks (`docker network create app-net`) and verified embedded DNS resolution between containers.
2. **Healthchecks & Race Conditions in Compose:** Re-tested `condition: service_healthy` coupled with `mongosh`/`pg_isready` health check commands to prevent API containers from crashing during database initialization.
