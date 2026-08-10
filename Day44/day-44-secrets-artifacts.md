# Day 44 Notes: Secrets, Artifacts & Real Tests in CI

---

## 🔒 Task 1 & 2: Secrets Management & Automatic Masking

### 1. Secret Configuration:
Repository secrets are encrypted environment variables stored securely in **Settings ➔ Secrets and variables ➔ Actions**.

### 2. Automatic Log Masking:
When accessing `${{ secrets.MY_SECRET_MESSAGE }}` in workflow logs, GitHub automatically replaces the literal secret string with asterisks (`***`).

### 3. Why Secrets Should NEVER Be Output to Logs:
* **Log Leakage:** Outputting secrets using `echo` or debugging scripts exposes sensitive API keys, cloud tokens, or passwords to anyone with repository read permissions.
* **Base64/Encoding Bypass:** Even if GitHub masks raw text, encoding a secret (e.g., `echo $SECRET | base64`) bypasses masking and exposes credentials in plain text.

---

## 📦 Task 3 & 4: Uploading & Downloading Artifacts (`actions/upload-artifact` & `actions/download-artifact`)

**Artifacts** are files or directories generated during a workflow run (e.g., compiled binaries, Docker images, test execution reports, or coverage metrics).

### Workflow Code Snippet:
```yaml
      - name: Upload Test Report & Artifacts
        uses: actions/upload-artifact@v4
        with:
          name: test-execution-artifacts
          path: |
            Day44/test-report.xml
            Day44/execution-summary.txt

  process-artifact:
    needs: [ build-and-test ]
    runs-on: ubuntu-latest
    steps:
      - name: Download Test Artifacts
        uses: actions/download-artifact@v4
        with:
          name: test-execution-artifacts
          path: downloaded-artifacts
```

When to Use Artifacts in Real Production Pipelines:
Inter-Job Data Passing: Sharing compiled application binaries or built Docker contexts from a build job to a downstream deploy job.

Audit & Compliance: Preserving JUnit XML test results, security vulnerability scans, or code coverage reports for post-run inspection.

🧪 Task 5: Running Real Python Unit Tests (pytest)
We integrated real unit tests executing against app.py using pytest.

Passing State: When all assertions pass (pytest Day44/test_app.py), pytest exits with exit code 0, marking the step with a green checkmark (✅).

Failing State: If an assertion fails (e.g., assert add(2, 3) == 6), pytest exits with exit code 1, halting the job immediately and flagging a red pipeline failure (❌).

⚡ Task 6: Dependency Caching (actions/cache@v4)
Dependency caching restores previously downloaded pip packages across workflow runs rather than re-downloading them from PyPI every time.

```
- name: Cache Pip Dependencies
        uses: actions/cache@v4
        with:
          path: ~/.cache/pip
          key: ${{ runner.os }}-pip-${{ hashFiles('Day44/requirements.txt') }}
          restore-keys: |
            ${{ runner.os }}-pip-
```
Performance Comparison:
First Run (Cache Miss): Downloads pytest packages from PyPI (~15-20 seconds).

Second Run (Cache Hit): Restores pip packages directly from GitHub's internal cache storage (~2-3 seconds).

Where Caches are Stored: Stored securely on GitHub's internal storage infrastructure (up to 10 GB per repository).
