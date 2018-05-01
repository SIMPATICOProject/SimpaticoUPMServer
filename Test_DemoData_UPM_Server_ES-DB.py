#!/usr/bin/python
# -*- coding: latin-1 -*-

"""
Example code to add demographic data into the UPM database - simulates IFE (ES-DB)
"""

#!/usr/bin/python
# -*- coding: latin-1 -*-
import socket, json
import sys

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

configurations = loadResources('configurations.txt')


info = {}
info['request_type'] = "send_demo_data"
info['age'] = 40
info['country_birth'] = "Polonia"
info['languages'] = ["Inglés", "Polaco", "Ruso"]
info['proficiency'] = "C2"
info['educational_level'] = "postgrado"
info['disability'] = None
info['familiarity_PA']= None
info['occupation'] = None 
info['userID'] = "user1012"

data = json.dumps(info)

s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)

s.connect(("localhost",int(configurations['upm_local_server_port'])))

print('Sending...')
s.send(data+'\n')
print('Receiving...')
resp = s.recv(1024).decode('utf8')
print resp
print
s.close()
