## 🏗️ Task 1 & 5: 3-Tier Microservice Architecture Overview

A production-grade microservice setup requires decoupling frontend/API layers, caching systems, and persistent database layers into distinct isolated components:

1. **`web` (Node.js/Express App):** Built on-the-fly using a custom local `Dockerfile`.
2. **`cache` (Redis):** In-memory data store for transient cache metrics and session tracking.
3. **`db` (PostgreSQL):** Relational database storing persistent records backed by a named volume (`pgdata`).
4. **`app-tier` Network:** An explicit custom bridge network ensuring all three services discover each other securely via internal DNS names (`db`, `cache`).

---

## 🩺 Task 2: `depends_on` vs. Healthchecks (`service_healthy`)

### The Problem
Using a basic `depends_on: [db]` only waits for the database **container to start**. It does NOT wait for the database **engine to finish initializing inside memory**. This frequently causes web application crashes on startup because the app tries connecting before PostgreSQL accepts TCP sockets!

### The Solution
We attach an explicit `healthcheck` block to the database service and use `condition: service_healthy` on the dependent web service:

```yaml
    depends_on:
      db:
        condition: service_healthy

  db:
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U postgres -d appdb"]
      interval: 5s
      timeout: 5s
      retries: 5
The web container startup remains blocked in Waiting state until the PostgreSQL engine returns a successful exit code (pg_isready).🔄 

⚖️ Task 6: Horizontal Scaling & Port Mapping Conflicts
What happens when executing docker compose up --scale web=3 -d?
The command throws a port allocation conflict error:


Bind for 0.0.0.0:3000 failed: port is already allocated
Why simple scaling breaks with host port mapping:
When you bind host port 3000 to container port 3000 (ports: - "3000:3000"), Docker binds that physical socket on the host network interface.

Attempting to spawn 3 replicas of web forces all 3 container instances to bind to host port 3000 simultaneously, which is physically impossible.

Production Fix: Remove static host port bindings from scaled worker services and place an Ingress Reverse Proxy / Load Balancer (Nginx, Traefik, or HAProxy) in front to distribute incoming traffic dynamically across scaled container IPs!
