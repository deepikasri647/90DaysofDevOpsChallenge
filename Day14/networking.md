# Day 14 — Networking Fundamentals & Hands-on Checks

## 1. Quick Concepts: Mapping the Stack

### OSI Layers vs TCP/IP Stack Matrix
* **Application Layer (OSI L5-L7 / TCP-IP Application):** Where high-level protocols reside. **HTTP/HTTPS** for web traffic and **DNS** for name lookup operate here.
* **Transport Layer (OSI L4 / TCP-IP Transport):** Manages end-to-end communication channels. **TCP** handles reliable, connection-oriented streams, while **UDP** handles fast, connectionless packet streams.
* **Network Layer (OSI L3 / TCP-IP Internet):** Handles logical packet routing and device addressing across separate domains. **IP (IPv4/IPv6)** operates here.
* **Link Layer (OSI L1-L2 / TCP-IP Link):** Handles actual hardware interfaces and physical signal translations.

> **Real-World Interaction Example:** Running `curl https://google.com` translates to an **Application Layer (HTTPS)** payload wrapped inside a **Transport Layer (TCP)** segment, routed via a **Network Layer (IP)** packet over local physical **Link hardware**.

---

## 2. Hands-on Checklist & Observations

### Target Host Under Inspection: `google.com`

* **Identity:** `hostname -I`
  * *Observation:* Extracted internal loop network IP allocation (e.g., `172.x.x.x`). This represents the internal WSL2 interface boundary.
* **Reachability:** `ping -c 4 google.com`
  * *Observation:* 0% packet loss captured. Average round-trip latency clocked at ~14ms, confirming stable network reachability.
* **Path:** `traceroute -m 20 google.com`
  * *Observation:* Traced network path transitions across multiple external routers. Detected minor gateway hops showing asterisks (`* * *`), indicating standard firewall packet drops.
* **Ports:** `ss -tulpn`
  * *Observation:* Identified port `80` actively listening under the `nginx` application daemon thread footprint.
* **Name Resolution:** `dig google.com +short`
  * *Observation:* DNS successfully resolved the abstract string `google.com` into valid destination IPv4 targets.
* **HTTP Check:** `curl -I https://google.com`
  * *Observation:* Server returned a successful `HTTP/2 200` status payload, indicating a completely healthy web interface framework.
* **Connections Snapshot:** `netstat -an | head -n 10`
  * *Observation:* Evaluated system sockets; detected a stable balance of static `LISTEN` pipelines and operational active internet sockets.

---

## 3. Mini Task: Port Probe & Interpretation

* **Command Executed:** `nc -zv localhost 80`
* **Output Result:** `Connection to localhost (127.0.0.1) 80 port [tcp/http] succeeded!`
* **Interpretation:** Port 80 is fully active and reachable. If this connection had dropped or thrown a timeout error, my next diagnostic actions would be checking the explicit web server runtime health status (`sudo service nginx status`) or auditing internal iptables firewall restrictions.

---

## 4. Operational Reflection

1. **Fastest Signal Command:** `ping` gives the fastest up/down connectivity signal, while `curl -I` gives the fastest validation for actual Layer 7 application availability.
2. **Layer Inspection Vectors:**
   * If **DNS fails**, I immediately look at the Network/Internet layer and audit `/etc/resolv.conf` upstream name servers.
   * If an **HTTP 500 error** shows up, network transport is fine; I bypass network debugging entirely and inspect the Application layer logs directly inside the web server or container code.
3. **Incident Response Runbook Checks:** During an active enterprise outage, I would run `ss -tulpn` to check for sudden port conflict issues and analyze downstream logs using `tail -n 100 /var/log/syslog`.
