# gnaf-loader-aws
How to set up gnaf-loader on postgres db on an AWS EC2 instance or RDS

What is G-NAF? Geocoded National Address File : i.e. Information about addresses in Australia. 

n.b. This contains a git submodule of the [repository](https://github.com/minus34/gnaf-loader) kindly provided by Hugh Salmaans. This repo is just an extension to his work, with a description of how to run his repo on an EC2 instance. 

# AWS EC2 selection
Pick an EC2 instance with minimum 16GB ram (use this [website](https://instances.vantage.sh/)).
Add a storage drive with sufficient space. ~50 to 60GB. 

Boot it up and connect via ssh or through the aws terminal. 

# Install miniconda and make a python environment with psycopg
You can run the miniconda_install.sh script to install the latest version. Then in a new terminal make a new conda environment and install psycopg. 
```bash
conda create -n gnaf
conda activate gnaf
conda install psycopg2
```

# Install postgres-db with postgis
Run the bash script provided with sudo privliges on the EC2 to install the postgres and add postgis. 
Then it will add a new database and create a new user with a password of your choice. 

# Download two sets of zip files from data.gov.au

Admin boundary data along with the G-NAF are required to be downloaded for the G-NAF loader. 
These files can be downloaded in GDA94 or GDA2020 project or if using AUG24 files can run the script. 

Download latest [Admin boundaries here](https://data.gov.au/dataset/geoscape-administrative-boundaries)
Download latest [G-NAF files here](https://data.gov.au/dataset/geocoded-national-address-file-g-naf)

After they are downloaded, change the permissions on the downloaded and unzipped directories so that postgres can use it. 
```bash
chown -R postgres:postgres adminbdrys
chmod -R 755 adminbdrys

chown -R postgres:postgres gnafGDA94
chmod -R 755 gnafGDA94
```

# PG tune 
After setting up the postgresDB, tune the postgreSQL database using this [website](https://pgtune.leopard.in.ua/)
Full instructions are there. To summarise, input your memory, postgres version etc. and update your postgres configuration file or use PSQL and paste the ALTER SYSTEM commands into the terminal. 

For AWS EC2, use data warehouse. 

<img width="550" alt="pgtune image" src="https://github.com/user-attachments/assets/b5fef8a7-d989-4e5b-8e68-2195db353b5c">

