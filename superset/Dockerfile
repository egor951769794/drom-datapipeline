FROM apache/superset:GHA-lean-21777235416

USER root

RUN python -m venv /app/.venv

RUN /app/.venv/bin/pip install psycopg2-binary

COPY superset_config.py /app

USER superset
