FROM python:3.7-alpine

RUN pip install soda-core-postgres==3.0.12
COPY . .

COPY scan.sh /scan.sh

RUN chmod +x /scan.sh

ENTRYPOINT ["/scan.sh"]

