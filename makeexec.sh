#!/bin/sh

#usage makeexec [filetype]

find . -type f -name "*$1" -exec chmod +x {} \; 
