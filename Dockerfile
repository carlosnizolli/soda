FROM python:3.7-alpine

RUN apt-get install g++ unixodbc-dev python3-dev libssl-dev libffi-dev
RUN pip install soda-sql-postgresql
COPY . .

COPY scan.sh /scan.sh

RUN chmod +x /scan.sh

ENTRYPOINT ["/scan.sh"]
