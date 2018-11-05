from BaseHTTPServer import BaseHTTPRequestHandler,HTTPServer
from urlparse import parse_qs
import socket, json
from struct import unpack
import threading
import time
import urllib2

class UPM:

	#Initialize the upm handler:
	def __init__(self, host, port, aac):
		self.port = port
		self.host = host
		self.aac = aac

	def check_string(self,s):
		if s.lower() == "none":
			return None
		else:
			return s
			

	def check_token(self, token):
		#call AAC API
		request_headers = {
			"Accept": "application/json",
			"Authorization": "Bearer " + token
		}
		try:
			request = urllib2.Request(self.aac, headers=request_headers)
			contents = urllib2.urlopen(request).read()
			return json.loads(contents)
		except Exception as exc:
			return {'Error': ['HTTP Error 401: Unauthorized']}
	
	#Send demographic data (from IFE):
	def send_demo_data(self, parameters):
		
		
		#get token from IFE -- token identifies user using AAC
		token = parameters['token'][0]
		
		#function to call AAC API
		userInfo = self.check_token(token)
		
		#check for errors from AAC
		if 'Error' in userInfo:
			return userInfo 
		
		#Create a request to the local UPM server to add demographic data:
		info = {}
		info['request_type'] = parameters['request_type'][0]
		info['age'] = parameters['age'][0] 
		info['country_birth'] = parameters['country_birth'][0]
		info['languages'] = parameters['languages'][0].split(",")
		info['proficiency'] = parameters['proficiency'][0]
		info['educational_level'] = parameters['educational_level'][0]
		info['disability'] = parameters['disability'][0].strip()
		info['familiarity_PA']= parameters['familiarity_PA'][0].strip()
		info['occupation'] = self.check_string(parameters['occupation'][0].strip())
		info['userID'] = userInfo['userId']
		
		data = json.dumps(info)

		try:
			#Send the send_demo_data request to the local server at the designated port:
			s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
			s.connect((self.host, self.port))
			print('Sending...')
			s.send(data+'\n')
			
			#Get a response from the server containing the a message:
			print('Receiving...')
			resp = s.recv(1024).decode('utf8').strip()
			
			print "Demographic Data:"
			print resp
			print

			#Close the TCP connection:
			s.close()
			
			if resp=='NULL':
				#If no simplification was found, return an error:
				return {'Error': ['UPM has not answered.']}
			else:
				#Otherwise, send back a simplification response:
				result = dict(parameters)
				result['target'] = [resp]
				return result
		except Exception as exc:
			#If the connection fails, return an error:
			return {'Error': ['Error while connecting to UPM.']}
			
	#Request demographic data (TAE/WAE mades the request):
	def request_demo_data(self, parameters):
	
		#get token from IFE -- token identifies user using AAC
		token = parameters['token'][0]
		
		#function to call AAC API
		userInfo = self.check_token(token)
		
		#check for errors from AAC
		if 'Error' in userInfo:
			return userInfo 
		
		#Create a request to the local UPM server to request demographic data:
		
		info = {}
		info['request_type'] = parameters['request_type'][0]
		info['userID'] = userInfo['userId']
		
		data = json.dumps(info)

		try:
			#Send the send_demo_data request to the local server at the designated port:
			s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
			s.connect((self.host, self.port))
			
			print('Requesting demographic data for user: ' + info['userID'])
			print('Sending...')
			s.send(data+'\n')
			print('Receiving...')
			
			#Get a response from the server containing the a message:
			resp = json.loads(s.recv(1024).decode("utf-8"))
			print "Demographic Data:" 
			print resp
			print

			#Close the TCP connection:
			s.close()
			
			if resp=='NULL':
				#If no simplification was found, return an error:
				return {'Error': ['UPM has not answered.']}
			else:
				#Otherwise, send back a simplification response:
				result = dict(parameters)
				result['target'] = [resp]
				return result
		except Exception as exc:
			#If the connection fails, return an error:
			return {'Error': ['Error while connecting to UPM.']}
			
			
	#Request interaction data - user specific (TAE/WAE mades the request):
	def request_inter_data(self, parameters):	
		
		#get token from IFE -- token identifies user using AAC
		token = parameters['token'][0]
		
		#function to call AAC API
		userInfo = self.check_token(token)
		
		#check for errors from AAC
		if 'Error' in userInfo:
			return userInfo 
		
		info = {}
		info['request_type'] = parameters['request_type'][0]
		info['userID'] = userInfo['userId']
		info['inter_type'] = parameters['inter_type'][0]

		data = json.dumps(info)
		
		try:
			#Send the send_demo_data request to the local server at the designated port:
			s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
			s.connect((self.host, self.port))
			
			print('*** Requesting ' + info['inter_type'] + ' data from user ' + info['userID'] + '***')
			print('Sending...')
			s.send(data+'\n')

			print('Receiving data in batches...')
			bs = s.recv(8)
			(length,) = unpack('>Q', bs)
			data = b''
			c = 1
			
			while len(data) < length:
				print('Receiving batch %d ...' % c)
				to_read = length - len(data)
				data += s.recv(4096 if to_read > 4096 else to_read)
				c += 1
			assert len(b'\00') == 1
			s.sendall(b'\00')
			
			profile = json.loads(data)['inter_data']

			for p in profile:
				print p
			
			#Close the TCP connection:
			s.close()
			
			if profile=='NULL':
				#If no simplification was found, return an error:
				return {'Error': ['UPM has not answered.']}
			else:
				#Otherwise, send back a simplification response:
				result = dict(parameters)
				result['target'] = [profile]
				return result
		except Exception as exc:
			#If the connection fails, return an error:
			return {'Error': ['Error while connecting to UPM.']}
			
			
	#Request data (demographic and interaction) - user specific (TAE/WAE mades the request):
	def request_data(self, parameters):	
		#get token from IFE -- token identifies user using AAC
		token = parameters['token'][0]
		
		#function to call AAC API
		userInfo = self.check_token(token)
		
		#check for errors from AAC
		if 'Error' in userInfo:
			return userInfo 
		
		info = {}
		info['request_type'] = parameters['request_type'][0]
		info['userID'] = userInfo['userId']
		info['inter_type'] = parameters['inter_type'][0]

		data = json.dumps(info)
		
		try:
			#Send the send_demo_data request to the local server at the designated port:
			s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
			s.connect((self.host, self.port))
			
			print('*** Requesting demographic data and interaction data type = ' + info['inter_type'] + ' from user ' + info['userID'] + '***')
			print('Sending...')
			s.send(data+'\n')

			print('Receiving data in batches...')
			bs = s.recv(8)
			(length,) = unpack('>Q', bs)
			data = b''
			c = 1
			
			while len(data) < length:
				print('Receiving batch %d ...' % c)
				to_read = length - len(data)
				data += s.recv(4096 if to_read > 4096 else to_read)
				c += 1
			assert len(b'\00') == 1
			s.sendall(b'\00')
			
			profile = json.loads(data)

			print profile
			
			#Close the TCP connection:
			s.close()
			
			if profile=='NULL':
				#If no simplification was found, return an error:
				return {'Error': ['UPM has not answered.']}
			else:
				#Otherwise, send back a simplification response:
				result = dict(parameters)
				result['target'] = [profile]
				return result
		except Exception as exc:
			#If the connection fails, return an error:
			return {'Error': ['Error while connecting to UPM.']}					

	#Request demographic data - all users (TAE/WAE mades the request):
	def request_demo_data_all(self, parameters):	
		info = {}
		info['request_type'] = parameters['request_type'][0]

		data = json.dumps(info)
		
		try:
			#Send the send_demo_data request to the local server at the designated port:
			s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
			s.connect((self.host, self.port))
			
			print('*** Requesting demographic data for all users ***')
			print('Sending...')
			s.send(data+'\n')

			print('Receiving data in batches...')
			bs = s.recv(8)
			(length,) = unpack('>Q', bs)
			data = b''
			c = 1
			
			while len(data) < length:
				print('Receiving batch %d ...' % c)
				to_read = length - len(data)
				data += s.recv(4096 if to_read > 4096 else to_read)
				c += 1
			assert len(b'\00') == 1
			s.sendall(b'\00')
			
			
			profile = json.loads(data)['demo_data_all']
			

			for p in profile:
				print p
			
			#Close the TCP connection:
			s.close()
			
			if profile=='NULL':
				#If no simplification was found, return an error:
				return {'Error': ['UPM has not answered.']}
			else:
				#Otherwise, send back a simplification response:
				result = dict(parameters)
				result['target'] = [profile]
				return result
		except Exception as exc:
			#If the connection fails, return an error:
			return {'Error': ['Error while connecting to UPM.']}
	
	#Request interaction data - all users (TAE/WAE mades the request):
	def request_inter_data_all(self, parameters):	
		info = {}
		info['request_type'] = parameters['request_type'][0]
		info['inter_type'] = parameters['inter_type'][0]

		data = json.dumps(info)
		
		try:
			#Send the send_demo_data request to the local server at the designated port:
			s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
			s.connect((self.host, self.port))
			
			print('*** Requesting ' + info['inter_type'] + ' data for all users ***')
			print('Sending...')
			s.send(data+'\n')

			print('Receiving data in batches...')
			bs = s.recv(8)
			(length,) = unpack('>Q', bs)
			data = b''
			c = 1
			
			while len(data) < length:
				print('Receiving batch %d ...' % c)
				to_read = length - len(data)
				data += s.recv(4096 if to_read > 4096 else to_read)
				c += 1
			assert len(b'\00') == 1
			s.sendall(b'\00')
			
			
			profile = json.loads(data)['inter_data_all']
			

			for p in profile:
				print p
			
			#Close the TCP connection:
			s.close()
			
			if profile=='NULL':
				#If no simplification was found, return an error:
				return {'Error': ['UPM has not answered.']}
			else:
				#Otherwise, send back a simplification response:
				result = dict(parameters)
				result['target'] = [profile]
				return result
		except Exception as exc:
			#If the connection fails, return an error:
			return {'Error': ['Error while connecting to UPM.']}
			
	#Request data (demographic and interaction) - user specific (TAE/WAE mades the request):
	def request_data_all(self, parameters):	
		info = {}
		info['request_type'] = parameters['request_type'][0]
		info['inter_type'] = parameters['inter_type'][0]

		data = json.dumps(info)
		
		try:
			#Send the send_demo_data request to the local server at the designated port:
			s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
			s.connect((self.host, self.port))
			
			print('*** Requesting demographic data and interaction data type = ' + info['inter_type'] + ' from user all users' + '***')
			print('Sending...')
			s.send(data+'\n')

			print('Receiving data in batches...')
			bs = s.recv(8)
			(length,) = unpack('>Q', bs)
			data = b''
			c = 1
			
			while len(data) < length:
				print('Receiving batch %d ...' % c)
				to_read = length - len(data)
				data += s.recv(4096 if to_read > 4096 else to_read)
				c += 1
			assert len(b'\00') == 1
			s.sendall(b'\00')
			
			profile = json.loads(data)

			print profile
			
			#Close the TCP connection:
			s.close()
			
			if profile=='NULL':
				#If no simplification was found, return an error:
				return {'Error': ['UPM has not answered.']}
			else:
				#Otherwise, send back a simplification response:
				result = dict(parameters)
				result['target'] = [profile]
				return result
		except Exception as exc:
			#If the connection fails, return an error:
			return {'Error': ['Error while connecting to UPM.']}
			
	#Send interaction data (from LOG/DA):
	def send_inter_data(self, parameters):
	
		info = {}
		info['request_type'] = parameters['request_type'][0]
		info['type'] = parameters['type'][0]
		info['feedback'] = parameters['feedback'][0]
		info['time'] = parameters['time'][0]
		info['userID'] = parameters['userID'][0]
		
		if info['type'] == 'lexical': 
			info['original_text'] = parameters['original_text'][0]
			info['simplified_text'] = parameters['simplified_text'][0]
			info['context'] = parameters['context'][0]
			info['index'] = parameters['index'][0]
			
		
		elif info['type'] == 'syntactic':
			info['original_text'] = parameters['original_text'][0]
			info['simplified_text'] = parameters['simplified_text'][0]

			
		elif info['type'] == 'elaboration':
			info['type_elab'] = parameters['type_elab'][0]


		data = json.dumps(info)
		
		try:
			#Send the send_inter_data request to the local server at the designated port:
			s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
			s.connect((self.host, self.port))
			print('Sending...')
			s.send(data+'\n')
			
			#Get a response from the server containing the a message:
			print('Receiving...')
			resp = s.recv(1024).decode('utf8').strip()
			
			print "Interaction Data:"
			print resp
			print

			#Close the TCP connection:
			s.close()
			
			if resp=='NULL':
				#If no simplification was found, return an error:
				return {'Error': ['UPM has not answered.']}
			else:
				#Otherwise, send back a simplification response:
				result = dict(parameters)
				result['target'] = [resp]
				return result
		except Exception as exc:
			#If the connection fails, return an error:
			return {'Error': ['Error while connecting to UPM.']}



