# Day 29 Notes: Introduction to Docker & Containerization

---

## 🛠️ Task 1: What is Docker?

### 1. What is a Container?
A **container** is a lightweight, standalone, and executable package that includes everything needed to run an application: code, runtime, system tools, system libraries, and settings. 

**Why do we need them?**
* **Eliminates "Works on my machine" bug:** Ensures identical execution across local development, testing, and production servers.
* **Lightweight & Fast:** Starts up in seconds and consumes significantly less RAM/CPU compared to traditional Virtual Machines.

### 2. Containers vs Virtual Machines (VMs)

| Feature | Virtual Machines (VMs) | Docker Containers |
|---|---|---|
| **Architecture** | Includes full Guest OS + App | Shares Host OS Kernel + App dependencies |
| **Size** | Gigabytes (GBs) | Megabytes (MBs) |
| **Boot Time** | Minutes | Seconds |
| **Performance** | Higher Resource Overhead | Near-native performance |
| **Isolation** | Hardware-level isolation (Hypervisor) | OS-level isolation (Namespaces & Cgroups) |

### 3. Docker Architecture Explained
* **Docker Client:** The CLI interface (`docker` command) where users type commands.
* **Docker Daemon (`dockerd`):** The background service on the host machine that builds, runs, and manages containers.
* **Docker Image:** A read-only blueprint/template used to build executable containers.
* **Docker Container:** A runnable instance of a Docker image.
* **Docker Registry (Docker Hub):** A public/private cloud repository for storing and pulling Docker images.

---

## 💻 Task 2 & 3: Console Commands Reference

```bash
# Verify Docker execution
docker run hello-world

# Run Nginx web server in detached mode with port mapping (Host 8080 -> Container 80)
docker run -d -p 8080:80 --name my-web-server nginx

# Run Ubuntu interative container shell
docker run -it --name dev-ubuntu ubuntu bash

# List active containers
docker ps

# Check container logs
docker logs my-web-server

# Stop and Cleanup Container
docker stop my-web-server
docker rm my-web-server

❓ Task 4: Key Docker Concepts & Answers
Detached Mode (-d): Runs the container in the background and prints the container ID, freeing up your active terminal shell.

Interactive Mode (-it): -i (interactive) keeps STDIN open, and -t allocates a pseudo-TTY shell, allowing you to interact inside the container terminal.

Port Mapping (-p 8080:80): Maps port 8080 on the host machine to port 80 inside the container. Visiting http://localhost:8080 routes traffic directly to the containerized Nginx server.

