FROM ubuntu:20.04

LABEL maintainer="Carlos Nizolli carlosnizolli@gmail.com - Soda core scan"

RUN apt-get update 
RUN apt-get upgrade -y
RUN apt-get install -y python3-pip 
RUN apt-get --yes install unixodbc-dev
RUN sudo apt-get install alien

RUN wget https://download.dremio.com/arrow-flight-sql-odbc-driver/arrow-flight-sql-odbc-driver-LATEST.x86_64.rpm -P /tmp/ && \
       alien -i /tmp/arrow-flight-sql-odbc-driver-LATEST.x86_64.rpm && \
       rm /tmp/arrow-flight-sql-odbc-driver-LATEST.x86_64.rpm

RUN pip install soda-core-dremio==3.0.10

COPY . .

COPY scan.sh /scan.sh

RUN chmod +x /scan.sh

ENTRYPOINT ["/scan.sh"]

