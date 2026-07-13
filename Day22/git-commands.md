# 🛠️ Git Commands Reference Guide

### Setup & Config
* `git config --global user.name "Name"` $\rightarrow$ Sets the global display name for commits.
* `git config --global user.email "email"` $\rightarrow$ Sets the global email address for commits.
* `git init` $\rightarrow$ Initializes a brand new local Git repository.

### Basic Workflow
* `git status` $\rightarrow$ Shows the state of the working directory and staging area.
* `git add <file>` $\rightarrow$ Stages a file, preparing it for the next commit.
* `git commit -m "message"` $\rightarrow$ Saves the staged snapshot permanently into commit history.

### Viewing Changes
* `git log` $\rightarrow$ Displays the full commit history list.
* `git log --oneline` $\rightarrow$ Prints the commit history in a compact, one-line format.

* cat << 'EOF' > git-commands.md
# 🛠️ Git Commands Reference Guide (Days 22–25)

### Setup & Config
* `git config --global user.name "Name"` → Sets the global display name for commits.
* `git config --global user.email "email"` → Sets the global email address for commits.
* `git init` → Initializes a brand new local Git repository.

### Basic Workflow
* `git status` → Shows the state of the working directory and staging area.
* `git add <file>` → Stages a file, preparing it for the next commit.
* `git commit -m "message"` → Saves the staged snapshot permanently into commit history.
* `git log --oneline` → Prints the commit history in a compact, one-line format.
* `git diff` → Shows changes between working directory and staging area.

### Branching
* `git branch` → Lists all local branches.
* `git switch <name>` → The modern command to switch branches.
* `git switch -c <name>` → Creates and switches to a new branch in one step.

### Remote & Sync
* `git push -u origin <branch>` → Pushes branch to GitHub and links it for future pulls.
* `git pull` → Downloads remote data and merges it into local code.
* `git fetch` → Downloads remote data without merging.
* `git clone <url>` → Creates a local copy of a remote repository.
* `git fork` → A GitHub actions workflow to copy a repo onto your own cloud profile.

### Merging & Rebasing
* `git merge <branch>` → Merges target branch into current branch.
* `git merge --squash <branch>` → Condenses feature branch commits into a single commit before applying.
* `git rebase <target-branch>` → Replays current branch commits linearly on top of target branch tip.
* `git log --oneline --graph --all` → Visualizes the branch history graph.

### Stash Operations
* `git stash push -m "msg"` → Saves uncommitted modifications onto the virtual stash stack safely.
* `git stash list` → Displays all active stashed snapshots.
* `git stash pop` → Restores the top stashed snapshot and deletes it from the stack.

### Reset & Revert (Undo Operations)
* `git reset --soft HEAD~1` → Undoes the last commit, but keeps changes staged.
* `git reset --mixed HEAD~1` → Undoes the last commit and unstages changes into workspace.
* `git reset --hard HEAD~1` → Destroys the last commit and deletes all code changes permanently.
* `git revert <commit-hash>` → Safely creates a new commit that undoes the changes of the specified commit.
* `git reflog` → Shows a full history of all actions taken in the repo (Emergency safety net).
EOF
