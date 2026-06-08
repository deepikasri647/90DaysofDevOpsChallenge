# Linux Commands Cheat Sheet — DevOps Toolkit

## 1. File System & Navigation
* `pwd` — Prints the current absolute working directory path.
* `ls -lah` — Lists all files and hidden files with detailed permissions and human-readable sizes.
* `cd /var/log` — Changes directory to the system log location.
* `mkdir -p project/src` — Creates nested directories recursively without errors.
* `touch app.log` — Creates an empty file or updates the timestamp of an existing file.
* `cp -r src/ dest/` — Copies directories and their contents recursively.
* `mv old.txt new.txt` — Moves or renames files and directories.
* `rm -rf /tmp/cache` — Forcefully removes files and directories recursively (use with caution).

## 2. File Viewing & Log Inspection
* `cat config.yaml` — Displays the entire content of a file in the terminal.
* `less text.txt` — Opens a file for interactive reading with backward/forward navigation.
* `head -n 10 app.log` — Displays the first 10 lines of a log file.
* `tail -n 20 app.log` — Displays the last 20 lines of a log file.
* `tail -f /var/log/nginx/error.log` — Streams live updates of a log file in real-time.
* `grep -i "error" app.log` — Searches for a specific string case-insensitively inside a file.

## 3. Process Management & Resources
* `ps aux` — Lists every running process on the system with user ownership.
* `top` — Displays dynamic, real-time system resource usage and process activity.
* `htop` — An interactive, colorful, and user-friendly process monitoring tool.
* `kill -9 1234` — Forcefully terminates a stubborn process using its Process ID (PID).

## 4. Networking & Troubleshooting
* `ping -c 4 google.com` — Sends 4 packets to test network connectivity to a host.
* `ip addr show` — Displays active network interfaces and assigned IP addresses.
* `curl -I https://google.com` — Fetches only the HTTP response headers from a web server.
* `dig google.com` — Performs a DNS lookup to retrieve domain name IP records.
