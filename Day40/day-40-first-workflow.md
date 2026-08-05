# Day 40 Notes: Your First GitHub Actions CI/CD Workflow

---

## 📜 Task 2 & 4: Workflow Manifest (`hello.yml`)

```yaml
name: Day 40 - First GitHub Actions Workflow

on:
  push:
    branches: [ main ]
  workflow_dispatch:

jobs:
  greet:
    name: Execute Greeting and Environment Inspection
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Repository Code
        uses: actions/checkout@v4

      - name: Print Welcome Message
        run: echo "Hello from GitHub Actions, Deepika Sri! 🚀"

      - name: Print Current Date and Time
        run: date

      - name: Print Triggering Branch Name
        run: echo "Triggered on branch: ${{ github.ref_name }}"

      - name: List Repository Files
        run: ls -la

      - name: Print Runner Operating System Information
        run: uname -a && cat /etc/os-release
```

## 🏗️ Task 3: Understanding GitHub Actions Workflow Anatomy

| Keyword | Purpose / Explanation |
| --- | --- |
| `name:` | The top-level name of the workflow displayed in the GitHub Actions dashboard tab. |
| `on:` | Defines the event triggers that activate the pipeline (e.g., `push`, `pull_request`, or `workflow_dispatch` for manual triggers). |
| `jobs:` | Groups one or more jobs that run on build runners. Jobs run in parallel by default. |
| `runs-on:` | Defines the operating system and environment of the runner machine (e.g., `ubuntu-latest`, `windows-latest`). |
| `steps:` | A sequential list of individual tasks/commands executed inside a specific job. |
| `uses:` | Imports pre-built reusable actions from the GitHub Actions Marketplace (e.g., `actions/checkout@v4`). |
| `run:` | Executes raw inline shell commands directly inside the runner's terminal. |
| `name:` (on step) | A human-readable label for an individual step shown in the workflow execution logs. |

🧪 Task 5: Testing Pipeline Failure & Log Analysis
What Happens When a Pipeline Breaks?
Red Cross Indicator (❌): GitHub immediately flags the commit and pull request with a red status indicator instead of a green checkmark (✅).

Step Termination: The exact step that returns a non-zero exit code (e.g., exit 1 or command-not-found) fails immediately, and subsequent steps in that job are skipped by default.

Log Diagnosis: Clicking into the failed step opens the expanded real-time stdout/stderr logs with red error line highlights, pointing directly to the broken command line.
