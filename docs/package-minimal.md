# ccode (Claude Code Project Launcher)

**Installed:** 2025-11-12
**Version:** 1.0.0
**Source:** Manual (symlink to project)
**Category:** Development

## Purpose
Quick launcher for Claude Code that displays an interactive menu of project directories. Type `ccode` in any terminal to select and launch Claude Code in your Device-Management or Developer projects.

## Installation
```bash
# Make script executable
chmod +x ~/Developer/project-launcher/ccode

# Create symlink to PATH
ln -s ~/Developer/project-launcher/ccode /usr/local/bin/ccode
```

## Removal
```bash
# Remove symlink
rm /usr/local/bin/ccode
```

**Impact:** Cannot use `ccode` command to launch Claude Code. Script remains in project folder for reinstallation.

## Installation Notes
- Zero dependencies - uses bash built-ins only
- Script stays in project under version control
- Symlink tracked in Device Management system
- Always shows Device-Management first, then Developer projects alphabetically
