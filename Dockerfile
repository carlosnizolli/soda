FROM ubuntu:20.04

LABEL maintainer="Carlos Nizolli carlosnizolli@gmail.com - Soda core scan"

RUN  apt-get update 
RUN  apt-get upgrade -y
RUN  apt-get install -y python3-pip 

RUN pip install soda-core-postgres==3.0.17
RUN pip install soda-core-athena==3.0.17
RUN pip install soda-core-scientific==3.0.17
COPY . .

COPY scan.sh /scan.sh

RUN chmod +x /scan.sh

ENTRYPOINT ["/scan.sh"]

