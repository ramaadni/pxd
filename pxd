#!/bin/bash

# File to store the API key
API_KEY_FILE="$HOME/.pixeldrain_api_key"

# Function to request API key
request_api_key() {
    read -sp "Enter your API key: " API_KEY
    echo
    echo $API_KEY > $API_KEY_FILE
    chmod 600 $API_KEY_FILE
}

# Check if the API key already exists
if [ ! -f $API_KEY_FILE ]; then
    echo "API key not found. Please enter your API key."
    request_api_key
fi

# Read the API key from the file
API_KEY=$(cat $API_KEY_FILE)

# Ensure the file name is provided as an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <file_name>"
    exit 1
fi

FILE_NAME=$1

# Display a separator line before the upload process
echo "============================="
echo "Starting file upload process..."

# Execute the curl command and capture the response
RESPONSE=$(curl --progress-bar -T "$FILE_NAME" -u :$API_KEY https://pixeldrain.com/api/file/)

# Check the upload status
if [ $? -eq 0 ]; then
    # Display a separator line after a successful upload
    echo "File uploaded successfully."
    echo "============================="

    # Display the link to the uploaded file using jq
    FILE_ID=$(echo $RESPONSE | jq -r '.id')
    echo "You can access your file at: https://pixeldrain.com/u/$FILE_ID"
else
    # Display a separator line after a failed upload
    echo "Failed to upload the file."
    echo "============================="
fi
