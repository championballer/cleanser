#!/bin/sh

if [ -d sub_folder ]; then
	echo folder exists
else 
	echo folder does not exist
fi

current=hello.png

if [[ $current == *.png ]]; then
	echo matched $current
else 
	echo unmatched
fi

for current in *; do
	if [[ $current = *.txt ]]; then

		if [ -d txt ]; then
			mv "$current" txt
		else
			mkdir txt
			mv "$current" txt	
		fi
	fi
done


# Build a list of file extensions 
exts=($(ls | sed 's/^.*\.//' | sort -u))

# Loop through these extensions moving files into subdirectories
for ext in "${exts[@]}"; do
	mkdir $ext
	mv -v *.$ext $ext/
done
