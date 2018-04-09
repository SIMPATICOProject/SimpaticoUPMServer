FROM python:2.7.14-alpine3.7

WORKDIR /app

ADD . /app

COPY docker-configs/configurations.txt .
RUN pip install mysql-connector-python-rf

CMD python Test_InterData_UPM-LOG_Server.py & python Run_TCP_UPM_Server.py
