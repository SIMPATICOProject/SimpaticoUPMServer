# SimpaticoUPMServer
UPM Server implementation

## Requirements
- MySQL server (Version 14.14 Distribution 5.7.21) - https://dev.mysql.com/
- Python 2.7 (or older)
- Python libraries: mysql (https://dev.mysql.com/doc/connector-python/en/)
-- I installed using: `pip install mysql-connector-python-rf`

## Files
- Configuration:
`configurations.txt`: configuration file with servers names, addresses and ports (database options: `upm` - English database; `upm-es` - Spanish database; `upm-it` - Italian database)

- upm-dump.sql: dump of the MySQL UPM database for English
- upm-dump-es.sql: dump of the MySQL UPM database for Spanish
- upm-dump-it.sql: dump of the MySQL UPM database for Italian

- Run_TCP_UPM_Server.py: main UPM server

- Test_DemoData_UPM_Server.py: test adding demographic data into UPM English database (simulates interaction with IFE)
- Test_DemoData_UPM_Server_ES-DB.py: test adding demographic data into UPM Spanish database (simulates interaction with IFE)
- Test_DemoData_UPM_Server_IT-DB.py: test adding demographic data into UPM Italian database (simulates interaction with IFE)

- Test_Update_DemoData_UPM_Server.py: test updating demographic data into UPM English database (simulates interaction with IFE)
- Test_Update_DemoData_UPM_Server_ES-DB.py: test updating demographic data into UPM Spanish database (simulates interaction with IFE)
- Test_Update_DemoData_UPM_Server_IT-DB.py: test updating demographic data into UPM Italian database (simulates interaction with IFE)

- Test_InterData_UPM_Server.py: test adding adaptation data into UPM database (simulates interaction with LOG - single entry)
- Test_InterData_UPM-LOG_Server.py: test adding adaptation data into UPM database (simulates LOG server and interaction with LOG - batches)

- Test_Request_DemoData_UPM_Server.py: test requesting/receiving demographic data (simulates simple interaction with TAE/WAE)
- Test_Request_InterData_UPM_Server.py: test requesting/receiving interaction data (simulates simple interaction with TAE/WAE)
- Test_RequestUP_UPM_Server.py: test requesting/receiving the user profile of a given user (simulates interaction with TAE/WAE, assuming user profile models are already in place)
- Test_RequestUPSQL_UPM_Server.py: test requesting/receiving a query from the database for a given user (simulates complex interaction with TAE)

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

## Quickstart with docker

1. Set configurations
```
docker-configs/configurations.txt
docker-configs/upm-db.env
```

2. Run

```
sudo docker-compose up
```
