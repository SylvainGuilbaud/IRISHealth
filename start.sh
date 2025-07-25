#!/bin/bash
source .env
if [ -z "$ISC_DATA_DIRECTORY" ]; then
    echo "Error: ISC_DATA_DIRECTORY is not set."
    exit 1
fi
# Create the directory chain specified by $ISC_DATA_DIRECTORY if it does not exist
mkdir -p "$ISC_DATA_DIRECTORY"
# Change permissions to rwxrwxrwx (777) for ./InterSystems directory and all its subdirectories
chmod -R 777 "$ISC_DATA_DIRECTORY"

# Launch containers in detached mode using Docker Compose
docker compose up -