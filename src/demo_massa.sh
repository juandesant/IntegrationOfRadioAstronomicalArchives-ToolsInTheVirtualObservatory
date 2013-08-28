#!/bin/bash
echo "Starging SAMPy Hub"
python ./hubStart.py &
read -p "Press any key to start HubMonitor, TOPCAT"
java -jar /Users/jdsant/NetBeansProjects/JarFiles/jsamp-0.3-1.jar hubmonitor &
open SAMP.scpt
open -a eclipse
read -p "Press any key to stop demo"
kill -INT `ps ax | grep Python | grep hubStart | grep -v grep | cut -c 1-5`
kill -INT `ps ax | grep hubmonitor | grep -v grep | cut -c 1-5`
rm -f /Users/jdsant/.samp
