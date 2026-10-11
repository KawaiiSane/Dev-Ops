ansible is a configuration tool

why need ansible?
1. reduce the time to market by faster configurations
2. we need to have a scalable approach to manage multiple servers
3. push based mechanism - 


Alternates to Ansible
1. Chef 
2. Puppet - Pull and push based mechenism 


hosts.ini

playbook

# Module 1: Ansible Basics

## What you'll learn
- Understand Ansible inventory and host groups
- Run ad-hoc commands against remote servers
- Write and execute your first playbook
- Use `become` for privilege escalation
- Work with `package`, `service`, `copy`, `file`, and `lineinfile` modules

## Prerequisites
- Infrastructure provisioned with Terraform (`cd terraform && terraform apply`)
- Inventory auto-generated at `inventories/dev/hosts.ini`
- SSH key configured at `~/keys/terra-key-ansible.pem`

## Ad-Hoc Commands (Try these first!)

```bash
# Test connectivity to all servers
ansible all -m ping

# Check OS info on all servers
ansible all -m setup -a "filter=ansible_distribution*"

# Check memory on a specific host
ansible master-ubuntu -a "free -h"

# Check disk space on all workers
ansible workers -a "df -h"

# Check uptime on ubuntu hosts only
ansible ubuntu -a "uptime"
```

## Playbooks in This Module

| # | Playbook | Concepts Taught |
|---|----------|----------------|
| 1 | `01_ping.yml` | Play structure, YAML syntax, ping module |
| 2 | `02_gather_facts.yml` | Facts, setup module, debug module |
| 3 | `03_install_packages.yml` | become, package module, state |
| 4 | `04_file_operations.yml` | copy, file, lineinfile — idempotency |
| 5 | `05_services.yml` | service/systemd module, state vs enabled |

## How to Run

```bash
# Run from the repo root directory
ansible-playbook modules/01-basics/01_ping.yml

# Run with verbose output to see more details
ansible-playbook modules/01-basics/02_gather_facts.yml -v
```

## Good to know
- Ansible is **agentless** — it connects via SSH, no software needed on target servers
- Playbooks are **idempotent** — running them twice produces the same result
- The `package` module auto-detects apt/dnf — use it instead of `apt` or `dnf` for cross-OS playbooks
- `become: yes` is needed for tasks that require root privileges 