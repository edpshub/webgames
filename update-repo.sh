#!/bin/bash

REPO_DIR="/home/alpha2/alpha2_raspi"
cd $REPO_DIR

inotifywait -m -r -e modify,create,delete $REPO_DIR | while read path action file; do
    echo "Detected $action on $file. Committing changes..."
    git add .
    git commit -m "Automated commit: $action on $file"
    git push origin main
done
