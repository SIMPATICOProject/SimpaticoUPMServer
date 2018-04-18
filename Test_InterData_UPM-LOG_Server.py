"""
Example code that simulates a LOG server interacting with UPM
"""
#!/usr/bin/python
# -*- coding: latin-1 -*-
import socket, json
import sys
from struct import pack

def dumpData():
    data = []
    d = {
        'type': "lexical", 
        'original_text': "perch", 
        'simplified_text': "sit", 
        'context': "The cat perched no the mat.",
        'index': "4",
        'feedback': "0", 
        'time': "60", 
        'userID': "user001",
	}
    data.append(d) 
    d = {
        'type': "workflow", 
        'feedback': "0", 
        'time': "60", 
        'userID': "user001",
	}
    data.append(d)
    d = {
        'type': "lexical",
        'original_text': "perch",
        'simplified_text': "sit",
        'context': "The cat perched no the mat.",
        'index': "4",
        'feedback': "0",
        'time': "60",
        'userID': "user020",
     }
    data.append(d)
    d = {
        'type': "lexical",
        'original_text': "perch",
        'simplified_text': "sit",
        'context': "The cat perched no the mat.",
        'index': "4",
        'feedback': "1",
        'time': "160",
        'userID': "user030",
    }
    data.append(d)
    d = {
        'type': "lexical",
        'original_text': "perch",
        'simplified_text': "sit",
        'context': "The cat perched no the mat.",
        'index': "4",
        'feedback': "0",
        'time': "60",
        'userID': "user040",
    }
    data.append(d)
    d = {
        'type': "lexical",
        'original_text': "perch",
        'simplified_text': "sit",
        'context': "The cat perched no the mat.",
        'index': "4",
        'feedback': "0",
        'time': "60",
        'userID': "user050",
    }
    data.append(d)
    d = {
        'type': "lexical",
        'original_text': "perch",
        'simplified_text': "sit",
        'context': "The cat perched no the mat.",
        'index': "4",
        'feedback': "1",
        'time': "30",
        'userID': "user060",
    }
    data.append(d)
    d = {
        'type': "lexical",
        'original_text': "perch",
        'simplified_text': "sit",
        'context': "The cat perched no the mat.",
        'index': "4",
        'feedback': "0",
        'time': "60",
        'userID': "user070",
    }
    data.append(d)
    d = {
        'type': "lexical",
        'original_text': "perch",
        'simplified_text': "sit",
        'context': "The cat perched no the mat.",
        'index': "4",
        'feedback': "0",
        'time': "60",
        'userID': "user080",
    }
    data.append(d)
    d = {
        'type': "lexical",
        'original_text': "perch",
        'simplified_text': "sit",
        'context': "The cat perched no the mat.",
        'index': "4",
        'feedback': "0",
        'time': "60",
        'userID': "user090",
    }
    data.append(d)
    d = {
        'type': "lexical",
        'original_text': "perch",
        'simplified_text': "sit",
        'context': "The cat perched no the mat.",
        'index': "4",
        'feedback': "0",
        'time': "60",
        'userID': "user100",
    }
    data.append(d)
    d = {
        'type': "lexical",
        'original_text': "perch",
        'simplified_text': "sit",
        'context': "The cat perched no the mat.",
        'index': "4",
        'feedback': "0",
        'time': "60",
        'userID': "user200",
    }
    data.append(d)
    d = {
        'type': "lexical",
        'original_text': "perch",
        'simplified_text': "sit",
        'context': "The cat perched no the mat.",
        'index': "4",
        'feedback': "0",
        'time': "60",
        'userID': "user300",
    }
    data.append(d)
    d = {
        'type': "lexical",
        'original_text': "perch",
        'simplified_text': "sit",
        'context': "The cat perched no the mat.",
        'index': "4",
        'feedback': "1",
        'time': "55",
        'userID': "user400",
    }
    data.append(d)
    d = {
        'type': "workflow", 
        'feedback': "0", 
        'time': "60", 
        'userID': "user030",
	}
    data.append(d)
    d = {
        'type': "workflow", 
        'feedback': "1", 
        'time': "60", 
        'userID': "user040",
	}
    data.append(d)
    d = {
        'type': "workflow", 
        'feedback': "1", 
        'time': "55", 
        'userID': "user050",
	}
    data.append(d)
    d = {
        'type': "workflow", 
        'feedback': "0", 
        'time': "60", 
        'userID': "user060",
	}
    data.append(d)
    d = {
        'type': "workflow", 
        'feedback': "0", 
        'time': "60", 
        'userID': "user070",
	}
    data.append(d)
    d = {
        'type': "workflow", 
        'feedback': "0", 
        'time': "60", 
        'userID': "user080",
	}
    data.append(d)
    d = {
        'type': "workflow", 
        'feedback': "0", 
        'time': "60", 
        'userID': "user090",
	}
    data.append(d)
    d = {
        'type': "workflow", 
        'feedback': "0", 
        'time': "60", 
        'userID': "user100",
	}
    data.append(d)
    d = {
        'type': "workflow", 
        'feedback': "0", 
        'time': "60", 
        'userID': "user200",
	}
    data.append(d)
    d = {
        'type': "workflow", 
        'feedback': "0", 
        'time': "60", 
        'userID': "user300",
	}
    data.append(d)
    d = {
        'type': "workflow", 
        'feedback': "1", 
        'time': "160", 
        'userID': "user400",
	}
    data.append(d)
    d = {
        'type': "workflow", 
        'feedback': "1", 
        'time': "60", 
        'userID': "user500",
	}
    data.append(d)
    d = {
        'type': "syntactic",
        'original_text': "We want to reassure you that we take fire safety very seriously and we are doing everything we can to make sure our residents are safe.",
        'simplified_text': "We want to make sure people take fire safety very seriously. We are doing everything we can to make sure our people are safe.",
        'feedback': "1",
        'time': "30",
        'userID': "user060",
    }
    data.append(d)
    d = {
        'type': "syntactic",
        'original_text': "We want to reassure you that we take fire safety very seriously and we are doing everything we can to make sure our residents are safe.",
        'simplified_text': "We want to make sure people take fire safety very seriously. We are doing everything we can to make sure our people are safe.",
        'feedback': "1",
        'time': "30",
        'userID': "user050",
    }
    data.append(d)
    d = {
        'type': "syntactic",
        'original_text': "We want to reassure you that we take fire safety very seriously and we are doing everything we can to make sure our residents are safe.",
        'simplified_text': "We want to make sure people take fire safety very seriously. We are doing everything we can to make sure our people are safe.",
        'feedback': "1",
        'time': "30",
        'userID': "user040",
    }
    data.append(d)
    d = {
        'type': "syntactic",
        'original_text': "We want to reassure you that we take fire safety very seriously and we are doing everything we can to make sure our residents are safe.",
        'simplified_text': "We want to make sure people take fire safety very seriously. We are doing everything we can to make sure our people are safe.",
        'feedback': "1",
        'time': "30",
        'userID': "user030",
    }
    data.append(d)
    d = {
        'type': "syntactic",
        'original_text': "We want to reassure you that we take fire safety very seriously and we are doing everything we can to make sure our residents are safe.",
        'simplified_text': "We want to make sure people take fire safety very seriously. We are doing everything we can to make sure our people are safe.",
        'feedback': "1",
        'time': "30",
        'userID': "user070",
    }
    data.append(d)
    d = {
        'type': "syntactic",
        'original_text': "We want to reassure you that we take fire safety very seriously and we are doing everything we can to make sure our residents are safe.",
        'simplified_text': "We want to make sure people take fire safety very seriously. We are doing everything we can to make sure our people are safe.",
        'feedback': "1",
        'time': "30",
        'userID': "user080",
    }
    data.append(d)
    d = {
        'type': "syntactic",
        'original_text': "We want to reassure you that we take fire safety very seriously and we are doing everything we can to make sure our residents are safe.",
        'simplified_text': "We want to make sure people take fire safety very seriously. We are doing everything we can to make sure our people are safe.",
        'feedback': "1",
        'time': "30",
        'userID': "user090",
    }
    data.append(d)
    d = {
        'type': "syntactic",
        'original_text': "We want to reassure you that we take fire safety very seriously and we are doing everything we can to make sure our residents are safe.",
        'simplified_text': "We want to make sure people take fire safety very seriously. We are doing everything we can to make sure our people are safe.",
        'feedback': "0",
        'time': "130",
        'userID': "user100",
    }
    data.append(d)
    d = {
        'type': "syntactic",
        'original_text': "We want to reassure you that we take fire safety very seriously and we are doing everything we can to make sure our residents are safe.",
        'simplified_text': "We want to make sure people take fire safety very seriously. We are doing everything we can to make sure our people are safe.",
        'feedback': "1",
        'time': "30",
        'userID': "user200",
    }
    data.append(d)
    d = {
        'type': "syntactic",
        'original_text': "We want to reassure you that we take fire safety very seriously and we are doing everything we can to make sure our residents are safe.",
        'simplified_text': "We want to make sure people take fire safety very seriously. We are doing everything we can to make sure our people are safe.",
        'feedback': "1",
        'time': "30",
        'userID': "user300",
    }
    data.append(d)
    d = {
        'type': "syntactic",
        'original_text': "We want to reassure you that we take fire safety very seriously and we are doing everything we can to make sure our residents are safe.",
        'simplified_text': "We want to make sure people take fire safety very seriously. We are doing everything we can to make sure our people are safe.",
        'feedback': "0",
        'time': "30",
        'userID': "user400",
    }
    data.append(d)
    d = {
        'type': "syntactic",
        'original_text': "We want to reassure you that we take fire safety very seriously and we are doing everything we can to make sure our residents are safe.",
        'simplified_text': "We want to make sure people take fire safety very seriously. We are doing everything we can to make sure our people are safe.",
        'feedback': "0",
        'time': "30",
        'userID': "user400",
    }
    data.append(d)
    d = {
        'type': "elaboration",
	'type_elab': "image",
        'feedback': "0",
        'time': "30",
        'userID': "user400",
    }
    data.append(d)
    d = {
        'type': "elaboration",
	'type_elab': "wikipedia",
        'feedback': "1",
        'time': "30",
        'userID': "user400",
    }
    data.append(d)
    d = {
        'type': "elaboration",
	'type_elab': "image",
        'feedback': "1",
        'time': "30",
        'userID': "user500",
    }
    data.append(d)
    d = {
        'type': "elaboration",
	'type_elab': "image",
        'feedback': "1",
        'time': "30",
        'userID': "user400",
    }
    data.append(d)
    d = {
        'type': "elaboration",
	'type_elab': "wikipedia",
        'feedback': "0",
        'time': "30",
        'userID': "user500",
    }
    data.append(d)
    d = {
        'type': "elaboration",
	'type_elab': "image",
        'feedback': "0",
        'time': "30",
        'userID': "user100",
    }
    data.append(d)
    d = {
        'type': "elaboration",
	'type_elab': "image",
        'feedback': "0",
        'time': "30",
        'userID': "user200",
    }
    data.append(d)
    d = {
        'type': "elaboration",
	'type_elab': "wikipedia",
        'feedback': "0",
        'time': "30",
        'userID': "user300",
    }
    data.append(d)
    d = {
        'type': "elaboration",
	'type_elab': "image",
        'feedback': "0",
        'time': "30",
        'userID': "user090",
    }
    data.append(d)
    d = {
        'type': "elaboration",
	'type_elab': "wikipedia",
        'feedback': "0",
        'time': "30",
        'userID': "user080",
    }
    data.append(d)
    d = {
        'type': "elaboration",
	'type_elab': "image",
        'feedback': "0",
        'time': "30",
        'userID': "user060",
    }
    data.append(d)
    
    return data


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

