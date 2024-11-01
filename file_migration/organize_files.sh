#!/bin/bash

# Check if input file is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <path_to_csv_file>"
    exit 1
fi

CSV_FILE="$1"

# Check if the CSV file exists
if [ ! -f "$CSV_FILE" ]; then
    echo "File not found: $CSV_FILE"
    exit 1
fi

# Define the source and destination directories
SOURCE_DIR="properties_original"
DEST_DIR="properties_organized"

# Read the CSV file line by line
while IFS=',' read -r doc_name folder_path; do
    # Skip the header line
    if [[ "$doc_name" == "doc_link" ]]; then
        continue
    fi
    
    # Create the folder path if it doesn't exist
    mkdir -p "$DEST_DIR/$folder_path"
    
    # Construct the full path to the source file
    SOURCE_FILE="$SOURCE_DIR/$doc_name"
    
    # Move the file to the designated folder
    if [ -f "$SOURCE_FILE" ]; then
        mv "$SOURCE_FILE" "$DEST_DIR/$folder_path/"
        echo "Moved $SOURCE_FILE to $DEST_DIR/$folder_path/"
    else
        echo "File not found: $SOURCE_FILE"
    fi
done < "$CSV_FILE"

