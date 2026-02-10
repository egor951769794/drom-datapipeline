#!/bin/bash

echo -e "Executing all .sql scripts found in folder /update_db/..."

for file in /update_db/*.sql; do
  
    echo "Executing script $file"

    psql -U user -d dwh -f $file
done

echo -e "Done"
