#!/usr/bin/python
# -*- coding: latin-1 -*-
import socket
import json
import sys
import mysql.connector
import threading
import time
from struct import pack, unpack

def addDemographic(mysql_user, mysql_pass, mysql_server, mysql_db, data):
	"""
	Add demographic data into the UPM database. 
	@param mysql_user: MySQL server user
	@param mysql_pass: MySQL server user's password
	@param mysql_server: MySQL server host
	@param mysql_db: UPM database name
	@param data: demographic data to be added
	@return success or fail/error message
	"""
	try:
		#connection to the MySQL database
		cnx = mysql.connector.connect(user = mysql_user, password = mysql_pass, host = mysql_server, database = mysql_db)

		#check if the country of birth informed by the user exists in the database
		country_birth = data['country_birth']
		countryID = -1
		query = "SELECT countryID FROM country WHERE lower(country) = lower('%s')" % country_birth
		cursor = cnx.cursor()
		cursor.execute(query)
		for c in cursor:
			countryID = int(c[0])
		
		#if the country of birth is not registered in the table 'country' then 'other' is used
		if countryID == -1: 
			query = "SELECT countryID FROM country WHERE lower(country) = 'other'"
			cursor.execute(query)
			for c in cursor:
				countryID = int(c[0])
		cnx.close()

		#insert demographic data into the table 'demographic_data'
		cnx = mysql.connector.connect(user = mysql_user, password = mysql_pass, host = mysql_server, database = mysql_db) 
		demo_data = {
			'age': data['age'],
			'country_birth': countryID,
			'proficiency': data['proficiency'],
			'educational_level': data['educational_level'],
			'disability': data['disability'],
			'familiarity_PA': data['familiarity_PA'],
			'occupation': data['occupation'],
			'userID': data['userID'],
		}
		add_demographic = "INSERT INTO demographic_data (age, country_birth, proficiency, educational_level, disability, familiarity_PA, occupation, userID) VALUES (%(age)s, %(country_birth)s, %(proficiency)s, %(educational_level)s, %(disability)s, %(familiarity_PA)s, %(occupation)s, %(userID)s)"
		cursor = cnx.cursor()
		cursor.execute(add_demographic, demo_data)
		cnx.commit()

		#insert the native languages spoken by the user in the 'native_language' table
		query = "SELECT demoID FROM demographic_data WHERE userID = '%s'" % data['userID']
		cursor.execute(query)
		demoID = -1
		for c in cursor:   
			demoID = int(c[0])
		cnx.close()
		
		cnx = mysql.connector.connect(user = mysql_user, password = mysql_pass, host = mysql_server, database = mysql_db)
		cursor = cnx.cursor()
		
		#first check if the languages informed are registered in the table 'language', if not 'other' is used
		languages = data['languages']
		for l in languages:
			query = "SELECT languageID FROM languages WHERE lower(language) = lower('%s')" % l
			cursor.execute(query)
			languageID = -1
			for c in cursor:
				languageID = int(c[0])
			if languageID == -1:
				query = "SELECT languageID FROM languages WHERE lower(language) = 'other'"
				cursor.execute(query)
				for c in cursor:
					languageID = int(c[0])
			
			flag = None
			native_languages_dict = {
				'demoID': demoID,
				'languageID': languageID,
			}
			query = "SELECT * FROM native_languages WHERE userID = %(demoID)s and native_language = %(languageID)s "
			cursor.execute(query, native_languages_dict)
			for c in cursor:
				flag = c
			if flag == None:
				 addNativeLanguage = "INSERT INTO native_languages (userID, native_language) VALUES (%(demoID)s, %(languageID)s)"
				 cursor.execute(addNativeLanguage, native_languages_dict)
				 cnx.commit()

		cnx.close()

		#success output  
		output = "Demographic data added"


	except mysql.connector.Error as e:
		print "Error code: ", e.errno
		print "SQLSTATE value:", e.sqlstate
		print "Error message:", e.msg 
		output = "ERROR: demographic data could not be added"

	return output


