#!/bin/bash
##################################################
# Purpose: Capture and Store System Load Average #
# CPU Usage and Memory Usage #
##################################################
# Log File Path
LOGFILE=/var/log/systemload.log

HOSTNAME=$(hostname)
DATE=$(date "+%d-%m-%Y %H:%M:%S")
SYSTEMLOAD=$(uptime | awk '{ print $8,$9,$10}')
CPULOAD=$(top -b -n 2 -d1 | grep "Cpu(s)" | tail -n1 |awk '{print $2}')
MEMORYUSAGE=$(free -m |grep Mem: |tail -n1 |awk '{print $2,$3}')

echo "$DATE $HOSTNAME LoadAverage: $SYSTEMLOAD CPU: $CPULOAD Memory: $MEMORYUSAGE" >> $LOGFILE

# Set cronjob to get log
# crontab -e 
# */5 * * * * sh systemload.sh

# cat /var/log/systemload.log
# 23-02-2019 17:56:50 ServerComputer.localdomain LoadAverage: 0.00, 0.01, 0.05 CPU: 0.0 Memory: 1963 166
# 23-02-2019 18:53:42 ServerComputer.localdomain LoadAverage: 0.00, 0.01, 0.05 CPU: 1.0 Memory: 1963 166
