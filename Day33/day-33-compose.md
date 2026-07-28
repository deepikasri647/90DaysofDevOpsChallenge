cd ~/2026/day-33

cat << 'EOF' > day-33-compose.md
# Day 33 Notes: Docker Compose — Multi-Container Application Orchestration

---

## 🛠️ Task 1 & 2: What is Docker Compose?

**Docker Compose** is a tool for defining and running multi-container Docker applications using a declarative `docker-compose.yml` configuration file.

### Key Advantages:
* **Single Command Deployment:** Spin up complex multi-service stacks (`docker compose up -d`) instead of firing dozens of individual `docker run` commands.
* **Automated Default Networking:** Compose automatically creates a shared default network for all services listed in the YAML file. Services can reach each other via their service names (e.g., `wordpress` connects to MySQL using host name `db`).
* **Declarative Configuration:** Infrastructure as Code (IaC) principles — your app's dependencies, ports, and volumes are tracked inside version control (`git`).

---

## 🌐 Task 3 & 5: WordPress + MySQL Stack Architecture

```yaml
version: '3.8'

services:
  db:
    image: mysql:8.0
    environment:
      MYSQL_ROOT_PASSWORD: ${MYSQL_ROOT_PASSWORD}
      MYSQL_DATABASE: ${MYSQL_DATABASE}
      MYSQL_USER: ${MYSQL_USER}
      MYSQL_PASSWORD: ${MYSQL_PASSWORD}
    volumes:
      - db_data:/var/lib/mysql

  wordpress:
    image: wordpress:latest
    ports:
      - "8080:80"
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_USER: ${MYSQL_USER}
      WORDPRESS_DB_PASSWORD: ${MYSQL_PASSWORD}
      WORDPRESS_DB_NAME: ${MYSQL_DATABASE}
    depends_on:
      - db

volumes:
  db_data:
Environment Variables & Security (.env Integration)Hardcoding database passwords directly inside YAML files exposes sensitive credentials in version control repositories. By creating a local .env file and leveraging variable expansion (${MYSQL_PASSWORD}), sensitive parameters stay secure while keeping the compose file reusable across different deployment environments!⚡ Task 4: Essential Docker Compose CLI CommandsCommandDescriptiondocker compose up -dBuilds, creates, and starts all services in the background (detached mode).docker compose psLists all running containers managed by the current docker-compose.yml file.docker compose logs -f [service]Follows real-time stdout logs for all services or a specific target service.docker compose stopStops running container processes without destroying container layers or networks.docker compose startStarts existing stopped containers.docker compose downStops and permanently removes containers, networks, and default configurations created by up.docker compose down -vStops and removes containers, networks, and attached named volumes.docker compose up --build -dForces Docker to rebuild images if custom Dockerfile changes were made.EOF
---

## Part 3: GitHub Commit & Push

Commit and push your files to your fork:

```bash
cd ~/2026/day-33/
git add .
git commit -m "Feat: Add Day 33 Docker Compose multi-container stack, WordPress setup, and CLI reference"
git push origin main
