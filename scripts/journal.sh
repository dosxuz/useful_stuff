#!/bin/bash

# Set journal directory
JOURNAL_DIR="$HOME/Journal"

# Get current date and day in required format (e.g. 02_Sep_25-Tue.md)
FILENAME="$(date +'%d_%b_%y-%a').md"

# Full path of the file
FILEPATH="$JOURNAL_DIR/$FILENAME"

# Create journal directory if it doesn't exist
mkdir -p "$JOURNAL_DIR"

# Check if file already exists
if [ -e "$FILEPATH" ]; then
    echo "File already exists: $FILEPATH"
else
    touch "$FILEPATH"
    echo "Created file: $FILEPATH"
fi

