# Day 23 Notes: Branching & Remote Workflow

### 1. The Branching Concept
* **What is a branch?** A lightweight, movable pointer to a specific commit in your history. It allows you to diverge from the main line of development.
* **Why branch?** Isolation. You can test experimental features or fix bugs without risking the stability of the `main` branch.
* **What is HEAD?** A pointer that tracks your current location in the repository (i.e., which commit/branch you are currently "on").
* **File behavior:** When you switch branches, Git automatically updates your working directory to match the commit that the target branch points to.

### 2. Git vs. GitHub Concepts
* **Origin vs. Upstream:** `origin` is the default name for the remote repo you cloned from. `upstream` usually refers to the original project repo you forked (used when syncing your fork).
* **Fetch vs. Pull:** `git fetch` downloads changes from remote without merging them. `git pull` fetches changes AND merges them into your current local branch immediately.

### 3. Cloning vs. Forking
* **Clone:** Creates a local copy of a remote repository you have permission to access.
* **Fork:** A server-side GitHub action that creates a copy of someone else's repo into your own account.
* **When to use:** Clone for your own work; Fork when you want to contribute to someone else's project (Open Source).
* **Syncing Fork:** Add the original repo as a remote (`git remote add upstream <url>`), then `git fetch upstream` and `git merge upstream/main`.
