# Day 11 Challenge — Linux File Ownership (chown & chgrp)

## Files & Directories Created
* `devops-file.txt` — Individual asset file.
* `team-notes.txt` — Shared logs documentation.
* `project-config.yaml` — Central configuration parameters sheet.
* `app-logs/` — Directory tracking server logs.
* `heist-project/` — Parent directory containing multi-level subfolders (`vault/`, `plans/`).
* `bank-heist/` — Target training workspace workspace.

## Ownership Changes Log Matrix

| Asset Target | Initial State (User:Group) | Command Applied | Modified State (User:Group) |
| :--- | :--- | :--- | :--- |
| `devops-file.txt` | `adminuser:adminuser` | `sudo chown tokyo devops-file.txt` | `tokyo:adminuser` |
| `team-notes.txt` | `adminuser:adminuser` | `sudo chgrp heist-team team-notes.txt` | `adminuser:heist-team` |
| `project-config.yaml` | `adminuser:adminuser` | `sudo chown professor:heist-team project-config.yaml` | `professor:heist-team` |
| `app-logs/` | `adminuser:adminuser` | `sudo chown berlin:heist-team app-logs/` | `berlin:heist-team` |
| `heist-project/` (Recursive) | `adminuser:adminuser` | `sudo chown -R professor:planners heist-project/` | `professor:planners` (All internal sub-files changed) |
| `bank-heist/access-codes.txt` | `adminuser:adminuser` | `sudo chown tokyo:vault-team bank-heist/access-codes.txt` | `tokyo:vault-team` |
| `bank-heist/blueprints.pdf` | `adminuser:adminuser` | `sudo chown berlin:tech-team bank-heist/blueprints.pdf` | `berlin:tech-team` |
| `bank-heist/escape-plan.txt` | `adminuser:adminuser` | `sudo chown nairobi:vault-team bank-heist/escape-plan.txt` | `nairobi:vault-team` |

---

## Commands Used Reference Guide

```bash
ls -lR bank-heist/                    # Lists files recursively with structural ownership mapping
sudo chown tokyo devops-file.txt      # Shifts the primary owning user identity
sudo chgrp heist-team team-notes.txt  # Changes the owning group access layer
sudo chown professor:planners target/ # Direct mapping optimization for both User and Group in one line
sudo chown -R professor:planners dir/ # Recursive flag execution ensuring child entities inherit metadata
