#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sampy
import time
import sys

newHub = sampy.SAMPHubServer(addr='127.0.0.1', port=50000)
newHub.start()

try:
	while True:
		time.sleep(0.01)
except KeyboardInterrupt:
	print "SIGINT received"
	try:
		newHub.stop()
	except:
		pass
	
	sys.exit(0)

