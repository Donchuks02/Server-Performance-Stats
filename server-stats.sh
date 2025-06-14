#!/bin/bash


# Save output to a timestamped file

LOGFILE="server_report_$(date +%Y-%m-%d_%H-%M-%S).log"

#exec > "$LOGFILE" 2>&1
{
echo "======================================="
echo "      Server Performance Report        "
echo "Generated on: $(date)"
echo "======================================="

# OS Info
echo -e "\n==== OS Information ===="
uname -a


# CPU Usage
echo -e "\n==== CPU Usage ===="
CPU_IDLE=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}' | cut -d',' -f1)
CPU_USAGE=$((100 - CPU_IDLE))
echo "CPU Usage: $CPU_USAGE%"

# Memory Usage
echo -e "\n==== Memory Usage ===="
free -h

MEM_TOTAL=$(free | grep Mem | awk '{print $2}')
MEM_USED=$(free | grep Mem | awk '{print $3}')
MEM_PERCENT=$(awk "BEGIN {printf \"%.2f\", ($MEM_USED/$MEM_TOTAL)*100}")
echo "Memory Usage: $MEM_USED / $MEM_TOTAL ($MEM_PERCENT%)"

# Disk Usage
echo -e "\n==== Disk Usage ===="
df -h /

DISK_TOTAL=$(df / | awk 'NR==2 {print $2}')
DISK_USED=$(df / | awk 'NR==2 {print $3}')
DISK_PERCENT=$(df / | awk 'NR==2 {print $5}')
echo "Disk Usage: $DISK_USED / $DISK_TOTAL ($DISK_PERCENT)"

# Top 5 Processes by CPU
echo -e "\n==== Top 5 Processes by CPU ===="
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

# Top 5 Processes by Memory
echo -e "\n==== Top 5 Processes by Memory ===="
ps -eo pid,comm,%mem --sort=-%mem | head -n 6

# Save summary location
echo -e "\nReport saved to: $LOGFILE"
} > "$LOGFILE" 2>&1
