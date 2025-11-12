#!/bin/bash
# Test the interactive menu without launching Claude Code

set -e

# Build project list
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

# Check if we have any projects
if [ ${#projects[@]} -eq 0 ]; then
    echo "No projects found in ~/Device-Management or ~/Developer/"
    exit 1
fi

# Display menu and get selection
PS3="Select a project: "
select project in "${projects[@]}"; do
    if [ -n "$project" ]; then
        # Get the index of the selected project
        for i in "${!projects[@]}"; do
            if [ "${projects[$i]}" = "$project" ]; then
                selected_path="${paths[$i]}"
                break
            fi
        done

        echo ""
        echo "Would launch Claude Code in: $selected_path"
        echo "Command that would run: cd \"$selected_path\" && claude"
        break
    else
        echo "Invalid selection. Please try again."
    fi
done
