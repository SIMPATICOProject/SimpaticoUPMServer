"""
Example code that requests data from the UPM server using a SQL query - simulates the interaction with TAE
"""
#!/usr/bin/python
# -*- coding: latin-1 -*-
import socket, json
import sys
from struct import unpack

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
info['request_type'] = "request_up_sql"
info['query'] = "SELECT * FROM demographic_data INNER JOIN interaction_data_lexical ON demographic_data.demoID = interaction_data_lexical.demoID INNER JOIN interaction_data_syntactic ON demographic_data.demoID = interaction_data_syntactic.demoID INNER JOIN interaction_data_wf ON demographic_data.demoID = interaction_data_wf.demoID INNER JOIN interaction_data_elaboration ON demographic_data.demoID = interaction_data_elaboration.demoID WHERE demographic_data.userID = 'user1010'"

data = json.dumps(info)

s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)

s.connect(("localhost",int(configurations['upm_local_server_port'])))

print('Sending request: %s' % info['query'])
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
profile = json.loads(data)['profile']

for p in profile:
    print p

#for r in resp["profile"]: 
#    print r
print
s.close()
