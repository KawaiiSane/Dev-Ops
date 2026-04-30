#!/bin/bash

echo "===== SERVER STATS ===== "

# CPU
echo "CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{Print $2 + $4"%"}'

#Memory Usage
echo "Memory Usage:"
free -h
free | awk `/Mem/ {printf("Usage: %.2f%%\n", $3/$2 * 100)}`

# Disk Usage
echo "Disk Usage"
df -h /
df / | awk `NR==2 {Print $5}`

# Top CPU
echo "Top 5 CPU Usage:"
ps aux --sort=-%cpu | head -n 6

# Top Memory usage
echo "Top Process by Memory:"
ps aux --sort=-%mem | head -n 6
