#!/bin/sh

# Usage: $ makeexec [directory] [file_extension]

# VARIABLES
DIRECTORY="${1:?DIRECTORY_WAS_NOT_INFORMED}" # directory to search, current directory is used as fallback
FILE_EXTENSION="${2:-sh}" # py? sh?

# EXECUTION
find "$DIRECTORY" -iname "*.$FILE_EXTENSION" \
									-exec chmod +x {} \;
