# Day 42 Notes: GitHub-Hosted vs. Self-Hosted Runners

---

## 🌐 Task 1 & 2: GitHub-Hosted Runners Inspection

A **GitHub-Hosted Runner** is an ephemeral virtual machine managed directly by GitHub. Each job runs inside a clean, isolated environment with thousands of standard DevOps utilities pre-installed.

### Workflow Code (`hosted-runners.yml`)

```yaml
name: Day 42 - GitHub Hosted Runners

on:
  push:
    branches: [ main ]
  workflow_dispatch:

jobs:
  ubuntu-job:
    name: Run on Ubuntu Hosted
    runs-on: ubuntu-latest
    steps:
      - name: Print OS and Host Details
        run: |
          echo "OS Name: $(uname -a)"
          echo "Hostname: $(hostname)"
          echo "Current User: $(whoami)"

      - name: Inspect Pre-installed Tools
        run: |
          echo "Docker Version: $(docker --version)"
          echo "Python Version: $(python3 --version)"
          echo "Node Version: $(node --version)"
          echo "Git Version: $(git --version)"

  windows-job:
    name: Run on Windows Hosted
    runs-on: windows-latest
    steps:
      - name: Print OS Details
        run: |
          echo "OS Name: Windows"
          echo "Hostname: $env:COMPUTERNAME"
          echo "Current User: $env:USERNAME"

  macos-job:
    name: Run on macOS Hosted
    runs-on: macos-latest
    steps:
      - name: Print OS Details
        run: |
          echo "OS Name: $(uname -a)"
          echo "Hostname: $(hostname)"
          echo "Current User: $(whoami)"

```

Why Pre-Installed Tools Matter:
Pre-installed software (Docker, Python, Node, Git, AWS CLI, Terraform) eliminates bootstrap overhead, speeding up pipeline execution and saving paid runner compute minutes!

🖥️ Task 3, 4 & 5: Self-Hosted Runner & Label Selection
Self-Hosted Workflow (self-hosted.yml)

name: Day 42 - Self-Hosted Runner Test

on:
  workflow_dispatch:
  push:
    branches: [ main ]

jobs:
  run-on-my-machine:
    name: Execute on Local Self-Hosted Hardware
    runs-on: [ self-hosted, my-linux-runner ]

    steps:
      - name: Checkout Code
        uses: actions/checkout@v4

      - name: Print Hostname and Working Directory
        run: |
          echo "Machine Hostname: $(hostname)"
          echo "Current Directory: $(pwd)"

      - name: Create Test File on Local Machine
        run: |
          echo "Created via GitHub Actions on $(date)" > ~/self-hosted-success.txt
          cat ~/self-hosted-success.txt
```
