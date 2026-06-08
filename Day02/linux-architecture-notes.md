Linux Architecture & Process Management
1. Core Components
Kernel: The heart of the OS that talks to the hardware (CPU, Memory, Disk).

User Space: Where our applications (like Python, Docker, or Terminal) run.

Init System (systemd): The first process that starts when Linux boots up. It manages all other services.

2. Process Life Cycle & States
Processes change states depending on what they are doing:

Running (R): Currently using the CPU.

Sleeping (S): Waiting for an event or input.

Stopped (T): Process is paused.

Zombie (Z): Process is finished but still has an entry in the process table (needs to be cleaned up by the parent).

3. Why systemd Matters?
It is the standard service manager in modern Linux. It handles:

Starting/Stopping services.

Auto-restarting crashed applications.

Managing logs via journalctl.

4. Daily DevOps Commands
top or htop: To see real-time CPU and Memory usage.

ps aux: To list every running process on the system.

systemctl status <service>: To check if a service (like Docker) is running.

kill -9 <PID>: To forcefully stop a hung process.

journalctl -u <service>: To check the logs of a specific service.
