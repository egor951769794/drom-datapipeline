FROM apache/spark:3.5.8-scala2.12-java11-python3-r-ubuntu


WORKDIR /opt/spark/work-dir

USER root

COPY requirements.txt .
RUN pip install -r requirements.txt --no-cache-dir --user

COPY spark_schema_creator.py .
COPY misc/constants.py .

CMD ["python3", "spark_schema_creator.py"]
# ENTRYPOINT ["tail", "-f", "/dev/null"]
