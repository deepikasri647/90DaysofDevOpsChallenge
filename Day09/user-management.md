# Day 09 Challenge — Linux User & Group Management

## Users & Groups Created
* **Users:** tokyo, berlin, professor, nairobi
* **Groups:** developers, admins, project-team

## Group Assignments
* `tokyo` -> `developers`, `project-team`
* `berlin` -> `developers`, `admins`
* `professor` -> `admins`
* `nairobi` -> `project-team`

## Directories Created
* `/opt/dev-project` — Group Owner: `developers`, Permissions: `775` (`rwxrwxr-x`)
* `/opt/team-workspace` — Group Owner: `project-team`, Permissions: `775` (`rwxrwxr-x`)

## Commands Used

### Account & Group Provisioning
```bash
sudo useradd -m <username>          # Creates a user account with a home directory
sudo passwd <username>            # Assigns a secure password to the user profile
sudo groupadd <groupname>          # Provisions a unique security group
sudo usermod -aG <group>,<group> <user> # Appends the specified user to target groups
Permission Security Control
Bash
sudo chgrp <groupname> /path/dir   # Changes group ownership of a directory
sudo chmod 775 /path/dir           # Modifies octal permission bits to rwxrwxr-x
sudo -u <username> touch /path/file # Simulates action blocks acting as a target user
