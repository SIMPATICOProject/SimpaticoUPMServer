import urllib2

### Test 1
print "*** Test 1: IFE send demographic data to UPM"

url = 'http://localhost:8080/?request_type=send_demo_data&age=20&country_birth=Brazil&languages=Italian&proficiency=C1&educational_level=primary&disability=%20&familiarity_PA=basic&occupation=None&token=94ebd08b-4218-43a0-9ca7-34408f81bb84'

content = urllib2.urlopen(url).read()

print content
print

### Test 2
print "*** Test 2: wrong/invalid user token retrieved from IFE"

url = 'http://localhost:8080/?request_type=send_demo_data&age=40&country_birth=Brazil&languages=Italian&proficiency=C1&educational_level=primary&disability=%20&familiarity_PA=basic&occupation=None&token=a3245fe8-f113-4c7a-819d-8e6516e1c'

content = urllib2.urlopen(url).read()

print content
print

### Test 3
##TODO: define whether or not TAE/WAE will use token or user ID
print "*** Test 3: TAE/WAE requests demographic data"

url = 'http://localhost:8080/?request_type=request_demo_data&token=94ebd08b-4218-43a0-9ca7-34408f81bb84'

content = urllib2.urlopen(url).read()

print content
print

### Test 4
##TODO: define whether or not DA/LOG will use token or user ID
print "*** Test 4.1: DA/LOG sends interaction data (lexical) from a given user"

url = 'http://localhost:8080/?request_type=send_inter_data&type=lexical&original_text=complex&simplified_text=simple&context=This%20sentence%20is%20complex%20.&index=4&feedback=0&time=500&userID=224'

content = urllib2.urlopen(url).read()

print content
print

print "*** Test 4.2: DA/LOG sends interaction (syntactic) data from a given user"
url = 'http://localhost:8080/?request_type=send_inter_data&type=syntactic&original_text=This%20is%20a%20very%20complex%20sentence%20and%20it%20is%20not%20possible%20to%20understand%20it%20.&simplified_text=This%20is%20a%20very%20complex%20sentence%20.%20It%20is%20not%20possible%20to%20understand%20it%20.&feedback=0&time=500&userID=224'

content = urllib2.urlopen(url).read()

print content
print

print "*** Test 4.3: DA/LOG sends interaction (elaboration) data from a given user"

url = 'http://localhost:8080/?request_type=send_inter_data&type=elaboration&type_elab=wikipedia&feedback=0&time=500&userID=224'

content = urllib2.urlopen(url).read()

print content
print 

print "*** Test 4.4: DA/LOG sends interaction data (workflow) from a given user"

url = 'http://localhost:8080/?request_type=send_inter_data&type=workflow&feedback=1&time=500&userID=224'

content = urllib2.urlopen(url).read()

print content
print

### Test 5
##TODO: define whether or not TAE/WAE will use token or user ID

print "*** Test 5.1: TAE/WAE requests interaction (syntactic) data from a given user"

url = 'http://localhost:8080/?request_type=request_inter_data&token=94ebd08b-4218-43a0-9ca7-34408f81bb84&inter_type=syntactic'

content = urllib2.urlopen(url).read()

print content
print

print "*** Test 5.2: TAE/WAE requests interaction (elaboration) data from a given user"

url = 'http://localhost:8080/?request_type=request_inter_data&token=94ebd08b-4218-43a0-9ca7-34408f81bb84&inter_type=elaboration'

content = urllib2.urlopen(url).read()

print content
print

print "*** Test 5.3: TAE/WAE requests interaction (lexical) data from a given user"

url = 'http://localhost:8080/?request_type=request_inter_data&token=94ebd08b-4218-43a0-9ca7-34408f81bb84&inter_type=lexical'

content = urllib2.urlopen(url).read()

print content
print

print "*** Test 5.4: TAE/WAE requests interaction (workflow) data from a given user"


url = 'http://localhost:8080/?request_type=request_inter_data&token=94ebd08b-4218-43a0-9ca7-34408f81bb84&inter_type=workflow'

content = urllib2.urlopen(url).read()

print content
print

### Test 6
print "*** Test 6.1: TAE/WAE requests interaction (workflow) data from all users"