#This class represents the UPM server handler of Simpatico:
class SimpaticoUPMServer(HTTPServer, object):

	#Initialize the server:
	def __init__(self, *args, **kwargs):
		super(SimpaticoUPMServer, self).__init__(*args, **kwargs)
		self.upm = None

	def addUPM(self, upm):
		self.upm = upm

	

#This class represents the UPM server handler of Simpatico:
class SimpaticoUPMHandler(BaseHTTPRequestHandler):
	
	#Handler for the GET requests
	def do_GET(self):
		#Get parameters from URL:
		print('Parsing...')
		input_parameters = self.parse_parameters(self.path)
		
		#Resolve run upm request:
		print('Running...')
		output_parameters = self.run_upm(input_parameters)
		
		#Send response:
		print('Responding...')
		self.respond(output_parameters)
		return
	
	#Send the upm result back to the requester:
	def respond(self, parameters):
		#Send a header:
		self.send_response(200)
		self.send_header('Content-type','application/json')
		self.end_headers()

		#Send the actual upm response:
		response = json.dumps(parameters)
		self.wfile.write(response)
		return
	
	#Process UPM request based on parameters in the parameters:
	def run_upm(self, parameters):
		#Report an error:
		if 'Error' in parameters:
			return parameters
		else:
			#Perform an UPM request:
			if parameters['request_type'][0]=='send_demo_data':
				return self.server.upm.send_demo_data(parameters)
				
			elif parameters['request_type'][0]=='request_demo_data':
				return self.server.upm.request_demo_data(parameters)
				
			elif parameters['request_type'][0]=='send_inter_data':
				return self.server.upm.send_inter_data(parameters)
				
			elif parameters['request_type'][0]=='request_inter_data':
				return self.server.upm.request_inter_data(parameters)
				
			elif parameters['request_type'][0]=='request_inter_data_all':
				return self.server.upm.request_inter_data_all(parameters)
			
			elif parameters['request_type'][0]=='request_data':
				return self.server.upm.request_data(parameters)	
				
			elif parameters['request_type'][0]=='request_data_all':
				return self.server.upm.request_data_all(parameters)
				
			elif parameters['request_type'][0]=='request_demo_data_all':
				return self.server.upm.request_demo_data_all(parameters)
			
			#Report an error:
			else:
				return {'Error': ['Value of parameter "request_type" unknown (available values = "send_demo_data" and "")']}
	
	#This function parses the parameters of an HTTP request line:
	def parse_parameters(self, text):
		#Parse line:
		try:
			parameters = parse_qs(text[2:])
		except Exception as exc:
			parameters = {'Error': ['Error while parsing problem.']}
		
		#Check for appropriate format:
		#Mandatory parameters:
		# - request_type = "send_demo_data", ""
		if 'Error' not in parameters:
			if 'request_type' not in parameters:
				parameters = {'Error': ['Parameter "request_type" missing (available values = "send_demo_data" and "")']}
			#elif 'userID' not in parameters and 'token' not in parameters:
				#parameters = {'Error': ['Parameter "userID/token" missing']}
		
		#Return final parsed parameters:
		return parameters
	

