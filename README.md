# SimpaticoUPMServer
UPM Server implementation

## Requirements
- MySQL server (Version 14.14 Distribution 5.7.21) - https://dev.mysql.com/
- Python 2.7 (or older)
- Python libraries: mysql (https://dev.mysql.com/doc/connector-python/en/)

## Files
- configurations.txt: configuration file with servers names, addresses and ports
- upm-dump.sql: dump of the MySQL UPM database
- Run_TCP_UPM_Server.py: main UPM server
- Test_DemoData_UPM_Server.py: test adding demographic data into UPM database (simulates interaction with IFE)
- Test_InterData_UPM_Server.py: test adding adaptation data into UPM database (simulates interaction with LOG - single entry)
- Test_InterData_UPM-LOG_Server.py: test adding adaptation data into UPM database (simulates LOG server and interaction with LOG - batches)
- Test_RequestUP_UPM_Server.py: test request the user profile of a given user (simulates simple interaction with TAE/WAE)
- Test_RequestUPSQL_UPM_Server.py: test request a query from the database for a given user (simulates complex interaction with TAE)

## Usage
- Database:
After installing the MySQL server, run the command:

`mysql -u <<username>> -p < upm-dump.sql`

- Code:
Firstly run: 

`python Test_InterData_UPM-LOG_Server.py`

This will start the simulated LOG server.

Then run:

`python Run_TCP_UPM_Server.py`

To start the UPM server. After this, the other test files can be executed.


