"""
Example code to add interaction/adaptation data into the UPM database - simulates interaction with the LOG
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
info['request_type'] = "send_inter_data"
info['type'] = "workflow"
info['original_text'] = None
info['simplified_text'] = None
info['image_request'] = None
info['wikipedia_request'] = None
info['feedback'] = 0
info['time'] = 800
info['userID'] = "user1010"

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
