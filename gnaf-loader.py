# Testing with python script instead

import getpass
import subprocess

# Define variables for paths and credentials
GNAF_TABLES_PATH = "gnafGDA94/G-NAF"
ADMIN_BDYS_PATH = "adminbdrys"

# Prompt for PostgreSQL password
PG_PASSWORD = getpass.getpass("Enter your custom PostgreSQL password for the 'postgres' user: ")

PGDB = "gnaf"
PGUSER = "postgres"

# Define the command to run the Python script with the defined variables
command = [
    "python3", "loader_code/load-gnaf.py",
    "--gnaf-tables-path", GNAF_TABLES_PATH,
    "--admin-bdys-path", ADMIN_BDYS_PATH,
    "--pgdb", PGDB,
    "--pguser", PGUSER,
    "--pgpassword", PG_PASSWORD,
    "--prevacuum"
    # "--pghost", "database-1.$$$$$$$$.rds.amazonaws.com"  # Uncomment if using RDS with your specific endpoint
]

# Run the command
subprocess.run(command)