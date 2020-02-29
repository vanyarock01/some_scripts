#!/bin/bash

# script to search for a file between all branches of the repository

if [ -z "$1" ]; then
    echo "file name required"  
    exit 0
fi
start_branch=$(git rev-parse --abbrev-ref HEAD)
( git branch -r | grep origin/* | tail -n+2 ) | while read -r branch; do
    git checkout --quiet ${branch##*/} >> /dev/null
    finded=$(find . -name "$1")
    if [ -n "$finded" ]; then
        echo -e "\e[1;32m* Found:\e[0m [$finded] on branch [$branch]"
    fi
done
git checkout $start_branch