def addInteraction(mysql_user, mysql_pass, mysql_server, mysql_db, data):
	"""
	Add interaction/adaptation data into the UPM database. 
	@param mysql_user: MySQL server user
	@param mysql_pass: MySQL server user's password
	@param mysql_server: MySQL server host
	@param mysql_db: UPM database name
	@param data: adaptation data to be added
	@return success or fail/error message
	"""
	try:
		#connection to the MySQL database
		cnx = mysql.connector.connect(user = mysql_user, password = mysql_pass, host = mysql_server, database = mysql_db)

		#check if the userID is already inserted into the 'demographic_data' table - pre-requisit
		userID = data['userID']
		query = "SELECT demoID FROM demographic_data WHERE userID = '%s'" % userID
		cursor = cnx.cursor()
		cursor.execute(query)
		demoID = -1
		for c in cursor:
			demoID = int(c[0])
		cnx.close()

		#add demographic data
		if demoID != -1:
			cnx = mysql.connector.connect(user = mysql_user, password = mysql_pass, host = mysql_server, database = mysql_db) 
			interaction_data = {
				'type': data['type'],
				'original_text': data['original_text'],
				'simplified_text': data['simplified_text'],
				'image_request': data['image_request'],
				'wikipedia_request': data['wikipedia_request'],
				'feedback': data['feedback'],
				'time': data['time'],
				'demoID': demoID,
			}
			add_interaction = "INSERT INTO interaction_data (type, original_text, simplified_text, image_request, wikipedia_request, feedback, time, demoID) VALUES (%(type)s, %(original_text)s, %(simplified_text)s, %(image_request)s, %(wikipedia_request)s, %(feedback)s, %(time)s, %(demoID)s)"
			cursor = cnx.cursor()
			cursor.execute(add_interaction, interaction_data)
			cnx.commit()
			cnx.close()
			#success output
			output = "Interaction data added"

		else: 
			output = "ERROR: %s is not registered in the demographic_data table" % userID

	except mysql.connector.Error as e:
		print "Error code: ", e.errno
		print "SQLSTATE value:", e.sqlstate
		print "Error message:", e.msg 
		output = "ERROR: Interaction data could not be added"

	return output

def sendUserProfile(mysql_user, mysql_pass, mysql_server, mysql_db, data):
	"""
	Send user profile - assuming there is already some model trained, the only input needed is the user ID. 
	@param mysql_user: MySQL server user
	@param mysql_pass: MySQL server user's password
	@param mysql_server: MySQL server host
	@param mysql_db: UPM database name
	@param data: user for which the profile will be searched
	@return user profile or an error message
	"""

	try:

		userID = data['userID']
		
		#connection to the MySQL database
		cnx = mysql.connector.connect(user = mysql_user, password = mysql_pass, host = mysql_server, database = mysql_db)
		
		#search for user profile, if there is no profile yet, None is returned
		#TODO: test this functionality when profiling is implemented
		query = "SELECT * FROM user_profiles WHERE userID = '%s'" % userID
		cursor = cnx.cursor()
		cursor.execute(query)
		profile = None
		for c in cursor:
			profile = c[0]

		#search for demographic data, perhaps this will disappear when profiling is implemented
		query = "SELECT * FROM demographic_data WHERE userID = '%s'" % userID
		cursor.execute(query)
		demographic_data = None
		for c in cursor:
			demographic_data = c
		if demographic_data != None:	
			up = {
				'profile': profile,
				'demographic_data': demographic_data,
			}

			#return user profile (success)
			output = json.dumps(up)

		else:
			output = "ERROR: User %s does not exist!" % userID

		
	except mysql.connector.Error as e:
		print "Error code: ", e.errno
		print "SQLSTATE value:", e.sqlstate
		print "Error message:", e.msg 
		output = "ERROR: Interaction data could not be added"

	return output
	