def loadResources(path):
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
		
	
def requestInterData(configurations):
	"""
	Request interaction data from the LOG/DA - scheduled to happen every 24h
	@param configurations: configuration to access the LOG/DA server
	"""
	#TODO: this a toy version where we simulate a LOG/DA server
	#NOTE: This will probably change to access a HTTP server.
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
			
			
			
			
try:
	#Load configurations:
	configurations = loadResources('configurations.txt')
	
	#Set parameters:
	SERVER_PORT_NUMBER = int(configurations['main_upm_server_port'])
	UPM_SERVER = configurations['upm_local_server_host']
	UPM_PORT_NUMBER = int(configurations['upm_local_server_port'])
	AAC = configurations['aac_server_host']

	#Create the UPM server:
	upm = UPM(UPM_SERVER, UPM_PORT_NUMBER, AAC)
	
	#Create thread that requests data from the LOG/DA every 24h
	thread = threading.Thread(name='requesting', target=requestInterData, args = (configurations,))
	thread.start()
	
	#Create the web server:
	server = SimpaticoUPMServer(('', SERVER_PORT_NUMBER), SimpaticoUPMHandler)
	server.addUPM(upm)
	
	#Wait forever for incoming simplification requests:
	server.serve_forever()
	
#If Ctrl+C is pressed, then shut down server:
except KeyboardInterrupt:
	server.socket.close()
