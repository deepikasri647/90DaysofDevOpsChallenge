# Day 19 Challenge — Scheduled System Maintenance Project

Applying programmatic automation fundamentals to build defensive system maintenance loops handling log streams rotation, archiving pipelines, and strict crontab cron schedule operations.

---

## 1. Production Maintenance Script Blueprints

### Task 1: Log Rotation Script (`log_rotate.sh`)
Integrates the Unix `find` utility targeting high-volume paths. Compresses `.log` strings older than 7 days using `gzip` and purges historical data structures past the 30-day boundary map.

### Task 2: Server Backup Script (`backup.sh`)
Packs application files using `tar -czf` configurations, outputs a validated timestamp format package, and enforces a strict 14-day storage retention window.

### Task 3: Cron Schedule Implementations

```text
# 1. Run log_rotate.sh every day at exactly 2 AM
0 2 * * * /bin/bash /home/adminuser/2026/day-19/log_rotate.sh /var/log/myapp >> /var/log/cron-logs.log 2>&1

# 2. Run backup.sh every Sunday at exactly 3 AM
0 3 * * 0 /bin/bash /home/adminuser/2026/day-19/backup.sh /var/www/html /mnt/backups >> /var/log/cron-logs.log 2>&1

# 3. Run a custom health check script loop every 5 minutes
*/5 * * * * /bin/bash /home/adminuser/2026/day-19/health_check.sh >> /var/log/health.log 2>&1

# 4. Consolidated Cron: Execute unified maintenance wrapper daily at 1 AM
0 1 * * * /bin/bash /home/adminuser/2026/day-19/maintenance.sh
Task 4: Scheduled Maintenance Controller (maintenance.sh)
Wraps log rotation and directory backup modules into a clean sequence, logging timestamps and outputs into /tmp/maintenance.log.

2. Sample Output Telemetry Mock
Plaintext
2026-07-03 01:00:00 - STARTING DAILY SCHEDULED SYSTEM MAINTENANCE...
2026-07-03 01:00:01 - Running log rotation task...
=== INITIALIZING LOG ROTATION FOR: /tmp/myapp-logs ===
Compression Sweep: 4 files transformed to .gz
Retention Sweep: 1 expired archive logs deleted.
Log rotation sequence completed successfully.
2026-07-03 01:00:02 - Running infrastructure backup task...
=== INITIATING SERVER ARCHIVE BACKUP ===
Backup Successful: backup-2026-07-03_010002.tar.gz created.
Archive Footprint Size: 4.2M
Enforcing retention logic...
Backup sequence complete.
2026-07-03 01:00:03 - SYSTEM MAINTENANCE SEQUENCES FINISHED COMPLETED.
3. Key Learnings & Takeaways
Automated Cleanup Pipelines: Mastered using find with -mtime parameters to dynamically identify and purge expired log files, keeping disk space predictable.

Cron Decoupling: Understood how Background Cron Daemons execute decoupled scripts silently without interactive TTY screens, requiring explicit path formatting (like /bin/bash).

Consolidated Logging Strategy: Realized that piping script streams (>> log.txt 2>&1) inside a main maintenance script is essential for auditing past system states when debugging production issues.
