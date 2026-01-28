FROM python:3.12.12-slim-bookworm

WORKDIR /kafka-consumer

COPY kafka-consumer/requirements.txt .
RUN pip install -r requirements.txt --no-cache-dir

COPY kafka-consumer/main.py .
COPY kafka-consumer/misc/constants.py .

CMD [ "python3", "-u", "./main.py" ]
