#!/bin/bash
echo "Starging movoirVOT2CSVconverter"
./movoirVOT2CSVconverter.py &
read -p "Press any key to start HubMonitor, TOPCAT"
java -jar /Users/jdsant/NetBeansProjects/JarFiles/jsamp-0.3-1.jar hubmonitor &
open -a topcat
read -p "Press any key to start movoirVOT2FITSconverter"
./movoirVOT2FITSconverter.py &
open -a fv /Users/jdsant/Downloads
read -p "Press any key to stop demo"
osascript -e "tell app \"TOPCAT\" to quit"
read -p "Press any key to stop FITS converter"
kill -9 `ps ax | grep movoirVOT2FITS | grep -v grep | cut -c 1-5`
read -p "Press any key to stop CSV converter, hub"
kill -9 `ps ax | grep movoirVOT2CSV | grep -v grep | cut -c 1-5`
read -p "Press any key to stop HubMonitor"
kill -INT `ps ax | grep hubmonitor | grep -v grep | cut -c 1-5`
rm -f /Users/jdsant/.samp
