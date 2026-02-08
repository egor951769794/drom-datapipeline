#!/bin/bash

pg_dump -U superset -d superset --no-owner --no-privileges --clean --if-exists > /docker-entrypoint-initdb.d/01-superset_dump.sql

echo -e "Superset metadata dumped successfully. It will load with next container startup."
