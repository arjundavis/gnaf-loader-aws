# gnaf-loader-aws
How to set up gnaf-loader on postgres db on an AWS EC2 instance or RDS

# AWS EC2 selection
Pick an EC2 instance with minimum 16GB ram (use this [website](https://instances.vantage.sh/)). Boot it up and connect

# Install postgres-db with postgis
Run the bash script. 

# Download zip files from data.gov.au

These files can be downloaded in GDA94 or GDA2020 project

Download latest [Admin boundaries here](https://data.gov.au/dataset/geoscape-administrative-boundaries)
Download latest [https://data.gov.au/dataset/geocoded-national-address-file-g-naf)

https://data.gov.au/dataset/ds-dga-19432f89-dc3a-4ef3-b943-5326ef1dbecc/details)



# PG tune 
After setting up the postgresDB, tune the postgreSQL database using this [website](https://pgtune.leopard.in.ua/)
Full instructions are there, but I would use PSQL and paste the ALTER SYSTEM commands into the terminal. 

For AWS EC2, use data warehouse. 

<img width="550" alt="pgtune image" src="https://github.com/user-attachments/assets/b5fef8a7-d989-4e5b-8e68-2195db353b5c">

