#!/bin/bash

# Show help if --help is passed
if [[ "$1" == "--help" ]]; then
  echo "Usage: $0 [options] search_string filename"
  echo "Options:"
  echo "  -n  Show line numbers"
  echo "  -v  Invert match (show non-matching lines)"
  exit 0
fi

# Check if enough arguments are passed
if [ $# -lt 2 ]; then
  echo "Usage: $0 [options] search_string filename"
  exit 1
fi

OPTIONS=""
SEARCH=""
FILE=""

# Parse options
if [[ "$1" == -* ]]; then
  OPTIONS="$1"
  SEARCH="$2"
  FILE="$3"
else
  SEARCH="$1"
  FILE="$2"
fi

# Validate inputs
if [ -z "$SEARCH" ] || [ -z "$FILE" ]; then
  echo "Error: Missing search string or filename."
  echo "Usage: $0 [options] search_string filename"
  exit 1
fi

if [ ! -f "$FILE" ]; then
  echo "Error: File '$FILE' not found."
  exit 1
fi

# Read file line by line
LINE_NUM=0
while IFS= read -r line || [ -n "$line" ]; do
  LINE_NUM=$((LINE_NUM + 1))

  # Case-insensitive comparison
  if [[ "${line,,}" == *"${SEARCH,,}"* ]]; then
    MATCH=1
  else
    MATCH=0
  fi

  # Handle -v option (invert match)
  if [[ "$OPTIONS" == *v* ]]; then
    MATCH=$((1 - MATCH))
  fi

  if [ $MATCH -eq 1 ]; then
    if [[ "$OPTIONS" == *n* ]]; then
      echo "${LINE_NUM}:$line"
    else
      echo "$line"
    fi
  fi
done < "$FILE"
