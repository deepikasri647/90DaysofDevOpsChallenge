# Day 36 Notes: Docker Project — End-to-End Application Containerization

---

## 🎯 Task 1: Application Selection & Architecture
* **Chosen Application Stack:** Node.js Express REST API connected to a MongoDB NoSQL database.
* **Why Selected:** Represents a modern production microservice pattern requiring database health checks, secret injection, stateful volume persistence, and secure container runtime execution.

---

## 📜 Task 2 & 3: Dockerfile & Compose Implementation

### Multi-Stage Dockerfile Analysis
```dockerfile
# Stage 1: Build Dependencies
FROM node:18-alpine AS builder
WORKDIR /app
COPY package.json ./
RUN npm install --only=production

# Stage 2: Secure Production Runtime
FROM node:18-alpine
WORKDIR /app

# Security: Non-root user setup
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
COPY --from=builder /app/node_modules ./node_modules
COPY package.json server.js ./

RUN chown -R appuser:appgroup /app
USER appuser

EXPOSE 5000
CMD ["node", "server.js"]
Key Engineering Optimizations Applied:
Multi-Stage Build Pattern: Used node:18-alpine AS builder to compile production dependencies, discarding intermediate build logs and cache files in the final stage.

Security Hardening (Non-Root Execution): Created appuser:appgroup and enforced USER appuser to prevent root-privilege container breakout vulnerabilities.

Optimized Size: Achieved a total final runtime image size of ~175 MB (compared to 1GB+ standard Node images).

Resilient Startup Dependencies: Configured mongosh health check on MongoDB coupled with condition: service_healthy so the app API waits for the database socket before initiating connections.

🐋 Task 4 & 5: Docker Hub Artifact & Public Deployment
Docker Hub Repository: deepikasri674/devops-todo-api on Docker Hub

Pulled and Verified Fresh Deployment: docker pull deepikasri674/devops-todo-api:v1.0.0
