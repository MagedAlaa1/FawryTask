#!/bin/bash

if [[ "$1" == "--help" ]]; then
  echo "Usage: $0 [options] search_string filename"
  echo "Options:"
  echo "  -n  Show line numbers"
  echo "  -v  Invert match (show non-matching lines)"
  exit 0
fi

if [ $# -lt 2 ]; then
  echo "Usage: $0 [options] search_string filename"
  exit 1
fi

OPTIONS=""
SEARCH=""
FILE=""

if [[ "$1" == -* ]]; then
  OPTIONS="$1"
  SEARCH="$2"
  FILE="$3"
else
  SEARCH="$1"
  FILE="$2"
fi

if [ -z "$SEARCH" ] || [ -z "$FILE" ]; then
  echo "Error: Missing search string or filename."
  echo "Usage: $0 [options] search_string filename"
  exit 1
fi

if [ ! -f "$FILE" ]; then
  echo "Error: File '$FILE' not found."
  exit 1
fi

GREP_OPTIONS="-i"

if [[ "$OPTIONS" == *n* ]]; then
  GREP_OPTIONS="$GREP_OPTIONS -n"
fi

if [[ "$OPTIONS" == *v* ]]; then
  GREP_OPTIONS="$GREP_OPTIONS -v"
fi

grep $GREP_OPTIONS -- "$SEARCH" "$FILE"

