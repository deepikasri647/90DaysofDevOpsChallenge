# Day 41 Notes: Triggers & Matrix Builds in GitHub Actions

---

## 🚀 Task 1: Pull Request Trigger (`pr-check.yml`)

```yaml
name: PR Check Workflow

on:
  pull_request:
    types: [opened, synchronize, reopened]
    branches: [ main ]

jobs:
  pr-validation:
    name: Validate Pull Request
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Code
        uses: actions/checkout@v4

      - name: Print Branch Information
        run: echo "PR check running for branch: ${{ github.head_ref }}"
```

⏰ Task 2: Scheduled Triggers & Cron Expressions

Cron syntax uses 5 positional fields: MINUTE HOUR DAY-OF-MONTH MONTH DAY-OF-WEEK (UTC).

Daily at Midnight UTC: 0 0 * * *

Every Monday at 9:00 AM UTC: 0 9 * * 1

🎛️ Task 3: Manual Workflow Dispatch (manual.yml)
```
name: Manual Dispatch Workflow

on:
  workflow_dispatch:
    inputs:
      environment:
        description: 'Target Deployment Environment'
        required: true
        default: 'staging'
        type: choice
        options:
          - staging
          - production

jobs:
  manual-deploy:
    name: Execute Manual Task
    runs-on: ubuntu-latest
    steps:
      - name: Print Selected Input
        run: echo "Executing workflow for target environment: ${{ inputs.environment }}"

```

🧬 Task 4 & 5: Parallel Matrix Builds with Exclusion & Fail-Fast Strategy (matrix.yml)

```

name: Matrix Build Testing

on:
  push:
    branches: [ main ]
  schedule:
    - cron: '0 0 * * *'
  workflow_dispatch:

jobs:
  build-and-test:
    name: Test Python ${{ matrix.python-version }} on${{ matrix.os }}
    runs-on: ${{ matrix.os }}
    
    strategy:
      fail-fast: false
      matrix:
        os: [ubuntu-latest, windows-latest]
        python-version: ['3.10', '3.11', '3.12']
        exclude:
          - os: windows-latest
            python-version: '3.10'

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v4

      - name: Set up Python
        uses: actions/setup-python@v5
        with:
          python-version: ${{ matrix.python-version }}

      - name: Verify Python Installation
        run: python --version
```

