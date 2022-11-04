FROM python:3.12.0a1-alpine3.16

# RUN python3 -m venv .venv
# RUN source .venv/bin/activate
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev
RUN pip install -U pip setuptools wheel
RUN pip install psycopg2-binary
RUN pip install soda-core-postgres==3.0.12
COPY . .

COPY scan.sh /scan.sh

RUN chmod +x /scan.sh

ENTRYPOINT ["/scan.sh"]

