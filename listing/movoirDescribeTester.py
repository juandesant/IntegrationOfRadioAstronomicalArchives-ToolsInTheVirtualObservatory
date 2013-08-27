#/usr/bin/env python
# -*- coding: utf-8 -*-
import sys
import sampy

describeTesterMetadata = {	'samp.name':				'movoir.describe.mtype.tester',
							'samp.description.text':	'Tester application for the movoir.describe.mtype message.',
							'movoir.version': '0.1'}

describeTester = sampy.SAMPIntegratedClient(describeTesterMetadata)
describeTester.connect()
clientsToTest = describeTester.getSubscribedClients("movoir.describe.mtype")

for testClient in clientsToTest:
	messageToSend = {	'samp.mtype': 'movoir.describe.mtype',
						'samp.params': {'mtype': 'table.load.votable',
										'verbose': 'true'}}
	try:
		testClientMetadata = describeTester.getMetadata(testClient)
		resultMap = describeTester.callAndWait(testClient, messageToSend, '30')
		assert resultMap.has_key('samp.status'), "Falta samp.status"
		assert resultMap['samp.status'] == 'samp.ok', "samp.status no es samp.ok"
		assert resultMap.has_key('samp.result'), "Falta samp.result"
		assert resultMap['samp.result'].has_key('parameters'), "Falta parameters en samp.result"
		parameterMap = resultMap['samp.result']
		print(testClientMetadata['samp.name'], testClient, parameterMap)
		# assert len(parameterMap) > 0, "parameters no contiene al menos un elemento"
	except AssertionError, e:
		print "Alguna aserción no cumplida"
		print e
		if (describeTester.isConnected()):
			describeTester.disconnect()
			sys.exit(str(e))

if (describeTester.isConnected()):
	describeTester.disconnect()