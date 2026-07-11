# Day 24 Notes: Advanced Git Workflows (Merge, Rebase, Stash, Cherry-Pick)

### 1. Merge Mechanics (Fast-Forward vs. Merge Commit)
* **Fast-Forward Merge:** Occurs when the target branch has no new commits since the feature branch diverged. Git simply moves the pointer forward to the latest commit of the feature branch without creating a new historical node.
* **Merge Commit:** Created when both the target branch and the feature branch have diverged with independent commits. Git joins their histories together by creating a unique 3-way merge node.
* **Merge Conflict:** Happens when identical lines in the same file are modified differently across two branches. Git pauses execution and forces the engineer to clean up the conflict delimiters manually.

### 2. Git Rebase (Linear Optimization)
* **What it does:** Rebase unplugs your feature branch commits, shifts the base pointer to the absolute tip of the targeted branch, and replays your commits one by one on top of it.
* **History Difference:** Merge preserves complete historical timelines and branch shapes (parallel tracks). Rebase flattens out the history into a single linear stream.
* **The Golden Rule:** Never rebase commits that have been pushed and shared with others on remote repositories. It rewrites hashes, causing synchronization failure for teammates.

### 3. Squash Commit vs. Regular Merge
* **Squash Merging:** Condenses all historical feature branch development commits (e.g., 5 small typo/formatting commits) into a single, clean commit package before joining the main branch history.
* **Trade-off:** It keeps the main branch logs completely clean, but you lose granular historical visibility into how the code iteratively evolved in isolation.

### 4. Git Stash (Context-Switching)
* **Pop vs. Apply:** `git stash pop` restores the last saved work-in-progress snapshot and permanently purges it from the stash stack. `git stash apply` restores the changes but leaves the snapshot safely on the stack.
* **Real-World Use:** Used when a critical production bug breaks while you are mid-way through a feature feature build. Stashing stores the incomplete work safely, letting you switch branches with a clean slate.

### 5. Cherry Picking (Surgical Injection)
* **What it does:** Copies a specific, isolated commit from any existing branch using its unique SHA-1 hash and applies it cleanly as a new commit onto your current active branch.
* **Real-World Case:** Bringing a single, high-priority hotfix from an experimental playground branch directly into production without pulling in unfinished features.
* **Risks:** Can cause duplicate commits or unexpected structural merge blockages later if the branches eventually merge together naturally.
