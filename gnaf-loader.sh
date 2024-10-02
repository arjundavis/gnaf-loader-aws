#!/bin/bash

# Define variables for paths and credentials
GNAF_TABLES_PATH="gnafGDA94/G-NAF"
ADMIN_BDYS_PATH="adminbdrys" 

read -sp "Enter your custom PostgreSQL password for the 'postgres' user: " PG_PASSWORD
echo

PGDB="gnaf"
PGUSER="postgres"

# Run the Python script with the defined variables
python3 loader_code/load-gnaf.py \
  --gnaf-tables-path="$GNAF_TABLES_PATH" \
  --admin-bdys-path="$ADMIN_BDYS_PATH" \
  --pgdb="$PGDB" \
  --pguser="$PGUSER" \
  --max-processes=1 \
  --pgpassword="$PGPASSWORD" \
  --prevacuum 
  # --pghost="database-1.$$$$$$$$.rds.amazonaws.com" if using rds. 

