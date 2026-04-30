#!/bin/bash

LOG_FILE="server-stats.log"

CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> $LOG_FILE
}

print_section() {
    echo ""
    echo "========== $1 =========="
}

get_cpu() {
    print_section "CPU USAGE"

    CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    echo "CPU Usage: $CPU%"

    if (( $(echo "$CPU > $CPU_THRESHOLD" | bc -l) )); then
        echo "⚠️ High CPU usage!"
        log "High CPU usage: $CPU%"
    fi
}

get_memory() {
    print_section "MEMORY USAGE"

    MEM=$(free | awk '/Mem/ {print ($3/$2) * 100}')
    echo "Memory Usage: $(printf "%.2f" $MEM)%"

    if (( $(echo "$MEM > $MEM_THRESHOLD" | bc -l) )); then
        echo "⚠️ High Memory usage!"
        log "High Memory usage: $MEM%"
    fi
}

get_disk() {
    print_section "DISK USAGE"

    DISK=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
    echo "Disk Usage: $DISK%"

    if [ "$DISK" -gt "$DISK_THRESHOLD" ]; then
        echo "⚠️ Disk almost full!"
        log "High Disk usage: $DISK%"
    fi
}

top_processes() {
    print_section "TOP PROCESSES (CPU)"
    ps aux --sort=-%cpu | head -n 6

    print_section "TOP PROCESSES (MEMORY)"
    ps aux --sort=-%mem | head -n 6
}

system_info() {
    print_section "SYSTEM INFO"
    uptime
    who
    cat /etc/os-release | head -n 5
}

main() {
    echo "===== SERVER HEALTH REPORT ====="
    system_info
    get_cpu
    get_memory
    get_disk
    top_processes
}

main