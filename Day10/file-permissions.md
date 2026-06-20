# Day 10 Challenge — Linux File Permissions & Operations

## Files Created
* `devops.txt` — Empty file framework.
* `notes.txt` — Informative document logging data.
* `script.sh` — Bash utility printing localized terminal welcome greetings.
* `project/` — Workspace tracking directory.

## Permission Matrix Changes
| File / Folder | Initial State | Command Applied | Modified State | Operational Result |
| :--- | :--- | :--- | :--- | :--- |
| `script.sh` | `-rw-r--r--` | `chmod +x script.sh` | `-rwxr-xr-x` | Successfully executes binary using `./script.sh` |
| `devops.txt` | `-rw-r--r--` | `chmod a-w devops.txt` | `-r--r--r--` | Triggers error block upon write attempts |
| `notes.txt` | `-rw-r--r--` | `chmod 640 notes.txt` | `-rw-r-----` | Owner can edit, group can read, public blocked |
| `project/` | `drwxr-xr-x` | `chmod 755 project` | `drwxr-xr-x` | Universal navigation enabled, public modification blocked |

---

## Errors Captured During Simulation Testing

### Test 1: Writing to Read-Only Target (`devops.txt`)
* **Command:** `echo "test" >> devops.txt`
* **Error Message Generated:** `bash: devops.txt: Permission denied`

### Test 2: Executing Without Right-Bit Settings
* **Command:** Attempting execution before running `chmod +x`
* **Error Message Generated:** `bash: ./script.sh: Permission denied`

---

## Commands Used Reference Guide

```bash
touch devops.txt              # Provisions a new text asset container
cat notes.txt                 # Displays complete standard output text arrays
head -n 5 /etc/passwd         # Parses out the first 5 administrative lines of a target matrix
chmod +x script.sh            # appends active executable flags to system scripts
chmod 640 notes.txt           # Employs absolute octal bitmasks to secure confidential logs
