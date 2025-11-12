#!/bin/bash
# Test script to verify project list without interactive menu

projects=()
paths=()

# Add Device-Management first
if [ -d "$HOME/Device-Management" ]; then
    projects+=("Device-Management")
    paths+=("$HOME/Device-Management")
fi

# Add Developer projects alphabetically
if [ -d "$HOME/Developer" ]; then
    while IFS= read -r dir; do
        project_name=$(basename "$dir")
        projects+=("$project_name")
        paths+=("$dir")
    done < <(find "$HOME/Developer" -mindepth 1 -maxdepth 1 -type d | sort)
fi

# Display what would be shown
echo "Projects that would be listed:"
echo "=============================="
for i in "${!projects[@]}"; do
    num=$((i + 1))
    echo "$num) ${projects[$i]}"
    echo "   Path: ${paths[$i]}"
done
