#!/bin/bash

# File path for the models list
MODELS_FILE="/root/models.txt"

# Check if the models file exists
if [[ ! -f "$MODELS_FILE" ]]; then
    echo "Models file $MODELS_FILE not found!"
    exit 1
fi

# Read the models file line by line
while IFS= read -r line; do
    # Skip empty lines or lines starting with a comment (#)
    if [[ -z "$line" || "$line" =~ ^# ]]; then
        continue
    fi

    # Pull the model using the ollama CLI
    echo "Running: ollama pull $line"
    /bin/ollama pull "$line"
done < "$MODELS_FILE"

echo "All models processed."
