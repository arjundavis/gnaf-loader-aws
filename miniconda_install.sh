#!/bin/bash

# This is taken from anaconda, if not working use the specific one for your instance
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh

# Check if the directory exists
if [[ -d ~/miniconda3 ]]; then
    echo "Miniconda directory exists."
else
    echo "Miniconda directory does not exist."
    exit 1
fi

# Check if conda command is available
if ~/miniconda3/bin/conda --version &> /dev/null; then
    echo "Conda command is available."
else
    echo "Conda command is not available."
    exit 1
fi

# Optionally, check the version of Miniconda installed
CONDA_VERSION=$(~/miniconda3/bin/conda --version)
if [[ $? -eq 0 ]]; then
    echo "Miniconda installed successfully. Version: $CONDA_VERSION"
else
    echo "Failed to retrieve Miniconda version."
    exit 1
fi

echo "All tests passed."