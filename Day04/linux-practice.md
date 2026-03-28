# Linux Practice – Processes and Services

## ⚙️ Process Checks
- ps → shows running processes
- top → shows live CPU and memory usage
- pgrep bash → shows process ID of bash

## 🔧 Service Checks
- systemctl status ssh → shows ssh service status (active/running)
- systemctl list-units --type=service → lists all services

## 📜 Log Checks
- journalctl -u ssh → shows logs of ssh service
- tail -n 20 /var/log/syslog → shows last 20 log lines

## 🧪 Mini Troubleshooting
If a service is not working:
1. Check process using ps
2. Check service status using systemctl
3. Check logs using journalctl
4. Restart service if needed
