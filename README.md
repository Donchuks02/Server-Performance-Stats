# Server Performance Reporter

A simple Bash script that collects and logs key server performance metrics into a timestamped `.log` file. Useful for quick system diagnostics and auditing.

## Features

- Collects OS details and system date
- Reports CPU and memory usage
- Displays disk space usage
- Lists top 5 CPU- and memory-consuming processes
- Saves the report to a uniquely timestamped log file

## Requirements

- Linux-based system (tested on Ubuntu via WSL)
- Basic Unix tools: `top`, `free`, `df`, `ps`, `awk`, `grep`
- Bash shell

:wq## Sample Output

A typical output file will be named:
server_report_2025-06-14_12-35-43.log


And contain structured information like:

=======================================
Server Performance Report
Generated on: Sat Jun 14 12:35:43 WAT 2025

==== OS Information ====
Linux ChuksPC 5.15.167.4-microsoft-standard-WSL2 ...

==== CPU Usage ====
CPU Usage: 12%

==== Memory Usage ====
Memory Usage: 628420 / 3945328 (15.92%)

==== Disk Usage ====
Disk Usage: 2.3G / 1007G (1%)

==== Top 5 Processes by CPU ====
PID COMMAND %CPU
...

==== Top 5 Processes by Memory ====
PID COMMAND %MEM
...

