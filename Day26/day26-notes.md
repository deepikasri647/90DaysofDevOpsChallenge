# Day 26 Notes: GitHub CLI (gh) Deep Dive

### 1. Authentication Methods
* GitHub CLI supports authentication via **Web Browser OAuth** (where it opens a secure browser link to verify your active session) and via a **Personal Access Token (PAT)** or SSH keys generated from your account.

### 2. Issues Automation in Scripting
* `gh issue` commands can be heavily leveraged in DevOps Bash scripts or CI/CD cron jobs. 
* *Example scenario:* If a nightly security scanner or sonar code-quality gate fails, a Bash script can automatically invoke `gh issue create --title "Security Alert" --body "$(cat scan_report.txt)" --label "critical"` to immediately alert the development team without manual intervention.

### 3. Pull Request Operations
* **Merge Methods Supported:** `gh pr merge` supports standard `--merge` (creates a merge commit), `--rebase` (replays commits on target branch), and `--squash` (condenses commits into one).
* **Reviewing PRs via Terminal:** You can checkout someone else's PR directly using `gh pr checkout <pr-number>`. You can view the code diff with `gh pr diff` and submit your review approval or comments using `gh pr review --approve -m "Code looks good!"`.

### 4. CI/CD & Pipeline Integration (Actions Preview)
* In a production CI/CD pipeline, `gh run list` and `gh run watch` can be utilized inside deployment scripts to monitor dependencies. For instance, a deployment script can trigger an upstream pipeline and wait/poll for its success status (`gh run watch`) before initiating a downstream production release.
