#!/bin/bash

cpu_usage=$(vmstat | tail -1 | awk '{print 100 - $15}')
used_ram=$(free -h | grep "Mem:" | awk '{print $3}')
used_ram_percentage=$(free | grep "Mem:" | awk '{printf "%.1f%%\n", $3/$2 * 100}')
available_ram=$(free -h | grep "Mem:" | awk '{print $7}')
available_ram_percentage=$(free | grep "Mem:" | awk '{printf "%.1f%%\n", $7/$2 * 100}')
used_storage=$(df -h / | awk 'NR==2 {printf $3}')
used_storage_percentage=$(df / | awk 'NR==2 {printf "%.1f%%", $3/$2 * 100}')
free_storage=$(df -h / | awk 'NR==2 {printf $4}')
free_storage_percentage=$(df / | awk 'NR==2 {printf "%.1f%%", $4/$2 * 100}')
total_storage=$(df -h / | awk 'NR==2 {print $2}')
total_ram=$(free -h | awk '/Mem:/ {print $2}')
proc_mem=$(ps aux --sort=-%mem --no-headers | head -n 5 | awk '{printf "  %-8s %-6s %s\n", $2, $4, $11}')
proc_cpu=$(ps aux --sort=-%cpu --no-headers | head -n 5 | awk '{printf "  %-8s %-6s %s\n", $2, $3, $11}')

echo
echo "========================================"
echo "            SERVER STATS"
echo "========================================"
printf "  %-22s %s\n" "CPU Usage:" "$cpu_usage%"
printf "  %-22s %s / %s (%s)\n" "RAM Used:" "$used_ram" "$total_ram" "$used_ram_percentage"
printf "  %-22s %s / %s (%s)\n" "RAM Available:" "$available_ram" "$total_ram" "$available_ram_percentage"
printf "  %-22s %s / %s (%s)\n" "Storage Used:" "$used_storage" "$total_storage" "$used_storage_percentage"
printf "  %-22s %s / %s (%s)\n" "Storage Available:" "$free_storage" "$total_storage" "$free_storage_percentage"
echo "----------------------------------------"
echo "Top 5 Processes (Memory):"
printf "  %-8s %-6s %s\n" "PID" "%MEM" "PROGRAM"
echo "$proc_mem"
echo
echo "Top 5 Processes (CPU):"
printf "  %-8s %-6s %s\n" "PID" "%CPU" "PROGRAM"
echo "$proc_cpu"
echo "========================================"
