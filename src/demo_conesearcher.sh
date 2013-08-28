#!/bin/bash
python ./hubStart.py &
java -jar /Users/jdsant/NetBeansProjects/JarFiles/jsamp-0.3-1.jar hubmonitor &
open -a aladin
python ./movoirAMIGAcone.py &
read -p "Press key to kill hub."
osascript -e "tell app \"Aladin\" to quit"
kill -INT `ps ax | grep hubmonitor | grep -v grep | cut -c 1-5`
killall -9 Python
rm -f /Users/jdsant/.samp