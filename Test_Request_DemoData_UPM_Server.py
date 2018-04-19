"""
Example code that request the user profile of a given user
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
info['request_type'] = "request_demo_data"
info['userID'] = "user1010"

data = json.dumps(info)

s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)

s.connect(("localhost",int(configurations['upm_local_server_port'])))

print('Sending...')
s.send(data+'\n')
print('Receiving...')
resp = json.loads(s.recv(1024).decode("utf-8"))
print "Demographic Data: %s" % resp['demo_data']
print
s.close()
