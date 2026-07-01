# Day 17 Challenge — Shell Scripting: Loops, Arguments & Error Handling

## 1. Automated Script Repositories

### Task 1: For Loops (`for_loop.sh` & `count.sh`)
```bash
# for_loop.sh
for fruit in Apple Banana Mango Orange Grapes; do
    echo "Fruit: $fruit"
done
Task 2: While Loops (countdown.sh)
Bash
# countdown.sh
while [ $NUM -ge 0 ]; do
    echo "$NUM"
    NUM=$((NUM - 1))
done
echo "Done!"
Task 3: Command-Line Arguments (greet.sh & args_demo.sh)
greet.sh utilizes standard validation logic [ -z "$1" ] to catch empty string allocations and guide operators on proper script parameters usage format.

args_demo.sh captures metadata: $0 maps script path name, $# counts total execution parameters, and $@ expands all inputs cleanly.

Task 4: Package Management (install_packages.sh)
Bash
#!/bin/bash
if [ "$EUID" -ne 0 ]; then
    echo "CRITICAL: Please execute this script using sudo access privileges!"
    exit 1
fi

PACKAGES=("nginx" "curl" "wget")
for pkg in "${PACKAGES[@]}"; do
    if dpkg -s "$pkg" &> /dev/null; then
        echo "[SKIP] $pkg is already installed."
    else
        apt install "$pkg" -y
    fi
done
Task 5: Error Handling (safe_script.sh)
Incorporates the set -e shell option. This prevents silent script execution failures. If an intermediate setup command fails (e.g., target disk space full, missing file creation paths), the Bash shell immediately drops execution, ensuring system state safety instead of cascading additional script errors.

2. Key Learnings & Takeaways
Defensive Programming via $EUID: Understood how to prevent failed script runs by checking root privilege constraints ($EUID -ne 0) before initiating package changes.

Positional Arguments Management: Swapped interactive read steps with automated positional inputs ($1, $@), a core technique when developing pipeline scripts.

Failsafe Loops Integration: Applied loop iterations over arrays to easily scale infrastructure setups, combined with set -e to handle error traps gracefully.
