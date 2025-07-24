#!/bin/bash
# cleanDS_Store.sh
# This script finds and removes .DS_Store and iris.lck files in the current directory and its subdirectories.
find . -name .DS_Store 
find . -name .DS_Store | xargs rm -f
