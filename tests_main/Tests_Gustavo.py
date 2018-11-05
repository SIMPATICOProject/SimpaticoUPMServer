import urllib2

port = '9090'
token = '17468ffc-870b-4ee8-ba7c-3cd36de90241'

### Test 3
print "*** Test 3: TAE/WAE requests demographic data"

url = 'http://localhost:'+port+'/?request_type=request_demo_data&token='+token

content = urllib2.urlopen(url).read()

print content
print

print "*** Test 5.3: TAE/WAE requests interaction (lexical) data from a given user"

url = 'http://localhost:'+port+'/?request_type=request_inter_data&token='+token+'&inter_type=lexical'

content = urllib2.urlopen(url).read()

print content
print

print "*** Test 6.3: TAE/WAE requests interaction (lexical) data from all users"

url = 'http://localhost:'+port+'/?request_type=request_inter_data_all&inter_type=lexical'

content = urllib2.urlopen(url).read()

print content
print

### Test 8
print "*** Test 8: TAE/WAE requests demograhic data from all users"

url = 'http://localhost:'+port+'/?request_type=request_demo_data_all'

content = urllib2.urlopen(url).read()

print content
print


