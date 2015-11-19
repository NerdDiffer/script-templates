#!/bin/bash

# A template script for doing something to each sub-directory relative to $PWD
# Some use cases:
# - Populate a new git repo with some files
# - Use conditionals to do things to files in only selected directories

for d in */ ; do
    echo $d
done

ls -R
