#! /usr/bin/bash

grep -o "\S*" $1 | sed 's/[[:punct:]]$//' | grep 'ing$' > output.txt
