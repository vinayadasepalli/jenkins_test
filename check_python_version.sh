#!/bin/bash

# Directory to store results
RESULT_DIR="python_version_results"
mkdir -p $RESULT_DIR

# Run the check 10 times
for i in {1..10}
do
    PYTHON_VERSION=$(python3 --version 2>&1)
    TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
    FILE_NAME="$RESULT_DIR/result_$i.txt"
    echo "Run $i at $TIMESTAMP: $PYTHON_VERSION" > $FILE_NAME
    sleep 1
done

# Git configuration
git config --global user.name "vinayadasepalli"
git config --global user.email "vinay.dasepalli@gmail.com"

# Push results to GitHub
git add $RESULT_DIR
git commit -m "Add python version results at $(date)"
git push origin main

