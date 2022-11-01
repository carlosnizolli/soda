FROM python:3.7-alpine

RUN pip install soda-sql-postgresql
COPY . .

COPY scan.sh /scan.sh

RUN chmod +x /scan.sh

ENTRYPOINT ["/scan.sh"]

