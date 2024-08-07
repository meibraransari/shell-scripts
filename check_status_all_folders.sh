#!/bin/bash
# Loop through each directory
for dir in */; do
    # Change to the directory
    cd "$dir" || continue

    # Check if it's a git repository
    if [ -d ".git" ]; then
        echo "#=== Checking Status in $dir ===#"
        echo ""
        # Show only changed files
        git status --porcelain | grep -E '^[ MARCUD]' | sed 's/^...//'
    else
        echo "$dir is not a git repository"
    fi

    # Change back to the parent directory
    cd ..
done
