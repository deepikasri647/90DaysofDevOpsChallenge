# Day 08 — Local Infrastructure Setup: Nginx Web Deployment via WSL2

## 1. Project Overview
Due to cloud platform free-tier account limitations, I adapted today's challenge to leverage a local DevOps workflow using **WSL2 (Windows Subsystem for Linux)** running an Ubuntu environment. This setup allows for identical package management, service control, and log tracking as a remote Cloud VM, without incurring infrastructure costs.

---

## 2. Key Commands Executed & Outputs

### Step 1: Update Repositories & Install Nginx Stack
```bash
sudo apt update && sudo apt install nginx -y
Purpose: Syncs local repository indexes and installs the Nginx web server engine daemon globally on the Linux subsystem.

Step 2: Service Lifecycle Activation
Bash
sudo service nginx start
Purpose: Initializes the Nginx runtime loop. Since systemd can have limitations on basic WSL profiles, utilizing the native service management layer guarantees initialization.

Step 3: Verify Runtime Health Status
Bash
sudo service nginx status
Expected Terminal Output Snapshot:

Plaintext
* nginx is running
Step 4: Verify Local Loopback Web Access
Opened a web browser on the Windows host machine and navigated to:
http://localhost or http://127.0.0.1

Result: Successfully rendered the standard global "Welcome to nginx!" HTML template page. (Captured browser viewport screenshot as nginx-webpage.png).

Step 5: Isolate and Save Traffic Streams
Bash
tail -n 20 /var/log/nginx/access.log > ~/nginx-logs.txt
Purpose: Extracts the final 20 client request lines recorded by the web dashboard layer and outputs them cleanly into a standalone artifact.

3. Challenges Faced & Troubleshooting Solutions
Challenge 1: Cloud Provisioning Blockers

Issue: Restrictions on public free tiers (AWS/Azure) blocked cloud-side instance deployment.

Solution: Shifted to a local engineering workflow via WSL2. The architectural foundations—including port bindings, log management, and system environments—remain identical to public cloud servers.

Challenge 2: Service Management Incompatibilities

Issue: Running systemctl start nginx threw an error due to missing default systemd configurations on this specific WSL layer.

Solution: Swapped the operation management command sequence to standard SysV init scripts using sudo service nginx start, which bypassed the error and spun up the engine safely.

4. Key Learnings & Takeaways
Subsystem Core Bindings: Understood how WSL2 seamlessly maps internal server port definitions right back into the local Windows host loopback adapter interfaces.

Log Structures: Inspected how explicit client headers (like IP context, timestamps, and HTTP method codes) write strings directly to /var/log/nginx/access.log.

DevOps Engineering Persona: Learned that asset constraints or account access blocks should never stop a pipeline drill; finding functional workarounds is what distinguishes an elite engineer.
