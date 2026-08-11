# Day 45 Notes: Docker Build & Push in GitHub Actions

---

## 🚀 Task 1, 2 & 3: Automated Docker CI/CD Workflow (`docker-publish.yml`)

```yaml
name: Day 45 - Docker Build & Push CI/CD

on:
  push:
    branches: [ main ]
  workflow_dispatch:

jobs:
  build-and-push:
    name: Build & Push Docker Image
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v4

      - name: Extract Short Git Commit SHA
        id: vars
        run: echo "short_sha=$(git rev-parse --short HEAD)" >> $GITHUB_OUTPUT

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3

      - name: Log in to Docker Hub
        if: github.ref == 'refs/heads/main'
        uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_TOKEN }}

      - name: Build and Push Docker Image
        uses: docker/build-push-action@v5
        with:
          context: .
          file: ./Day45/Dockerfile
          push: ${{ github.ref == 'refs/heads/main' }}
          tags: |
            ${{ secrets.DOCKER_USERNAME }}/90daysofdevops:latest
            ${{ secrets.DOCKER_USERNAME }}/90daysofdevops:sha-${{ steps.vars.outputs.short_sha }}

```

🔒 Task 4: Conditional Push Safeguards
Push Strategy: The workflow uses github.ref == 'refs/heads/main' to enforce that Docker Hub logins and registry push events only occur when commits merge into main.

Feature Branches & PRs: When triggered on feature branches or pull requests, the workflow tests the Docker build locally on the GitHub runner (push: false) to catch compilation bugs without polluting the public Docker Hub registry.

🐳 Task 6: Testing & Pulling the Image Locally
Execute these commands in your local terminal or cloud server to pull and verify the published container:

```

# Pull the latest image published by the pipeline
docker pull deepikasri647/90daysofdevops:latest

# Run the container locally on port 5000
docker run -d -p 5000:5000 --name test-app deepikasri647/90daysofdevops:latest

# Verify the application response
curl http://localhost:5000

```

🛣️ The Full Journey: From git push to Running Container

<img width="442" height="775" alt="image" src="https://github.com/user-attachments/assets/7340208b-04f0-4f62-bee3-1cd6b34b0ea8" />

1.Code Commit: Developer commits code changes locally and runs git push origin main.

2.Event Trigger: GitHub detects the push event on the main branch and triggers .github/workflows/docker-publish.yml.

3.Runner Provisioning: GitHub spins up an isolated ubuntu-latest runner virtual machine.

4.Environment Setup & Authentication: The runner checks out code, initializes docker/setup-buildx-action, and authenticates against Docker Hub using encrypted repository secrets (DOCKER_USERNAME and DOCKER_TOKEN).

5.Build & Dual Tagging: docker/build-push-action compiles the container image based on Dockerfile and attaches two tags:

        :latest (representing current stable release)

        :sha-<short-hash> (providing immutable version traceability tied directly to the git commit)

6.Registry Push: The built image layers are pushed to public/private registry repos on Docker Hub.

7.Deployment: Servers or Kubernetes clusters execute docker pull to retrieve the updated image tag and deploy the running container.
