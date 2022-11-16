FROM ubuntu:20.04

LABEL maintainer="Carlos Nizolli carlosnizolli@gmail.com - Soda core scan"

RUN  apt-get update 
RUN  apt-get upgrade -y
RUN  apt-get install -y python3-pip 
RUN  apt-get --yes install unixodbc-dev

RUN pip install soda-core-dremio==3.0.10

COPY . .

COPY scan.sh /scan.sh

RUN chmod +x /scan.sh

ENTRYPOINT ["/scan.sh"]

