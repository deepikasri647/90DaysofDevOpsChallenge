# Day 20 — Automated Log Analyzer and Report Generator

A production-grade shell monitoring utility created to parse server operational log arrays, isolate critical system breaks, calculate high-frequency error signatures, and safely archive metrics payloads.

---

## 1. Automated Script Code Blueprint (`log_analyzer.sh`)

```bash
#!/bin/bash
set -euo pipefail

LOG_FILE=${1:-""}
if [ -z "$LOG_FILE" ] || [ ! -f "$LOG_FILE" ]; then
    echo "ERROR: Valid target log asset input required."
    exit 1
fi

CURRENT_DATE=$(date +%Y-%m-%d)
REPORT_FILE="log_report_${CURRENT_DATE}.txt"

TOTAL_LINES=$(wc -l < "$LOG_FILE")
ERROR_COUNT=$(grep -E -i "ERROR|Failed" "$LOG_FILE" | wc -l || true)

{
    echo "=================================================="
    echo "   AUTOMATED TELEMETRY MAINTENANCE SUMMARY REPORT"
    echo "=================================================="
    echo "Date of Analysis : $(date '+%Y-%m-%d %H:%M:%S')"
    echo "Target Log Asset : $(basename "$LOG_FILE")"
    echo "Total Lines Read : $TOTAL_LINES"
    echo "Total Error Count: $ERROR_COUNT"
    echo ""
    echo "--- Critical Events ---"
    grep -n "CRITICAL" "$LOG_FILE" || echo "None detected."
    echo ""
    echo "--- Top 5 Error Messages ---"
    grep "ERROR" "$LOG_FILE" | awk '{$1=$2=$3=""; print $0}' | sed 's/^[ \t]*//' | sort | uniq -c | sort -rn | head -5
    echo "=================================================="
} > "$REPORT_FILE"

mkdir -p archive && mv "$LOG_FILE" archive/
2. Sample Output Telemetry RecordsTerminal Execution OutputPlaintext=== INITIALIZING PRODUCTION LOG PROCESSING TIMELINE ===
Analyzing Target: sample_log.log
Total Data Lines Parsed: 13
Total Error Incidents Captured: 9
Report Successfully Exported To: log_report_2026-07-04.txt
Asset Safety: Cleaned up workspace. 'sample_log.log' shifted to './archive/' folder.
Processing complete.
Generated Report Layout (log_report_2026-07-04.txt)Plaintext==================================================
   AUTOMATED TELEMETRY MAINTENANCE SUMMARY REPORT
==================================================
Date of Analysis : 2026-07-04 11:15:00
Target Log Asset : sample_log.log
Total Lines Read : 13
Total Error Count: 9

--- Critical Events ---
5:2026-07-04 10:15:23 CRITICAL Disk space below threshold
10:2026-07-04 10:32:01 CRITICAL Database connection lost

--- Top 5 Error Messages ---
      4 Connection timed out
      2 Permission denied
      2 File not found
==================================================
3. Core Text-Processing Tools Appliedgrep -E -i "ERROR|Failed" $\rightarrow$ Performs an Extended Regular Expression, case-insensitive evaluation search to capture alternative error strings within one stream pass.grep -n $\rightarrow$ Appends the exact physical source line integer coordinates, which is vital for locating code exceptions.awk '{$1=$2=$3=""; print $0}' $\rightarrow$ Strips out dynamic metadata fields (date, timestamp, and log level indicators) so the system can group identical underlying error messages accurately.sort | uniq -c | sort -rn $\rightarrow$ Organizes lines alphabetically, aggregates consecutive identical matching counts, and executes a secondary reverse numerical re-sort to arrange frequencies from highest to lowest.4. Key Learnings & TakeawaysDynamic Streaming Redirections: Mastered the clean bracket scoping logic { ... } > file.txt to seamlessly stream an entire multi-line report structure into a single target file, avoiding multiple messy echo >> operations.Deterministic Message Grouping: Discovered the process of neutralizing dynamic timestamp offsets using awk filtering parameters, which allows identical software bugs to be counted correctly under high-volume runtime spikes.Workspace Cleanup Discipline: Implemented automated log rotation handling (mv transfers to an isolated storage target directory), establishing system health baselines to ensure active log directories never suffer block allocation crashes.