url = 'http://localhost:8080/?request_type=request_inter_data_all&inter_type=workflow'

content = urllib2.urlopen(url).read()

print content
print

print "*** Test 6.2: TAE/WAE requests interaction (elaboration) data from all users"

url = 'http://localhost:8080/?request_type=request_inter_data_all&inter_type=elaboration'

content = urllib2.urlopen(url).read()

print content
print

print "*** Test 6.3: TAE/WAE requests interaction (lexical) data from all users"

url = 'http://localhost:8080/?request_type=request_inter_data_all&inter_type=lexical'

content = urllib2.urlopen(url).read()

print content
print

print "*** Test 6.4: TAE/WAE requests interaction (syntactic) data from all users"

url = 'http://localhost:8080/?request_type=request_inter_data_all&inter_type=syntactic'

content = urllib2.urlopen(url).read()

print content
print

print "*** Test 6.5: TAE/WAE requests interaction (all levels) data from all users"

url = 'http://localhost:8080/?request_type=request_inter_data_all&inter_type=%20'

content = urllib2.urlopen(url).read()

print content
print

### Test 7
print "*** Test 7.1: TAE/WAE requests data (both demographic and interaction -- lexical) from a specific user"

url = 'http://localhost:8080/?request_type=request_data&inter_type=lexical&token=94ebd08b-4218-43a0-9ca7-34408f81bb84'

content = urllib2.urlopen(url).read()

print content
print

print "*** Test 7.2: TAE/WAE requests data (both demographic and interaction -- syntactic) from a specific user"

url = 'http://localhost:8080/?request_type=request_data&inter_type=syntactic&token=94ebd08b-4218-43a0-9ca7-34408f81bb84'

content = urllib2.urlopen(url).read()

print content
print

print "*** Test 7.3: TAE/WAE requests data (both demographic and interaction -- elaboration) from a specific user"

url = 'http://localhost:8080/?request_type=request_data&inter_type=elaboration&token=94ebd08b-4218-43a0-9ca7-34408f81bb84'

content = urllib2.urlopen(url).read()

print content
print

print "*** Test 7.4: TAE/WAE requests data (both demographic and interaction -- workflow) from a specific user"

url = 'http://localhost:8080/?request_type=request_data&inter_type=workflow&token=94ebd08b-4218-43a0-9ca7-34408f81bb84'

content = urllib2.urlopen(url).read()

print content
print

print "*** Test 7.5: TAE/WAE requests data (both demographic and interaction -- all) from a specific user"

url = 'http://localhost:8080/?request_type=request_data&inter_type=%20&token=94ebd08b-4218-43a0-9ca7-34408f81bb84'

content = urllib2.urlopen(url).read()

print content
print

### Test 8
print "*** Test 8: TAE/WAE requests demograhic data from all users"

url = 'http://localhost:8080/?request_type=request_demo_data_all'

content = urllib2.urlopen(url).read()

print content
print


### Test 9
print "*** Test 9.1: TAE/WAE requests data (both demographic and interaction -- lexical) from all users"

url = 'http://localhost:8080/?request_type=request_data_all&inter_type=lexical'

content = urllib2.urlopen(url).read()

print content
print

print "*** Test 9.2: TAE/WAE requests data (both demographic and interaction -- syntactic) from all users"

url = 'http://localhost:8080/?request_type=request_data_all&inter_type=syntactic'

content = urllib2.urlopen(url).read()

print content
print

print "*** Test 9.3: TAE/WAE requests data (both demographic and interaction -- elaboration) from all users"

url = 'http://localhost:8080/?request_type=request_data_all&inter_type=elaboration'

content = urllib2.urlopen(url).read()

print content
print

print "*** Test 9.4: TAE/WAE requests data (both demographic and interaction -- workflow) from all users"

url = 'http://localhost:8080/?request_type=request_data_all&inter_type=workflow'

content = urllib2.urlopen(url).read()

print content
print

print "*** Test 9.5: TAE/WAE requests data (both demographic and interaction -- all) from all users"

url = 'http://localhost:8080/?request_type=request_data_all&inter_type=%20'

content = urllib2.urlopen(url).read()

print content
print
