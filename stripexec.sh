#!/bin/sh

#usage stripexec [filetype]

type=$1

for file in $(ls | grep $type$); do
	chmod -x $file
done