hostname = '0.0.0.0'
port = int(configurations['log_local_server_port'])

serversocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
serversocket.bind((hostname, port))
serversocket.listen(5)
print "Bound to " + hostname + ":" + str(port) + ". Listening for connections"

while 1:
    (conn, address) = serversocket.accept()
    print "incoming connection from " + str(address)

    data = json.loads(conn.recv(1024).decode("utf-8"))
    request_type = data['request_type']

    if request_type == 'inter_data_upm':
        data = dumpData()
        info1 = {}
        info1['request_type'] = "send_inter_data_batches"
        info2 = {}
        info2['inter_data'] = data
        #info['type'] = "lexical"
        #info['original_text'] = "perch"
        #info['simplified_text'] = "sit"
        #info['image_request'] = None
        #info['wikipedia_request'] = None
        #info['feedback'] = 0
        #info['time'] = 60
        #info['userID'] = "user001"

        data = json.dumps(info1)

        s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)

        s.connect(("localhost",int(configurations['upm_local_server_port'])))
        s.send(data+'\n')
        data = json.dumps(info2)
        print "Sending data in batches..."
        length = pack('>Q', len(data))
        s.sendall(length)
        s.sendall(data+'\n')
        ack = s.recv(1)
        s.close()
        print ack
        #s.send(data+'\n')
        #print('Receiving...')
        #resp = s.recv(1024).decode('utf8')
        #print resp
        #print
        #s.close()
