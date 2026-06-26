# Day 15 — Networking Concepts: DNS, IP, Subnets & Ports

## Task 1: DNS — How Names Become IPs

### What happens when you type `google.com` in a browser?
When a request is initiated, your computer first checks its local cache and hosts file. If it's a miss, it queries a **Recursive Resolver** (ISP/Google DNS), which traverses the hierarchical DNS tree—asking the **Root Nameservers** (for `.`), the **TLD Nameservers** (for `.com`), and finally the **Authoritative Nameservers** (for `google.com`) to fetch and return the actual destination IP address back to the browser.

### Core DNS Record Types
* **A Record:** Maps an abstract domain string directly to an **IPv4** address target.
* **AAAA Record:** Maps an abstract domain string directly to an **IPv6** address target.
* **CNAME (Canonical Name):** Maps an alias domain name back to another primary target domain name (e.g., routing `www.app.com` to `app.com`).
* **MX (Mail Exchanger):** Specifies the mail server resource priority layers handling incoming email traffic for that domain.
* **NS (Name Server):** Identifies which authoritative servers hold the definitive DNS record maps for that specific zone block.

---

## Task 2: IP Addressing & Verification

An **IPv4 address** is a unique 32-bit logical identifier structured as four 8-bit decimal sections called octets, separated by periods (e.g., `192.168.1.10`).

### Public vs Private Addresses
* **Public IPs:** Globally unique coordinates reachable across the public internet (e.g., Google's public routing interface `8.8.8.8`).
* **Private IPs:** Isolated addresses utilized to link resources securely inside local network footprints (e.g., `192.168.1.50`). These are non-routable on the public web.

### Standard Private RFC 1918 Ranges
* `10.0.0.0 – 10.255.255.255` (Class A Network pool)
* `172.16.0.0 – 172.31.255.255` (Class B Network pool)
* `192.168.0.0 – 192.168.255.255` (Class C Network pool)

---

## Task 3: CIDR & Subnetting Basics

In `192.168.1.0/24`, the **`/24`** prefix indicates the CIDR notation, meaning the first 24 bits are masked off as immutable network coordinates, leaving the remaining 8 bits free for binding host endpoints.

### Why do we Subnet?
We practice subnetting to slice massive flat network clouds into isolated, manageable chunks. This drastically reduces unnecessary network broadcast traffic overhead and establishes strict security perimeters (e.g., segregating frontend public servers from backend internal database subnets).

### CIDR Reference Matrix
| CIDR Block | Subnet Mask | Total IPs | Usable Hosts |
| :--- | :--- | :--- | :--- |
| `/24` | `255.255.255.0` | 256 | 254 (Total minus Network & Broadcast addresses) |
| `/16` | `255.255.0.0` | 65,536 | 65,534 |
| `/28` | `255.255.255.240` | 16 | 14 |

---

## Task 4: Ports — The Doors to Services

A **port** is a 16-bit logical communication channel integer appended to network requests, enabling a single operating system host interface to route packets into separate running application endpoints.

### Core Port Mappings
* **Port 22:** SSH (Secure Shell) — Encrypted remote host console management.
* **Port 80:** HTTP — Non-secure web traffic interface.
* **Port 443:** HTTPS — Secure, SSL/TLS-encrypted web application streams.
* **Port 53:** DNS — Domain Name System name resolution parsing queries.
* **Port 3306:** MySQL — Core relational database query layer interface.
* **Port 6379:** Redis — In-memory caching/key-value storage database port.
* **Port 27017:** MongoDB — NoSQL database document cluster service.

---

## Task 5: Operational Architectures & Diagnostics

### Case 1: Evaluating `curl http://myapp.com:8080`
1. **DNS Resolution:** The client system converts `myapp.com` using an A-Record lookup to resolve the destination host IP.
2. **Network Routing:** Packs data inside an IP packet targeting that destination IP over standard internet layers.
3. **Socket Handshake:** Initiates a connection over the Transport layer using **TCP** targeting designated logic door **Port 8080** to process the Application layer payload payload.

### Case 2: Target App Cannot Reach DB at `10.0.1.50:3306`
1. **Network Connectivity Check:** Run `ping 10.0.1.50` to evaluate whether standard logical routing paths exist to the target.
2. **Port Delivery Audit:** Execute `nc -zv 10.0.1.50 3306` to determine if the specific database socket door is accessible.
3. **Database Subsystem Verification:** Inspect the remote DB configuration files to confirm the daemon engine is bound to interface `0.0.0.0` rather than locked onto standard localhost loops (`127.0.0.1`), and check firewalls (Security Groups/NSG rules).

---

## Key Learnings
1. **The Core Network Hierarchy:** Realized how DNS records, IP boundaries, and port channels form a unified framework required to deliver single application packets globally.
2. **Subnet Math Calculations:** Mastered structural binary host limits ($2^{n}-2$) to design efficient cloud architectures without wasting network allocations.
3. **Diagnostic Triage Mindset:** Developed a systematic debugging flow to differentiate name conversion blocks (DNS) from local service accessibility locks (Ports).
