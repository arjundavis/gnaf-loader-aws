#!/bin/bash
# This script downloads the files. n.b. please update the URLs as shown in the readme if GDA2020 or newer version is required.


# URLs of the files to download
gnafURL="https://data.gov.au/data/dataset/19432f89-dc3a-4ef3-b943-5326ef1dbecc/resource/d7bb4fbe-6a54-432b-b164-ec4f42732a08/download/g-naf_aug24_allstates_gda94_psv_1016.zip"
adminbdrysURL="https://data.gov.au/data/dataset/bdcf5b09-89bc-47ec-9281-6b8e9ee147aa/resource/ae917daa-9291-4534-b97f-0d6e39ed215b/download/aug24_adminbounds_gda_94_shp.zip"

if ! command -v unzip &> /dev/null; then
    echo "unzip could not be found, installing..."
    sudo apt update
    sudo apt install -y unzip
fi

# Download the files in parallel
wget $gnafURL &
wget $adminbdrysURL &

# Wait for all background jobs to complete
wait

# Check if the files exist before unzipping
if [[ -f "aug24_adminbounds_gda_94_shp.zip" ]]; then
    unzip aug24_adminbounds_gda_94_shp.zip -d adminbdrys
else
    echo "File aug24_adminbounds_gda_94_shp.zip not found!"
    exit 1
fi

if [[ -f "g-naf_aug24_allstates_gda94_psv_1016.zip" ]]; then
    unzip g-naf_aug24_allstates_gda94_psv_1016.zip -d gnafGDA94
else
    echo "File g-naf_aug24_allstates_gda94_psv_1016.zip not found!"
    exit 1
fi