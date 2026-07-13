# Day 25 Notes: Git Reset vs Revert & Branching Strategies

### 1. Git Reset Modes Explained
* `--soft`: Moves the HEAD pointer back, but keeps your changes staged in the Staging Area. Useful if you want to fix the last commit message or group changes.
* `--mixed` (Default): Moves HEAD back and unstages your changes, leaving them in the Working Directory.
* `--hard`: Destroys everything. It wipes out the commit, unstages the files, and deletes the actual code changes from your workspace. **This is destructive.**
* **Rule:** Never use `git reset` on commits that have already been pushed to a public/shared repository, as it rewrites history and disrupts teammates.

### 2. Git Reset vs Git Revert Summary Table

| Feature | `git reset` | `git revert` |
| :--- | :--- | :--- |
| **What it does** | Moves HEAD backward, removing commits from history. | Creates a brand new commit that undoes changes of an old commit. |
| **History Impact** | Erases commits (Rewrites history). | Preserves history (Appends a new commit). |
| **Shared Branch Safe** | ✗ No, very dangerous. | ✓ Yes, perfectly safe. |
| **When to use** | Local cleanups before pushing code. | Undoing bugs on shared `main`/production branches. |

### 3. Branching Strategies
* **GitFlow:** Uses distinct branches (`main`, `develop`, `feature/*`, `release/*`, `hotfix/*`). Best for large enterprise teams with scheduled release cycles.
* **GitHub Flow:** Simple and agile. Features live on short branches off `main` and are merged via Pull Requests instantly. Best for startups shipping fast.
* **Trunk-Based Development:** Developers merge small, frequent updates directly into the `main` branch (the trunk) daily. Minimizes merge hell; widely used in CI/CD intensive DevOps teams.

### 4. Strategy Decisions
* **Startup Shipping Fast:** GitHub Flow.
* **Large Team with Scheduled Releases:** GitFlow or Trunk-Based with Feature Flags.
