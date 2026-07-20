# Day 28 Notes: Revision & Self-Assessment (Days 1–27)

---

## 📋 Task 1: Self-Assessment Checklist

### Linux Foundations
*  Navigate the file system, create/move/delete files and directories — **Can do confidently**
*  Manage processes (list, kill, background/foreground) — **Can do confidently**
*  Work with systemd (start, stop, enable, check status of services) — **Can do confidently**
*  Read and edit text files using vi/vim or nano — **Can do confidently**
*  Troubleshoot CPU, memory, and disk issues using `top`, `free`, `df`, `du` — **Can do confidently**
*  Explain the Linux file system hierarchy (`/`, `/etc`, `/var`, `/home`, `/tmp`) — **Can do confidently**
*  Create users/groups, manage passwords — **Can do confidently**
*  Set file permissions using `chmod` (numeric & symbolic) — **Can do confidently**
*  Change file ownership with `chown` and `chgrp` — **Can do confidently**
*  Create and manage LVM volumes — **Need to revisit**
*  Check network connectivity (`ping`, `curl`, `netstat`, `ss`, `dig`, `nslookup`) — **Can do confidently**
*  Explain DNS resolution, IP addressing, subnets, and common ports — **Can do confidently**

### Shell Scripting
*  Write a script with variables, arguments, and user input — **Can do confidently**
*  Use `if/elif/else` and `case` statements — **Can do confidently**
*  Write `for`, `while`, and `until` loops — **Can do confidently**
*  Define and call functions with arguments and return values — **Can do confidently**
*  Use `grep`, `awk`, `sed`, `sort`, `uniq` for text processing — **Need to revisit (`awk` & `sed`)**
*  Handle errors with `set -e`, `set -u`, `set -o pipefail`, `trap` — **Can do confidently**
*  Schedule scripts with `crontab` — **Can do confidently**

### Git & GitHub CLI
*  Initialize a repo, stage, commit, and view history — **Can do confidently**
*  Create and switch branches (`git switch`) — **Can do confidently**
*  Push to and pull from GitHub — **Can do confidently**
*  Explain `clone` vs `fork` — **Can do confidently**
*  Merge branches (Fast-forward vs Merge Commit) — **Can do confidently**
*  Rebase a branch and explain when to use it vs merge — **Can do confidently**
*  Use `git stash` and `git stash pop` — **Can do confidently**
*  Cherry-pick a commit from another branch — **Can do confidently**
*  Explain squash merge vs regular merge — **Can do confidently**
*  Use `git reset` (soft, mixed, hard) and `git revert` — **Can do confidently**
*  Explain GitFlow, GitHub Flow, and Trunk-Based Development — **Can do confidently**
*  Use GitHub CLI (`gh`) to create repos, PRs, and issues — **Can do confidently**

---

## 🎯 Task 2: Revisit Weak Spots & Refresher Notes
1. **LVM (Logical Volume Manager):** Revisited Physical Volumes (`pvcreate`), Volume Groups (`vgcreate`), and Logical Volumes (`lvcreate`). LVM provides elastic disk sizing without reformatting hard drives.
2. **Text Processing (`sed` & `awk`):** Re-practiced column extractions using `awk '{print $1, $3}'` and inline stream edits via `sed -i 's/old/new/g'`.
3. **Emergency Git Recovery (`git reflog`):** Practiced recovering accidentally lost commits after `git reset --hard` using the `reflog` tracking graph pointers.

---

## ⚡ Task 3: Quick-Fire Answers (Memory Verification)

1. **What does `chmod 755 script.sh` do?**
   * Grants Read, Write, Execute (`7` -> `rwx`) to Owner, and Read & Execute (`5` -> `r-x`) to Group and Others.
2. **Difference between a process and a service?**
   * A **process** is any running program instance in memory.
   * A **service** is a background daemon process managed by an init system like `systemd` to run continuously.
3. **How do you find which process is using port 8080?**
   * `sudo netstat -tulpn | grep 8080` or `sudo ss -tulpn | grep 8080` or `sudo lsof -i :8080`.
4. **What does `set -euo pipefail` do in a shell script?**
   * `-e`: Exit immediately on command failure.
   * `-u`: Treat unset variables as an error.
   * `-o pipefail`: Return exit code of the last failing command in a pipeline.
5. **Difference between `git reset --hard` and `git revert`?**
   * `git reset --hard` erases commits permanently from history (destructive). `git revert` creates a new commit that safely undoes changes without altering history.
6. **Recommended branching strategy for a team of 5 developers shipping weekly?**
   * **GitHub Flow** or lightweight **Trunk-Based Development** with feature branches and PR code reviews.
7. **What does `git stash` do and when would you use it?**
   * Temporarily shelves uncommitted modifications so you can switch branches cleanly without committing half-done work.
8. **How do you schedule a script to run every day at 3 AM?**
   * Crontab entry: `0 3 * * * /path/to/script.sh`
9. **Difference between `git fetch` and `git pull`?**
   * `git fetch` downloads remote changes without modifying local files. `git pull` performs a `fetch` and immediately attempts to `merge` into your active branch.
10. **What is LVM and why use it instead of regular partitions?**
    * LVM abstracts physical hard drives into a virtual storage pool, allowing administrators to resize disk space dynamically on live production servers.

---

## 🎓 Task 5: Teach It Back

### 🗣️ Topic: Explain Git Branching to a Non-Developer
Imagine you are writing a book in a Word document called `Main_Story.docx`. If you want to experiment with an alternative ending, you wouldn't write over your original document because you might ruin it! 

Instead, you create a copy called `Alternate_Ending_Draft`. You can write freely, erase lines, and test crazy ideas without touching the original book. 

In Git, that copy is called a **Branch**. Your main book stays safe on the `main` branch, while you work on your experimental `feature` branch. Once you and your team agree that the alternative ending is fantastic, you merge those pages back into the `Main_Story`!
