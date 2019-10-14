#!/bin/sh

# Usage makeexec [filetype] [directory]

# VARIABLES
TYPE="$1"
DIRECTORY="$2"

# TESTS
[ -z "$TYPE" -o -z "$DIRECTORY" ] && echo "Usage makeexec [filetype] [directory]" && exit 1 # Is null?
[ ! -d "$DIRECTORY" ] && echo "Directory does not exist." && exit 1

# EXECUTION
find "$DIRECTORY" -iname "*.$TYPE"  \
									-exec chmod +x {} \;
