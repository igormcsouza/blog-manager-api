#!/bin/bash

# Define absolute paths
BASE_DIR="$(pwd)"
VENV_DIR="$BASE_DIR/venv"
REQUIREMENTS_FILE="$BASE_DIR/requirements.txt"
API_ZIP="$BASE_DIR/blog-manager-api.zip"

# Export requirements
poetry export > "$REQUIREMENTS_FILE"

# Create and activate virtual environment
python -m venv "$VENV_DIR" && source "$VENV_DIR/bin/activate" && pip3 install -r "$REQUIREMENTS_FILE"

# Zip packages and models
cd "$VENV_DIR/lib/python3.11/site-packages" && zip -r9 "$API_ZIP" .
cd "$BASE_DIR/source" && zip -g "$API_ZIP" -r .

# Remove virtual environment
rm -rf "$VENV_DIR"
rm -f "$BASE_DIR/requirements.txt"