def sendUserInteractionData(mysql_user, mysql_pass, mysql_server, mysql_db, data):
	"""
	Send user interaction data 
	@param mysql_user: MySQL server user
	@param mysql_pass: MySQL server user's password
	@param mysql_server: MySQL server host
	@param mysql_db: UPM database name
	@param data: user for which the profile will be searched
	@return user profile or an error message
	"""

	try:
		#Get important information from query:
		userID = data['userID']
		if 'inter_type' in data:
			inter_type = data['inter_type']
		else:
			inter_type = None
		
		#Connect to the MySQL database:
		cnx = mysql.connector.connect(user = mysql_user, password = mysql_pass, host = mysql_server, database = mysql_db)
		
		#Create sql query:
		if inter_type:
			query = "SELECT ID.* FROM interaction_data as ID INNER JOIN demographic_data as DD ON ID.demoID=DD.demoID WHERE DD.userID='%s' and ID.type='%s'" % (userID, inter_type)
		else:
			query = "SELECT ID.* FROM interaction_data as ID INNER JOIN demographic_data as DD ON ID.demoID=DD.demoID WHERE DD.userID='%s'" % userID
		
		#Execute query:
		cursor = cnx.cursor()
		cursor.execute(query)
		interaction_data = []
		for c in cursor:
			interaction_data.append(c)
		inter_json = {'inter_data': interaction_data}

		#Return data:
		output = json.dumps(inter_json)
		
	except mysql.connector.Error as e:
		print "Error code: ", e.errno
		print "SQLSTATE value:", e.sqlstate
		print "Error message:", e.msg 
		output = "ERROR: Interaction data could not be added"

	return output

def sendUserProfileSQL(mysql_user, mysql_pass, mysql_server, mysql_db, data):
	"""
	Send user profile - without any model trained and for sending data for TAE. 
	@param mysql_user: MySQL server user
	@param mysql_pass: MySQL server user's password
	@param mysql_server: MySQL server host
	@param mysql_db: UPM database name
	@param data: SQL query
	@return user profile or an error message
	"""

	try:

		#connect to the MySQL database
		cnx = mysql.connector.connect(user = mysql_user, password = mysql_pass, host = mysql_server, database = mysql_db)
		
		#query sent
		#TODO: perhaps having a more user-friendly way to query - although this will only be used internally by TAE
		query = data['query']
		cursor = cnx.cursor()
		cursor.execute(query)
		profile = []
		for c in cursor:
			profile.append(c)
		
		up = {
			'profile': profile,
		}		

		#return the profile (or result of the query)
		output = json.dumps(up)

		
	except mysql.connector.Error as e:
		print "Error code: ", e.errno
		print "SQLSTATE value:", e.sqlstate
		print "Error message:", e.msg 
		output = "ERROR: Interaction data could not be added"

	return output

def loadResources(path):
	"""
	Code from TAE Server
	"""
	#Open resource file:
	f = open(path)  

	#Create resource map:
	resources = {}
	
	#Read resource paths:
	for line in f:
		data = line.strip().split('\t')
		if data[0] in resources:
			print 'Repeated resource name: ' + data[0] + '. Please change the name of this resource.'
		resources[data[0]] = data[1]
	f.close()
	
	#Return resource database:
	return resources

