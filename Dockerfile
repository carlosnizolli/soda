FROM ubuntu:20.04

LABEL maintainer="Carlos Nizolli carlosnizolli@gmail.com - Soda core scan"
ENV TZ=America/Sao_Paulo

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
	apt-get upgrade -y

RUN	apt-get install -y unixodbc unixodbc-dev

RUN apt-get install -y alien \
		dpkg-dev \
		debhelper \
		build-essential

RUN apt-get install -y python3-pip 
RUN apt-get --yes install wget

RUN pip install pyodbc

RUN wget https://download.dremio.com/arrow-flight-sql-odbc-driver/0.9.0/arrow-flight-sql-odbc-driver-0.9.0.116-1.x86_64.rpm -P /tmp/ 

RUN alien -i /tmp/arrow-flight-sql-odbc-driver-0.9.0.116-1.x86_64.rpm 

RUN rm /tmp/arrow-flight-sql-odbc-driver-0.9.0.116-1.x86_64.rpm 

RUN pip install soda-core-dremio==3.0.13

COPY . .

COPY scan.sh /scan.sh

RUN chmod +x /scan.sh

ENTRYPOINT ["/scan.sh"]

