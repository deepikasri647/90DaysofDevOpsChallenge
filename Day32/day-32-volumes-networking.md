## 💾 Task 1 & 2: Data Persistence & Named Volumes

### 1. The Ephemeral Container Problem
* **Observation:** When a database container is created without a volume, its data lives entirely in the container's temporary writable layer. When the container is removed (`docker rm`), all inserted tables and records are permanently lost.
* **Solution:** Docker **Named Volumes** detach storage from the container lifecycle. Managed entirely by Docker inside `/var/lib/docker/volumes/`, named volumes allow new container instances to attach to existing data seamlessly.

---

## 📁 Task 3: Named Volumes vs. Bind Mounts

| Feature | Named Volumes | Bind Mounts |
|---|---|---|
| **Location** | Managed by Docker (`/var/lib/docker/volumes/`) | Explicit path specified on Host filesystem |
| **Primary Use Case** | Databases, persistent application state | Development environments (hot-reloading source code) |
| **Portability** | High (managed via Docker CLI commands) | Dependent on Host machine directory structure |
| **Host Modification** | Harder to edit directly from host | Easily editable using host IDEs/code editors |

---

## 🌐 Task 4 & 5: Docker Networking & Embedded DNS

### 1. Default Bridge Network vs. Custom Bridge Network
* **Default Bridge Network:** Containers are assigned isolated dynamic internal IP addresses. However, pinging or communicating using **container names fails** because automatic DNS resolution is disabled on the default bridge.
* **Custom User-Defined Bridge (`docker network create`):** Automatically enables Docker's **Embedded DNS Server** (listening at `127.0.0.11`). This allows containers on the same custom network to discover and resolve each other automatically using container names instead of hardcoded IP addresses!

---

## 🛠️ Task 6: Complete Stack Architecture Reference

```bash
# 1. Create isolated overlay/bridge network
docker network create production-net

# 2. Deploy database with persistent storage
docker run -d --name postgres-db --network production-net -v db-data:/var/lib/postgresql/data -e POSTGRES_PASSWORD=secret postgres:alpine

# 3. Deploy frontend/app container on the same network
docker run -d --name web-api --network production-net -p 8080:80 my-web-app:v1
