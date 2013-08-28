#!/bin/bash
java -jar /Users/jdsant/NetBeansProjects/JarFiles/jsamp-0.3-1.jar hubrunner &
java -jar /Users/jdsant/NetBeansProjects/JarFiles/jsamp-0.3-1.jar hubmonitor &
java -jar "/Users/jdsant/NetBeansProjects/movoirVODownloader/dist/movoirVODownloader.jar" &
open -a topcat
java -jar "/Users/jdsant/Downloads/vodesktop-1.2.3.beta3-app.jar" &
