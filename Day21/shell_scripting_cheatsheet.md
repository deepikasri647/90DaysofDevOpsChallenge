# 🚀 Ultimate Shell Scripting Cheat Sheet: DevOps Edition

A condensed, production-ready syntax reference map for automated shell engineering, text processing manipulation, and failsafe execution containment.

---

## Quick Reference Matrix

| Topic | Key Syntax | Practical Production Example |
| :--- | :--- | :--- |
| **Variable** | `VAR="val"` (No spaces) | `ROLE="DevOps Engineer"` |
| **Quoting** | `"$VAR"` (Expands), `'$VAR'` (Literal) | `echo "Role is $ROLE"` |
| **Arguments** | `$1` (First parameter), `$#` (Count), `$@` (All) | `echo "Deploying target: $1"` |
| **Exit Code** | `$?` (Check status of last run) | `if [ $? -eq 0 ]; then` |
| **File Check** | `if [ -f path ]; then` | `if [ -f "app.config" ]; then` |
| **Directory** | `if [ -d path ]; then` | `if [ -d "/var/log/nginx" ]; then` |
| **For Loop** | `for item in list; do ... done` | `for srv in nginx sshd; do` |
| **Function** | `name() { ... }` | `log_err() { echo "[ERROR] $1"; }` |
| **Grep** | `grep options "pattern" file` | `grep -i -n "critical" app.log` |
| **Awk** | `awk '{print $col}' file` | `awk -F: '{print $1}' /etc/passwd` |
| **Sed** | `sed 's/old/new/g' file` | `sed -i 's/debug=false/debug=true/g' conf.txt` |

---

## 1. Shell Scripting Basics

### Shebang & Shell Execution
* `#!/bin/bash` $\rightarrow$ Absolute script header directive forcing the Linux kernel to use the Bash interpreter.
* `chmod +x script.sh && ./script.sh` $\rightarrow$ Flags binary execution permissions and triggers script locally.

### Variables & Inputs
```bash
NAME="Deepikasri Baskar" # Declaration
echo "Hello $NAME"       # Evaluation inside double quotes
echo 'Hello $NAME'       # Prints raw literal '$NAME' (no expansion)
read -p "Enter Target: " TARGET # Reads interactive string values into $TARGET
Positional Metadata Arguments$0 $\rightarrow$ Script path name.$1, $2 $\rightarrow$ First and second command-line arguments.$# $\rightarrow$ Total count of parameters passed.$@ $\rightarrow$ Expands to all passed arguments as individual strings.2. Operators & ConditionalsNumerical & String Evaluation MatrixString Checks: = (equals), != (not equal), -z (string is empty), -n (string is not empty).Integer Checks: -eq ($=$), -ne ($\neq$), -lt ($<$), -gt ($>$), -le ($\leq$), -ge ($\geq$).Failsafe File Testing: -e (exists), -f (is regular file), -d (is directory), -x (is executable).Logical Structure Control LoopsBash# Standard Conditional Block
if [ "$EUID" -ne 0 ]; then
    echo "Error: Run as root."
    exit 1
fi

# Logic Chaining Operators
mkdir /tmp/logs && cd /tmp/logs || exit 1 # Run second command ONLY if first succeeds

# Case Execution Evaluation Switch
case "$1" in
    start) systemctl start nginx ;;
    stop)  systemctl stop nginx ;;
    *)     echo "Usage: $0 {start|stop}" ;;
esac
3. Advanced LoopsBash# List-Based Loop Iteration
for host in web01 db01 app01; do
    ping -c 1 "$host"
done

# File Extension Globbing Loop
for logfile in /var/log/myapp/*.log; do
    gzip "$logfile"
done

# Streaming Command Pipeline Output Read Loop
df -h | grep -v "Tmpfs" | while read -r line; do
    echo "Disk Metrics Row: $line"
done
4. Reusable Modular FunctionsBash# Defining a secure function framework
deploy_service() {
    local service_name=$1 # Local scope variable protection
    echo "Initializing deployment workflow for: $service_name"
    systemctl restart "$service_name" && return 0 || return 1
}

# Invoking the function with parameter mapping arguments
deploy_service "nginx"
5. Enterprise Text Processing One-LinersBash# Grep: Search errors case-insensitive (-i), match count (-c), with line numbers (-n)
grep -in "critical" /var/log/syslog

# Awk: Print 1st and 3rd columns using comma delimiter configuration
awk -F, '{print $1 " occupies " $3}' metrics.csv

# Sed: Search and inline replace configuration lines without creating backups (-i)
sed -i 's/PORT=8080/PORT=9090/g' production.env

# Sort & Uniq: Group identical items, count duplicates (-c), reverse numerical sort (-rn)
cat access.log | awk '{print $1}' | sort | uniq -c | sort -rn | head -5
6. Real-World Production One-LinersBash# 1. Purge static log targets older than 14 days safely
find /var/log/myapp -name "*.log" -type f -mtime +14 -exec rm -f {} \;

# 2. Trace runtime connections by state counts
netstat -an | awk '{print $6}' | sort | uniq -c

# 3. Live monitor errors inside syslogs instantly
tail -f /var/log/syslog | grep --line-buffered -E "ERROR|CRITICAL"

# 4. Rapid bulk string replacement across app files
find ./config -type f -exec sed -i 's/UAT/PROD/g' {} +

# 5. Fast memory resource usage logic alert check
free -m | awk 'NR==2{printf "Memory Utilization Alert Threshold: %.2f%%\n", $3*100/$2}'
7. Failsafe Error Handling & DebuggingPlace this diagnostic flag combination at the top of every automation script:Bashset -euo pipefail
set -e $\rightarrow$ Exits script execution instantly if any single command exits with a non-zero status code.set -u $\rightarrow$ Crashes execution instantly if an unbound or undefined variable is referenced.set -o pipefail $\rightarrow$ Captures errors hiding inside piped pipelines instead of passing them over blindly.set -x $\rightarrow$ Trace mode. Prints out every command inline before executing it (essential for local testing).Bash# Cleanup hooks via Traps
cleanup() {
    echo "Cleaning up temporary files..."
    rm -rf /tmp/devops-lock.*
}
trap cleanup EXIT # Automatically runs cleanup function whenever script finishes or crashes