def processRequest(configurations):
	"""
	Process a request to the UPM Server
	@param configurations: configurations to create the UPM server and connect to MySQL database
	"""

	hostname = '0.0.0.0'
	port = int(configurations['upm_local_server_port'])
	mysql_server = configurations['mysql_local_server_host']
	mysql_user = configurations['mysql_local_server_user']
	mysql_pass = configurations['mysql_local_server_pass']
	mysql_db = configurations['upm_database_name']

	#Wait for requests:
	serversocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	serversocket.bind((hostname, port))
	serversocket.listen(5)
	print "Bound to " + hostname + ":" + str(port) + ". Listening for connections"

	#Upon receival of a request, do:
	while 1:

		#Open connection:
		(conn, address) = serversocket.accept()

		print "incoming connection from " + str(address)

		#Parse request:
		data = json.loads(conn.recv(1024).decode("utf-8"))
		request_type = data['request_type']
		output = ""
		
		#Add demographic data request	
		if request_type == "send_demo_data":
			print "*** Request type: add demographic data"
			output = addDemographic(mysql_user, mysql_pass, mysql_server, mysql_db, data)
		
			#TODO: implement assignProfile method
			#assignProfile(data['userID'])

		#Add interaction/adaptation data request
		elif request_type == "send_inter_data":
			print "*** Request type: add interaction data"
			output = addInteraction(mysql_user, mysql_pass, mysql_server, mysql_db, data) 

		#Add interaction/adaptation data received in batches (from the LOG)
		elif request_type == "send_inter_data_batches":
			print "*** Request type: add interaction data in batches"
			print('Receiving data in batches...')
			bs = conn.recv(8)
			(length,) = unpack('>Q', bs)
			data = b''
			c = 1
			while len(data) < length:
				print('Receiving batch %d ...' % c)
				to_read = length - len(data)
				data += conn.recv(4096 if to_read > 4096 else to_read)
				c += 1
			assert len(b'\00') == 1
			conn.sendall(b'\00')
			inter_data = json.loads(data)['inter_data']
			for i in inter_data:
			   data_aux = {}
			   l = list(i)
			   data_aux['type'] = l[0]
			   data_aux['original_text'] = l[1]
			   data_aux['simplified_text'] = l[2]
			   data_aux['image_request'] = l[3]
			   data_aux['wikipedia_request'] = l[4]
			   data_aux['feedback'] = l[5]
			   data_aux['time'] = l[6]
			   data_aux['userID'] = l[7]
			   output = addInteraction(mysql_user, mysql_pass, mysql_server, mysql_db, data_aux)
 
		#Retrieve user profile 
		elif request_type == "request_up": 
		   print "*** Request type: request user profile"
		   output = sendUserProfile(mysql_user, mysql_pass, mysql_server, mysql_db, data)
		   
		#Retrieve user interaction data 
		elif request_type == "request_inter_data": 
		   print "*** Request type: request user interaction data"
		   output = sendUserInteractionData(mysql_user, mysql_pass, mysql_server, mysql_db, data)

		#Retrieve user profile/information using SQL query
		elif request_type == "request_up_sql":
		   print "*** Request type: request user profile (SQL)"
		   print "SQL: %s" % data['query']
		   output = sendUserProfileSQL(mysql_user, mysql_pass, mysql_server, mysql_db, data)
																
		#Send result if the request is not a SQL query
		if request_type != "request_up_sql":
		   print "Sending... " + str(output)
		   conn.send(output)
		   conn.close()
		
		#Send result in batches if the request is a SQL query
		else:
		   print "Sending data in batches..."
		   length = pack('>Q', len(output))
		   conn.sendall(length)
		   conn.sendall(output)
		   ack = conn.recv(1)
		   conn.close()

def requestInterData(configurations):
	"""
	Request interaction data from the LOG - scheduled to happen every 24h
	@param configurations: configuration to access the LOG server
	"""
	#TODO: this a toy version where we simulate a LOG server
	starttime=time.time()
	while 1:

		print "Requesting interaction data from LOG"
		print

		#connect with the LOG server
		s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
		s.connect(("localhost",int(configurations['log_local_server_port'])))
		info = {}
		info['request_type'] = 'inter_data_upm'
		data = json.dumps(info)
		s.send(data+'\n')

		#resp = json.loads(s.recv(1024).decode('utf8'))
		#if resp != None:
			#print "Adding interaction data received"
			#output = addInteraction(mysql_user, mysql_pass, mysql_server, mysql_db, resp)
		#s.close()
		#print ((time.time() - starttime) % 60.0)

		#this task will repeat every 24h 
		repeat = 3600.0*24.0 - ((time.time() - starttime) % 60.0)
		print "This task will repeat in %f hours" % (repeat/3600.0)
		time.sleep(repeat)



#Load resources:
configurations = loadResources('configurations.txt')

#Create main thread that listens for connections and either add data to the UPM database or return user profiles
t1 = threading.Thread(name='listening', target=processRequest, args = (configurations,))
t1.start()

#Create secondary thread that requests data from the LOG every 24h
#t2 = threading.Thread(name='requesting', target=requestInterData, args = (configurations,))
#t2.start()


	

