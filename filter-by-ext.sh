#!/bin/bash

# Generate a list of files with a matching extension within all sub-directories
# relative to your `pwd`.
# http://stackoverflow.com/a/9353205/2908123

EXT=$1
FILES=$(find -type f -name "*.$EXT")

echo $FILES
