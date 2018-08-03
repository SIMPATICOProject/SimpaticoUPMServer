# SimpaticoUPMServer
UPM Server implementation

## Requirements
- MySQL server (Version 14.14 Distribution 5.7.21) - https://dev.mysql.com/
- Python 2.7 (or older)
- Python libraries: mysql (https://dev.mysql.com/doc/connector-python/en/)
-- It was installed using: `pip install mysql-connector-python-rf`

## Files
- Configuration:

`configurations.txt`: configuration file with servers names, addresses and ports (database options: `upm` - English database; `upm-es` - Spanish database; `upm-it` - Italian database)

- Database dumps @ `sql_dump`:

`upm-dump.sql`: dump of the MySQL UPM database for English

`upm-dump-es.sql`: dump of the MySQL UPM database for Spanish

`upm-dump-it.sql`: dump of the MySQL UPM database for Italian

- UPM server:

`Run_TCP_UPM_Server.py`: TCP UPM server
`Run_HTTP_UPM_Server.py`: TCP HTTP server (main)

- LOG/DA server (simulation):

`Run_Test_UPM-LOG_Server.py`: test adding adaptation data into UPM database (simulates LOG server and interaction with LOG - batches).

## Usage
- Database:

After installing the MySQL server, run the command:

`mysql -u <<username>> -p < upm-dump.sql`

- Code:

Firstly run: 

`python Run_Test_UPM-LOG_Server.py`

This will start the simulated LOG/DA server.

Then run:

`python Run_TCP_UPM_Server.py`

To start the TCP UPM server. 

Finally run:

`python Run_HTTP_UPM_Server.py`

To start the HTTP UPM main server.

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


## Tests

### Test example for the main server @ `tests_main`:

`Test_Main_UPM_Server.py`: contains 9 tests encompassing all functionalities of the main server. 

-- Note for the use of tokens for AAC[https://github.com/SIMPATICOProject/aac]: The first test expects a valid token to be validated by the AAC. We are using the test environment provided by FBK, but this can be changed in the `configurations.txt` file. To test this function, you will need to generate a token using the console token generation also provided by FBK. 

### TCP tests:

- Test examples adding demographic data (simulating interaction with IFE) -- TCP server tests @ `tests_TCP`:

`Test_DemoData_UPM_Server.py`: test adding demographic data into UPM English database (simulates interaction with IFE)

`Test_DemoData_UPM_Server_ES-DB.py`: test adding demographic data into UPM Spanish database (simulates interaction with IFE)

`Test_DemoData_UPM_Server_IT-DB.py`: test adding demographic data into UPM Italian database (simulates interaction with IFE)

- Test examples updating demographic data (simulating interaction with IFE) -- TCP server tests @ `tests_TCP`:

`Test_Update_DemoData_UPM_Server.py`: test updating demographic data into UPM English database (simulates interaction with IFE)

`Test_Update_DemoData_UPM_Server_ES-DB.py`: test updating demographic data into UPM Spanish database (simulates interaction with IFE)

`Test_Update_DemoData_UPM_Server_IT-DB.py`: test updating demographic data into UPM Italian database (simulates interaction with IFE)

- Test examples adding interaction data (simulating interaction with LOG/DA) -- TCP server tests @ `tests_TCP`: 

`Test_InterData_UPM_Server.py`: test adding adaptation data into UPM database (simulates interaction with LOG/DA - single entry)

- Test examples simulating possible requests from TAE/WAE -- TCP server tests @ `tests_TCP`:

`Test_Request_DemoData_UPM_Server.py`: test requesting/receiving demographic data (simulates simple interaction with TAE/WAE)

`Test_Request_InterData_UPM_Server.py`: test requesting/receiving interaction data (simulates simple interaction with TAE/WAE)

`Test_RequestUP_UPM_Server.py`: test requesting/receiving the user profile of a given user (simulates interaction with TAE/WAE, assuming user profile models are already in place)

`Test_RequestUPSQL_UPM_Server.py`: test requesting/receiving a query from the database for a given user (simulates complex interaction with TAE)


