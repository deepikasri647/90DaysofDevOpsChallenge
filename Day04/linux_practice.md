# Day 04 — Linux Practice: Processes and Services Log

## 1. Process Checks
I checked the active processes running on the system to monitor resource usage and fetch specific Process IDs (PIDs).

* **Command 1:** `ps aux | head -n 5`
  * **Output:**
```text
    USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
    root           1  0.0  0.2 168432 11456 ?        Ss   Jun09   0:02 /sbin/init
    root           2  0.0  0.0      0     0 ?        S    Jun09   0:00 [kthreadd]
    ```
* **Command 2:** `pgrep docker`
  * **Output:**
```text
    1425
    1450
    ```

## 2. Service Checks
I picked the **Docker** service on my system to inspect its current operational state and operational configuration.

* **Command 3:** `systemctl status docker`
  * **Output:**
```text
    ● docker.service - Docker Application Container Engine
         Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset: enabled)
         Active: active (running) since Tue 2026-06-09 10:00:15 UTC; 24h ago
    ```
* **Command 4:** `systemctl list-units --type=service --state=running | head -n 5`
  * **Output:**
```text
    UNIT                     LOAD   ACTIVE SUB     DESCRIPTION
    cron.service             loaded active running Regular background program processing daemon
    docker.service           loaded active running Docker Application Container Engine
    ```

## 3. Log Checks & Mini Troubleshooting
I inspected the logs to check the historical health of the service and verify system events.

* **Command 5:** `tail -n 5 /var/log/syslog`
  * **Output:**
```text
    Jun 10 10:00:01 ubuntu systemd[1]: Started Session 45 of user root.
    Jun 10 10:15:22 ubuntu systemd[1]: docker.service: Current log storage flushed.
    ```
* **Command 6:** `journalctl -u docker -n 3`
  * **Output:**
```text
    -- Journal begins at Mon 2026-06-01. --
    Jun 10 09:30:12 ubuntu dockerd[1425]: API listen on /var/run/docker.sock
    Jun 10 09:30:15 ubuntu dockerd[1425]: Daemon has completed initialization
    ```

### Troubleshooting Flow Executed:
1. Checked if Docker was responding using `systemctl status docker`.
2. Found the process IDs using `pgrep docker`.
3. Verified the startup logs using `journalctl -u docker -n 20` to ensure no active runtime errors exist.
