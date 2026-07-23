## 🖼️ Task 1: Docker Images Analysis

### Ubuntu vs. Alpine Comparison
* **Ubuntu Image Size:** ~70MB - 80MB (Contains standard libraries, utility tools, and core system utilities).
* **Alpine Image Size:** ~5MB - 7MB (A minimal Linux distribution based on `musl libc` and `busybox`).
* **DevOps Takeaway:** Alpine is heavily preferred for production Docker images because smaller images build faster, transfer quickly across pipelines, and significantly reduce the security attack surface area.

---

## 🧱 Task 2: Understanding Image Layers & Caching

### What are Layers?
A Docker image is composed of a series of **read-only layers**. Each instruction in a `Dockerfile` (e.g., `RUN`, `COPY`, `ADD`) creates a new layer.

### Why does Docker use Layers?
1. **Layer Caching:** If a layer hasn't changed, Docker reuses it from the local cache during builds, dramatically speeding up deployment times.
2. **Storage Efficiency:** Multiple running containers share the same underlying read-only image layers. Only a thin **Writeable Container Layer** is added on top when a container runs.

---

## 🔄 Task 3: Container Lifecycle States

| State | Command | Description |
|---|---|---|
| **Created** | `docker create` | Prepares writable layer, but process execution is NOT started. |
| **Running** | `docker start` / `docker run` | Container process is actively running on CPU/RAM. |
| **Paused** | `docker pause` | Suspends all processes inside using `cgroups` freezer without destroying memory state. |
| **Stopped** | `docker stop` | Sends `SIGTERM` signal (graceful shutdown), followed by `SIGKILL` if timeout occurs. |
| **Killed** | `docker kill` | Immediately sends `SIGKILL` signal (abrupt force stop). |
| **Removed** | `docker rm` | Permanently deletes the writable container layer and its configuration metadata. |

---

## 🧹 Task 5: Cleanup Commands Quick Reference

* `docker system df` → Displays disk space used by Docker images, containers, and volumes.
* `docker stop $(docker ps -q)` → Gracefully stops all active running containers.
* `docker system prune -a --volumes` → Removes all unused containers, networks, unreferenced images, and volumes in one clean sweep.
EOF
