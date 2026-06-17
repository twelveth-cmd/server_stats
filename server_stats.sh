#!/bin/bash

cpu_usage=$(vmstat | tail -1 | awk '{print 100 - $15}')
used_ram=$(free -h | grep "Mem:" | awk '{print $3}')
used_ram_percentage=$(free | grep "Mem:" | awk '{printf "%.1f%%\n", $3/$2 * 100}')
available_ram=$(free -h | grep "Mem:" | awk '{print $7}')
available_ram_percentage=$(free | grep "Mem:" | awk '{printf "%.1f%%\n", $7/$2 * 100}')
free_storage=$(df -h / | awk 'NR==2 {printf $3}')
free_storage_percentage=$(df / | awk 'NR==2 {printf "%.1f%%", $3/$2 * 100}')
used_storage=$(df -h / | awk 'NR==2 {printf $4}')
used_storage_percentage=$(df / | awk 'NR==2 {printf "%.1f%%", $4/$2 * 100}')
proc_mem=$(ps aux --sort=-%mem --no-headers | head -n 5 | awk '{print $2"\t"$11}')
proc_cpu=$(ps aux --sort=-%cpu --no-headers | head -n 5 | awk '{print $2"\t"$11}')

echo "CPU Usage: $cpu_usage %"
echo "Ram Usage: $used_ram ($used_ram_percentage)"
echo "Available Ram: $available_ram ($available_ram_percentage)"
echo "Used Storage: $used_storage ($used_storage_percentage)"
echo "Avilable Storage: $free_storage ($free_storage_percentage)"
echo "Top 5 Processes by memory usage:"
echo "$proc_mem"
echo "Top 5 Processes by CPU usage:"
echo "$proc_cpu"
