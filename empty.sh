#!/bin/sh

#find empty files in current director
find  -type f -empty -delete

#find empty directories in current directory
find  -type d -empty -delete