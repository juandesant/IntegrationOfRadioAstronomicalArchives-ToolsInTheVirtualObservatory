#!/usr/bin/env python
# -*- coding: utf-8 -*-
# movoirVOT2CSVconverter

import os
import sys
import sampy
import urllib
import time
import pdb

downloadFolder="/Users/jdsant/Downloads/"

vot2csvMD = {
	'samp.name': 'movoirV2CSV',
	'samp.description.text': 'Conversor de VOTable a CSV',
	'movoir.version': '0.1',
	'samp.icon.url': 'http://www.iaa.es/~jdsant/thesis/v2fitsIcon.png'
}

def convertVotable2CSV(votableUrl, pFileName):
	print "Entering convertVotable2CSV", votableUrl, pFileName
	# pdb.set_trace()
	# Download url 2 temp folder
	extension = '.csv'
	fileName = ""
	if pFileName=="":
		fileName = votableUrl.split('/')[-1]
	else:
		fileName = urllib.quote(pFileName)
		
	print "Filename:", fileName
	curlCommand = "/usr/bin/curl -s -o "+downloadFolder+fileName+" '"+votableUrl+"'"
	print "Executing command:\n"+curlCommand+"\n"
	osCode = os.system(curlCommand)
	if osCode != 0:
		print "Download failed"
	else:
		# We succeeded
		# Lets convert!
		stiltsCommand = "./stilts tcopy "+downloadFolder+fileName
		stiltsCommand = stiltsCommand+" "+downloadFolder+fileName+extension
		stiltsCommand = stiltsCommand+" ifmt=votable ofmt=csv"
		print "Executing command:\n"+stiltsCommand+"\n"
		os.system(stiltsCommand)
		os.system("open "+downloadFolder)
	
	# Call STILTS to convert file
	# Open folder


def notificationHandler(private_key, sender_id, mtype, params, extra):
	#pdb.set_trace()
	print ("notifHandler", private_key, sender_id, mtype, params, extra)
	if mtype == "table.load.votable":
		if params.has_key('url'):
			tableName=""
			if params.has_key('name'):
				tableName=params['name']
			print "In the good branch",params['url'], tableName
			convertVotable2CSV(params['url'], tableName)
	

def callHandler(private_key, sender_id, msg_id, mtype, params, extra):
	# As this is a call, we should return an empty samp.result
	# after having processed it
	print ("callHandler: ", private_key, sender_id, msg_id, mtype, params, extra)
	if mtype == "table.load.votable":
		if params.has_key('url'):
			tableName=""
			if params.has_key('name'):
				tableName=params['name']
			print "In the good branch",params['url'], tableName
			convertVotable2CSV(params['url'], tableName)
			replyMsg = {'samp.status': sampy.SAMP_STATUS_OK,
						'samp.result': {}}
			vot2csvClient.reply(msg_id, replyMsg)
		else:
			print "In the error branch"
			replyMsg = {'samp.status': sampy.SAMP_STATUS_ERROR,
						'samp.result': {},
						'samp.error': {'samp.errortxt': 'No url parameter provided.'}}
			vot2csvClient.reply(msg_id, replyMsg)
		

def responseHandler(private_key, sender_id, msg_id, response):
	# Response received, typically an OK response,
	# we should not be receiving none of these
	print ("Receiving response", private_key, sender_id, msg_id, response)

	

# Start binding behaviours
vot2csvClient = sampy.SAMPIntegratedClient(vot2csvMD)
log = sampy.SAMPLog(level = sampy.SAMPLog.OFF)
try:
	hub = sampy.SAMPHubServer(addr='127.0.0.1', port=50000, log=log)
except sampy.SAMPHubError, err:
	print err
	print "Possibly, already working hub."

try:
	vot2csvClient.connect()
except sampy.SAMPHubError, err:
	if err.value == 'Unable to find a running SAMP Hub.':
		try:
			hub.start()
			vot2csvClient.connect()
		except:
			raise

vot2csvClient.bindReceiveNotification("table.load.votable", notificationHandler)
vot2csvClient.bindReceiveCall("table.load.votable", callHandler)
#movoirVOT2CSVconverter.vot2csvClient.disconnect()

try:
	while True:
		time.sleep(0.01)
except KeyboardInterrupt:
	print "SIGINT received"
	try:
		vot2csvClient.disconnect()
	except:
		pass
	
	try:
		hub.stop()
	except:
		pass
	
	sys.exit(0)

