
#!/bin/bash

# system-info.sh - Displays basic system information

echo "--- Infini-X System Information ---"

echo "\nHostname: $(hostname)"
echo "Operating System: $(uname -o)"
echo "Kernel Version: $(uname -r)"
echo "Architecture: $(uname -m)"

echo "\nCPU: $(lscpu | grep "Model name" | cut -d':' -f2 | sed -e 's/^ *//g')"
echo "Memory: $(free -h | grep Mem | awk '{print $2}')"

echo "\nDisk Usage (root partition):"
df -h / | grep /

echo "\nUptime: $(uptime -p)"

echo "-----------------------------------"

