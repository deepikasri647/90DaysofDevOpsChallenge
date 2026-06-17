# Day 07 — Linux File System Hierarchy & Scenario-Based Practice

## Part 1: Linux File System Hierarchy

### 1. `/` (Root)
* **Purpose:** The absolute top-level starting point of the entire Linux directory structure. Every file and folder originates here.
* **Observed Files:** `bin`, `boot`, `dev`, `etc`, `home`, `lib`, `var`.
* **DevOps Use Case:** I would use this when navigating to global system paths or configuring absolute deployment locations.

### 2. `/home`
* **Purpose:** Contains personal storage directories for non-root, standard system users.
* **Observed Files:** `/home/ubuntu` or user profile folders.
* **DevOps Use Case:** I would use this when storing user-specific application scripts or configuring keys for user access.

### 3. `/root`
* **Purpose:** The private home directory reserved exclusively for the administrative superuser account (Root).
* **Observed Files:** `.bashrc`, `.ssh` operational folders.
* **DevOps Use Case:** I would use this when checking root-specific admin actions, keys, or global automation tasks.

### 4. `/etc`
* **Purpose:** The system's central command station for core software configuration files and boot scripts.
* **Observed Files:** `hostname`, `hosts`, `nginx/`, `ssh/`.
* **DevOps Use Case:** I would use this when modifying network mappings, application server properties, or security configs.

### 5. `/var/log`
* **Purpose:** The dedicated system storage location where Linux and background daemons write runtime history files.
* **Observed Files:** `syslog`, `auth.log`, `nginx/error.log`.
* **DevOps Use Case:** I would use this as my first destination during an active service incident response flow to detect exceptions.

### 6. `/tmp`
* **Purpose:** Holds temporary file resources created by applications that are deleted when the server reboots.
* **Observed Files:** Dynamic session tokens, installation logs, throwaway runbook logs.
* **DevOps Use Case:** I would use this to stage intermediate installation packages or run scratch scripts safely.

### 7. `/bin` & `/usr/bin`
* **Purpose:** Houses essential, standard executable command binaries (like `ls`, `cat`, `grep`) used across the system.
* **Observed Files:** `bash`, `mkdir`, `systemctl`, `curl`.
* **DevOps Use Case:** I would check this if a standard path variable breaks and execution commands fail to respond globally.

### 8. `/opt`
* **Purpose:** Reserved for manual installation of optional, standalone third-party business software packages.
* **Observed Files:** Add-on installations like monitoring agents or specific binary runtime packages.
* **DevOps Use Case:** I would use this when installing customized software blocks that shouldn't mix with standard core system components.

---

## Hands-on Task Execution Log

1. **Find the 5 largest log files in `/var/log`:**
   ```bash
   du -sh /var/log/* 2>/dev/null | sort -h | tail -5
Inspect server hostname identity:

Bash
cat /etc/hostname
Audit user profile folder structures:

Bash
ls -la ~
Part 2: Scenario-Based Troubleshooting Practice
Scenario 1: Web Application 'myapp' Failed to Start After Server Reboot
Step 1: systemctl status myapp

Why: Instantly isolates if the service unit dropped into a failed, inactive, or corrupted configuration block state.

Step 2: journalctl -u myapp -n 50

Why: Pulls out the final 50 stdout/stderr runtime stack trace messages thrown by the app binary to pin down bugs.

Step 3: systemctl is-enabled myapp

Why: Confirms if the application was explicitly configured to automatically launch upon server boot up sequences.

Step 4: sudo systemctl restart myapp

Why: Re-executes the service lifecycle to check if memory errors or hanging parameters drop out upon manual startup intervention.

Scenario 2: High CPU Usage and App Server Sluggishness
Step 1: htop (or top)

Why: Instantly renders a live, interactive visualization layout showing exactly which processes are eating up CPU resource cores.

Step 2: ps aux --sort=-%cpu | head -10

Why: Captures a precise, clean static list tracking the top 10 most aggressive, resource-heavy background processes running on the machine.

Scenario 3: Finding Target Service Logs for Developer Diagnostics
Step 1: systemctl status docker

Why: Double-checks if the target engine daemon process is healthy and references active process streams.

Step 2: journalctl -u docker -n 50

Why: Grabs the final 50 functional engine events log lines to let the developer track initialization statuses.

Step 3: journalctl -u docker -f

Why: Attaches a live tail stream directly to the target systemd pipeline, letting you view service errors in real-time.

Scenario 4: Handling 'Permission Denied' on Shell Script Execution Block
Step 1: ls -l /home/user/backup.sh

Why: Evaluates the exact user, group, and world execution metadata parameters currently bounding the file context.

Step 2: chmod +x /home/user/backup.sh

Why: Directly attaches the execution bit (x) flag parameters to make the shell target readable as a runnable utility.

Step 3: ls -l /home/user/backup.sh

Why: Verifies that the flag state successfully flipped to an active executable notation (e.g., -rwxr-xr-x).

Step 4: ./backup.sh

Why: Executes the script pipeline cleanly to complete the administrative backup cycle.
