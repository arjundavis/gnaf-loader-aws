#!/bin/bash

# Run this with sudo

read -sp "Enter your custom PostgreSQL password for the 'postgres' user: " POSTGRES_PASSWORD
echo

# Prompt for PostgreSQL version
read -sp "Enter the version of PostgreSQL you would like (13, 14, 15, 16, 17): " PG_VERSION
echo

# Validate PostgreSQL version
if [[ ! "$PG_VERSION" =~ ^(13|14|15|16|17)$ ]]; then
    echo "Invalid PostgreSQL version. Please enter one of the following versions: 13, 14, 15, 16, 17."
    exit 1
fi

# echo "The PostgreSQL password is: $POSTGRES_PASSWORD"
echo "Selected PostgreSQL version: $PG_VERSION"


apt update
apt upgrade -y

apt install -y postgresql-$PG_VERSION postgresql-$PG_VERSION-postgis-3 postgis

sudo -i -u postgres bash << EOF
psql -c "ALTER USER postgres PASSWORD '$POSTGRES_PASSWORD';"
psql -c "CREATE DATABASE gnaf;"
psql -c "ALTER DATABASE gnaf SET search_path=public,postgis,contrib;"
psql -d gnaf -c "CREATE EXTENSION postgis;"
psql -d gnaf -c "SELECT postgis_full_version();"
EOF