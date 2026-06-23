# Day 12 — Breather & Revision Log (Days 01–11)

Today was focused on reinforcing internal Linux fundamentals, verification matrices, and auditing structural workflow practices executed over the last 11 days.

---

## 1. Core Milestone Checkpoints Reviewed

### 🟢 Mindset & Plan Check (Day 01 Revisit)
* **Status:** Operational goals are aligned. Transitioning parameters from basic syntax commands to actual cloud setup (WSL2 deployment optimization) has drastically increased system logic confidence.

### 🟢 Process & Service Sanity Re-run (Day 04/05)
* Executed `sudo service nginx status` to verify local subsystem daemon pipelines. 
* *Observation:* The engine is listening perfectly on localized web handles, tracking active memory signatures with zero faults.

### 🟢 User & Group Ownership Audit (Day 09/11)
* Verified group separation structures created earlier. Re-ran an isolation test context:
  ```bash
  ls -l revision.txt
  # Output verified: Owner has read/write, group has read, public blocked (-rw-r-----)
2. Top 5 Incident-Response Commands (Day 03 Cheat Sheet Refresh)
These are the primary 5 commands I would immediately use during a real production downtime incident:

tail -f /var/log/nginx/access.log — Best for live stream error detection.

htop — For instant interactive CPU/Memory processing visualization.

ss -tulpn — Crucial to verify port conflict blocks and network connection health.

journalctl -u docker -n 50 — Isolates target systemd execution stack exceptions.

df -h — Immediate evaluation of potential storage partition crashes.

3. Mini Self-Check Verification Answers
Q1: Which 3 commands save you the most time right now, and why?
Answer: 1. pgrep <name>: Instantly extracts process integers without messy piping parameters.
2. tee -a: Simultaneously outputs terminal visual streams while logging changes to storage scripts.
3. chown owner:group: Optimizes asset metadata mapping pipelines into a single transaction command line.

Q2: How do you check if a service is healthy? List the exact 2–3 commands you’d run first.
Answer:

sudo service <name> status (or systemctl status) — Inspects baseline state definitions.

journalctl -u <name> -n 20 — Reads internal runtime event exits.

ss -tulpn | grep <process> — Confirms socket layer connectivity strings are listening properly.

Q3: How do you safely change ownership and permissions without breaking access? Give one example command.
Answer: Use explicit targeting methods and apply permissions iteratively.

Example: sudo chown berlin:tech-team blueprints.pdf && sudo chmod 640 blueprints.pdf

This guarantees that only authenticated operators and group members retain explicit interaction access, strictly keeping unauthorized traffic vectors isolated.

Q4: What will you focus on improving in the next 3 days?
Answer: Deepening shell scripting automation variables and expanding infrastructure orchestration tracking capabilities.
