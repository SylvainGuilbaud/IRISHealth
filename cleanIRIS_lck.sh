#!/bin/bash
# cleanIRIS_lck.sh
# This script finds and removes iris.lck files in the current directory and its subdirectories.
find . -name iris.lck 
find . -name iris.lck | xargs rm -f
