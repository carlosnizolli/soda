FROM python:3.12.0a1-alpine3.16

RUN pip install --upgrade pip
RUN pip install soda-core-postgres==3.0.12
COPY . .

COPY scan.sh /scan.sh

RUN chmod +x /scan.sh

ENTRYPOINT ["/scan.sh"]

