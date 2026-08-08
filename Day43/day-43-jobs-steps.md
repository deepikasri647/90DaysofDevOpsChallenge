# Day 43 Notes: Jobs, Steps, Environment Variables & Conditionals

---

## 🔗 Task 1: Multi-Job Dependencies (`multi-job.yml`)

By default, GitHub Actions runs all jobs in parallel. The `needs:` key creates explicit sequential dependencies, producing a visual pipeline DAG (Directed Acyclic Graph) in the Actions dashboard.

```yaml
name: Day 43 - Multi-Job Dependencies

on:
  push:
    branches: [ main ]
  workflow_dispatch:

jobs:
  build:
    name: Build Application
    runs-on: ubuntu-latest
    steps:
      - name: Build Step
        run: echo "Building the app..."

  test:
    name: Run Unit Tests
    needs: [ build ]
    runs-on: ubuntu-latest
    steps:
      - name: Test Step
        run: echo "Running tests..."

  deploy:
    name: Deploy to Production
    needs: [ test ]
    runs-on: ubuntu-latest
    steps:
      - name: Deploy Step
        run: echo "Deploying the app..."

```

🌐 Task 2 & 3: Variable Scopes & Passing Outputs Between Jobs
1. Environment Variable Scopes:
Workflow Level (env: at root): Accessible across all jobs and steps ($APP_NAME).

Job Level (env: inside job): Scoped only to that specific job ($ENVIRONMENT).

Step Level (env: inside step): Scoped strictly to that execution step ($VERSION).

2. GitHub Contexts:
github.actor: The user who triggered the run.

github.sha: The exact git commit SHA hash.

github.event.head_commit.message: The latest commit message text.

3. Passing Data Between Isolated Jobs ($GITHUB_OUTPUT):
Because each job runs on an isolated runner virtual machine, memory and local environment variables are destroyed when a job finishes. Writing key-value pairs to $GITHUB_OUTPUT exposes them to downstream jobs via needs.<job_name>.outputs.<key>.

🔀 Task 4 & 5: Conditionals & Error Control (smart-pipeline.yml)
```yaml
name: Day 43 - Smart Pipeline

on:
  push:
    branches: ['*']
  workflow_dispatch:

env:
  APP_NAME: myapp

jobs:
  lint:
    name: Lint Codebase
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Code
        uses: actions/checkout@v4

      - name: Linting Step
        run: echo "Codebase linted successfully."

  test:
    name: Execute Tests & Generate Output
    runs-on: ubuntu-latest
    env:
      ENVIRONMENT: staging
    outputs:
      build_date: ${{ steps.date_step.outputs.build_date }}
    steps:
      - name: Set Variable & Output Date
        id: date_step
        env:
          VERSION: 1.0.0
        run: |
          echo "App Name: $APP_NAME"
          echo "Environment: $ENVIRONMENT"
          echo "Version: $VERSION"
          echo "Triggered by Actor: ${{ github.actor }}"
          echo "Commit SHA: ${{ github.sha }}"
          echo "build_date=$(date +'\%Y-\%m-\%d \%H:\%M:\%S')" >> $GITHUB_OUTPUT

      - name: Intentional Soft Failure Step
        run: exit 1
        continue-on-error: true

      - name: Step Conditional on Main Branch
        if: github.ref == 'refs/heads/main'
        run: echo "This step runs ONLY on pushes to the main branch!"

  summary:
    name: Pipeline Summary Report
    needs: [ lint, test ]
    if: github.event_name == 'push'
    runs-on: ubuntu-latest
    steps:
      - name: Display Summary and Passed Output
        run: |
          echo "Build Date from Test Job: ${{ needs.test.outputs.build_date }}"
          echo "Commit Message: ${{ github.event.head_commit.message }}"
          if [ "${{ github.ref }}" = "refs/heads/main" ]; then
            echo "Branch Type: Main Branch Push"
          else
            echo "Branch Type: Feature Branch Push"
          fi
```
Key Technical Concepts:
needs: [job1, job2]: Ensures job dependencies finish before execution.

continue-on-error: true: Allows a failing step (non-zero exit code) to be marked as passed with a warning icon, preventing job termination.

if: github.ref == 'refs/heads/main': Evaluates boolean expressions before step/job execution.
