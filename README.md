# gnaf-loader-aws
## Overview
This guide explains how to set up the G-NAF loader on a PostgreSQL database hosted on an AWS EC2 instance or RDS.

### What is G-NAF?
The Geocoded National Address File (G-NAF) contains information about addresses in Australia. You can read more about it [here](https://data.gov.au/dataset/geocoded-national-address-file-g-naf).

**Note:** This repository includes a git submodule of the [gnaf-loader repository](https://github.com/minus34/gnaf-loader) kindly provided by Hugh Salmaans. This repo extends his work with instructions on running it on an EC2 instance.

## AWS EC2 Selection
1. **Instance Selection**: Choose an EC2 instance with at least 16GB of RAM. You can use this [website](https://instances.vantage.sh/) to help with the selection.
2. **Storage**: Add a storage drive with around 50GB to 60GB of space.
3. **Connection**: Boot up the instance and connect via SSH or through the AWS terminal.

## Install Miniconda and Create a Python Environment with psycopg
1. **Run the Miniconda Install Script**: Use the provided `miniconda_install.sh` script to install the latest version of Miniconda.
    ```bash
    chmod +x miniconda_install.sh
    ./miniconda_install.sh
    ```
2. **Create a Conda Environment**: In a new terminal, create a new Conda environment and install `psycopg2`.
    ```bash
    conda create -n gnaf
    conda activate gnaf
    conda install psycopg2
    ```
    
## Install PostgreSQL with PostGIS
1. **Run the Bash Script**: Execute the provided bash script with sudo privileges on the EC2 instance to install PostgreSQL and PostGIS. The script will also create a new database and user with a password of your choice.
2. **Verify Installation**: The bash script should return the PostGIS version upon successful execution.


#
## Download Required Data from data.gov.au
1. **Admin Boundary Data**: Download the latest [Admin boundaries here](https://data.gov.au/dataset/geoscape-administrative-boundaries).
2. **G-NAF Files**: Download the latest [G-NAF files here](https://data.gov.au/dataset/geocoded-national-address-file-g-naf).

After downloading, change the permissions on the downloaded and unzipped directories so that PostgreSQL can access them:
```bash
chown -R postgres:postgres adminbdrys
chmod -R 755 adminbdrys

chown -R postgres:postgres gnafGDA94
chmod -R 755 gnafGDA94
```

## PG Tune
After setting up the PostgreSQL database, tune it using this [website](https://pgtune.leopard.in.ua/). Full instructions are available on their website. To summarize, input your memory, PostgreSQL version, etc., and update your PostgreSQL configuration file or use PSQL and paste the `ALTER SYSTEM` commands into the terminal.

For AWS EC2, select the "data warehouse" option.

![pgtune image](https://github.com/user-attachments/assets/b5fef8a7-d989-4e5b-8e68-2195db353b5c)

## Finally, Run the G-NAF Loader Script
```bash
conda activate gnaf
python gnaf-loader.py

