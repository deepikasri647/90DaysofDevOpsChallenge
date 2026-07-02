# Day 18 Challenge — Shell Scripting: Functions & Intermediate Concepts

## 1. Production Script Blueprint Registries

### Task 1: Basic Functions (`functions.sh`)
Demonstrates modular development parameters using standard parameters mapping ($1, $2) to functions.

### Task 2: Infrastructure Status (`disk_check.sh`)
Splits operational telemetry queries (`df -h`, `free -h`) into clean, independent executable functions.

### Task 3: Bash Strict Mode Analysis

#### What does each flag do?
* **`set -e`** -> **Exit Immediately on Error:** Forces the script shell to drop execution instantly if any single command exits with a non-zero exit status code ($? \neq 0$). This prevents scripts from continuing to execute code with corrupt data states.
* **`set -u`** -> **No Unbound Variables:** Treats any unset or undefined variable names as a terminal execution error, crashing the thread instantly instead of silently treating it as an empty string.
* **`set -o pipefail`** -> **Pipeline Trace Enforcements:** Ensures that a pipeline output chain returns the exit status code of the *last command to fail*, rather than masking errors when the final downstream utility succeeds.

### Task 4: Variable Scoping (`local_demo.sh`)
Highlights variable isolation rules. Using the `local` keyword inside function scopes prevents variables from leaking out and corrupting global script data.

### Task 5: System Info Reporter (`system_info.sh`)
A production-ready monitoring automation utility compiled using modular functions under strict error tracking settings (`set -euo pipefail`).

---

## 2. Key Learnings & Takeaways
1. **The Failsafe Trilogy (`-euo pipefail`):** Realized that incorporating Bash strict mode transforms loose script frameworks into predictable, hardened software logic pipelines.
2. **Encapsulation with Local Scoping:** Mastered the structural value of `local` variable declarations to keep function logic secure and avoid data pollution bugs.
3. **Automated Telemetry Dashboards:** Engineered a system info utility that aggregates core host metrics (`ps`, `df`, `free`), providing instant incident-response data tables during active server triage.
