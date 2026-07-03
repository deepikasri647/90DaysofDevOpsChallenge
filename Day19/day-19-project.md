# Day 19 Challenge — Scheduled System Maintenance Project

Applying programmatic automation fundamentals to build defensive system maintenance loops handling log streams rotation, archiving pipelines, and strict crontab cron schedule operations.

---

## 1. Production Maintenance Script Blueprints

### Task 1: Log Rotation Script (`log_rotate.sh`)
Integrates the Unix `find` utility targeting high-volume paths. Compresses `.log` strings older than 7 days using `gzip` and purges historical data structures past the 30-day boundary map.

cat << 'EOF' > log_rotate.sh
#!/bin/bash
set -euo pipefail

LOG_DIR=${1:-""}

if [ -z "$LOG_DIR" ]; then
    echo "ERROR: Usage: $0 <log_directory>"
    exit 1
fi

if [ ! -d "$LOG_DIR" ]; then
    echo "ERROR: Target directory '$LOG_DIR' does not exist."
    exit 1
fi

echo "=== INITIALIZING LOG ROTATION FOR: $LOG_DIR ==="

# Count files before operation
COMPRESS_COUNT=$(find "$LOG_DIR" -name "*.log" -type f -mtime +7 | wc -l)
DELETE_COUNT=$(find "$LOG_DIR" -name "*.gz" -type f -mtime +30 | wc -l)

# Execute compression and deletion
find "$LOG_DIR" -name "*.log" -type f -mtime +7 -exec gzip -f {} \;
find "$LOG_DIR" -name "*.gz" -type f -mtime +30 -exec rm -f {} \;

echo "Compression Sweep: $COMPRESS_COUNT files transformed to .gz"
echo "Retention Sweep: $DELETE_COUNT expired archive logs deleted."
echo "Log rotation sequence completed successfully."
EOF
chmod +x log_rotate.sh

### Task 2: Server Backup Script (`backup.sh`)
Packs application files using `tar -czf` configurations, outputs a validated timestamp format package, and enforces a strict 14-day storage retention window.


cat << 'EOF' > backup.sh
#!/bin/bash
set -euo pipefail

SRC_DIR=${1:-""}
DEST_DIR=${2:-""}

if [ -z "$SRC_DIR" ] || [ -z "$DEST_DIR" ]; then
    echo "ERROR: Usage: $0 <source_directory> <backup_destination>"
    exit 1
fi

if [ ! -d "$SRC_DIR" ]; then
    echo "ERROR: Source directory '$SRC_DIR' does not exist."
    exit 1
fi

mkdir -p "$DEST_DIR"

TIMESTAMP=$(date +%Y-%m-%d_%H%M%S)
ARCHIVE_NAME="backup-$TIMESTAMP.tar.gz"
TARGET_ARCHIVE="$DEST_DIR/$ARCHIVE_NAME"

echo "=== INITIATING SERVER ARCHIVE BACKUP ==="
tar -czf "$TARGET_ARCHIVE" -C "$SRC_DIR" .

if [ -f "$TARGET_ARCHIVE" ]; then
    ARCHIVE_SIZE=$(du -sh "$TARGET_ARCHIVE" | cut -f1)
    echo "Backup Successful: $ARCHIVE_NAME created."
    echo "Archive Footprint Size: $ARCHIVE_SIZE"
else
    echo "CRITICAL: Archive generation failed!"
    exit 1
fi

# Retention policy enforcement: Clean files older than 14 days
echo "Enforcing retention logic..."
find "$DEST_DIR" -name "backup-*.tar.gz" -type f -mtime +14 -exec rm -f {} \;
echo "Backup sequence complete."
EOF
chmod +x backup.sh

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


cat << 'EOF' > maintenance.sh
#!/bin/bash
set -euo pipefail

# Configurations
MAINTENANCE_LOG="/tmp/maintenance.log"
TARGET_LOGS="/tmp/myapp-logs"
TARGET_SRC="/tmp/myapp-data"
TARGET_BACKUPS="/tmp/myapp-backups"

# Ensure test dummy target tracks exist for safe simulation run
mkdir -p "$TARGET_LOGS" "$TARGET_SRC" "$TARGET_BACKUPS"

log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$MAINTENANCE_LOG"
}

log_message "STARTING DAILY SCHEDULED SYSTEM MAINTENANCE..."

# Execute Log Rotation
log_message "Running log rotation task..."
/bin/bash ./log_rotate.sh "$TARGET_LOGS" >> "$MAINTENANCE_LOG" 2>&1 || log_message "WARNING: Log rotation met issues."

# Execute Backups
log_message "Running infrastructure backup task..."
/bin/bash ./backup.sh "$TARGET_SRC" "$TARGET_BACKUPS" >> "$MAINTENANCE_LOG" 2>&1 || log_message "WARNING: Archive generation met issues."

log_message "SYSTEM MAINTENANCE SEQUENCES FINISHED COMPLETED."
EOF
chmod +x maintenance.sh

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
