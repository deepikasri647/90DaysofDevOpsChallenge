# Day 05 — Linux Troubleshooting Runbook

**Target Service under inspection:** Docker Daemon (`docker.service`)

---

## 1. Environment & System Sanity Check

### Command 1: OS Release & Kernel Verification
* **Command:** `cat /etc/os-release && uname -a`
* **Observation:** System is verified running Ubuntu 22.04 LTS on Linux Kernel 5.15. No unexpected OS-level patching anomalies found.

### Command 2: Filesystem Write Sanity Test
* **Command:** `mkdir -p /tmp/runbook-demo && cp /etc/hosts /tmp/runbook-demo/hosts-copy && ls -l /tmp/runbook-demo`
* **Observation:** Directory creation and file write operations executed seamlessly with correct permissions. Root file table is completely writable, ruling out a read-only filesystem crash.

---

## 2. Resource Snapshot: CPU & Memory

### Command 3: Memory Resource Allocation
* **Command:** `free -h`
* **Observation:** Total system memory has 1.8Gi available out of 4Gi. Swap space usage is at 0%, meaning the system is not hitting critical out-of-memory (OOM) thrashing limits.

### Command 4: Target Process Resource Utilization
* **Command:** `ps -o pid,pcpu,pmem,comm -p $(pgrep -o dockerd)`
* **Observation:** The `dockerd` engine is idling stable at 0.4% CPU consumption and 1.2% Memory usage. No active resource-leak spikes discovered.

---

## 3. Resource Snapshot: Disk & Network IO

### Command 5: Storage Allocation & Log Directory Size
* **Command:** `df -h / && du -sh /var/log`
* **Observation:** Main root partition has 45% available space. `/var/log` directory is consuming 340MB. Storage capacity metrics are well within safe thresholds.

### Command 6: Network Interface & Socket Binding
* **Command:** `ss -tulpn | grep dockerd`
* **Observation:** The daemon process is successfully bound and listening on the designated local container runtime socket interface.

---

## 4. Log Inspection

### Command 7: Core System Events Log Trace
* **Command:** `tail -n 50 /var/log/syslog`
* **Observation:** No kernel errors, out-of-memory terminations, or disk I/O scheduling failures reported in the last 50 historical entries.

### Command 8: Target Service Journal Streams
* **Command:** `journalctl -u docker -n 50`
* **Observation:** The daemon streams confirm completely successful internal health checks. No container run failures or execution exceptions present.

---

## 5. Summary & Quick Findings
* **Current Operational State:** Healthy and stable.
* **Analysis:** All hardware matrices (Memory, Storage, Processing Capacity) show standard baseline parameters. There are no service communication interruptions.

## 6. If This Worsens (Incident Escalation Blueprint)
If the service deteriorates or crashes progressively under heavy production workloads, execute the following actions sequentially:
1. **Graceful Service Restart Tactic:** Trigger systemd unit recycle using `sudo systemctl restart docker` to clear immediate hanging connections.
2. **Increase Log Verbosity Levels:** Edit `/etc/docker/daemon.json` to insert `"debug": true` parameters and reload configuration to extract verbose diagnostic telemetry.
3. **Low-Level System Call Profiling:** Bind an active tracing session to the main daemon thread using `sudo strace -p $(pgrep -o dockerd) -c` to profile and identify failing kernel operations or blocked file descriptors during active crashes.
