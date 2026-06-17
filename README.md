# server_stats

Simple bash script that reports key server stats in a formatted terminal output for easier server analysis.

## Stats reported

- CPU usage (%)
- RAM usage (used / total, with percentage)
- Storage usage (used / available, with percentage)
- Top 5 processes by memory usage
- Top 5 processes by CPU usage

## Usage

```bash
bash server_stats.sh
```

## Requirements

- `vmstat` — from the `procps` package (Debian/Ubuntu: `apt install procps`)
- `free`, `df`, `ps` — standard on all Linux systems

## Output

```
========================================
            SERVER STATS
========================================
  CPU Usage:             12%
  RAM Used:              8.2Gi / 32Gi (25.6%)
  RAM Available:         23.8Gi / 32Gi (74.4%)
  Storage Used:          250G / 1.5T (16.7%)
  Storage Available:     1.2T / 1.5T (83.3%)
----------------------------------------
Top 5 Processes (Memory):
  PID      %MEM   PROGRAM
  2301     3.2    /usr/bin/mysqld
  1874     2.1    /usr/lib/systemd/systemd-journald
  3056     1.8    /usr/sbin/nginx
  4120     1.5    /usr/bin/python3
  1789     1.2    /usr/sbin/sshd

Top 5 Processes (CPU):
  PID      %CPU   PROGRAM
  2301     5.4    /usr/bin/mysqld
  3056     3.2    /usr/sbin/nginx
  4120     2.8    /usr/bin/python3
  1874     1.5    /usr/lib/systemd/systemd-journald
  1201     1.2    /usr/sbin/rsyslogd
========================================
```

--- 

Made under project https://roadmap.sh/projects/server-stats
