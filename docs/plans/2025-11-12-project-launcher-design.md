# Project Launcher Design

**Date:** 2025-11-12
**Purpose:** Quick launcher for Claude Code in project directories

## Overview

A simple bash script named `ccode` that provides an interactive menu to launch Claude Code in project directories. Zero dependencies, uses only bash built-ins.

## User Experience

1. User types `ccode` in any terminal
2. Script displays numbered list of projects
3. User types a number and presses Enter
4. Claude Code launches in selected directory within the same terminal window

## Project Selection

The script scans two locations:
- `~/Device-Management` (always listed first)
- All directories in `~/Developer/*` (sorted alphabetically)

Display format:
```
Select a project:
1) Device-Management
2) bypass-paywall-clean
3) cageball
4) dnd-compare
...
#?
```

## Technical Implementation

**File Structure:**
```
~/Developer/project-launcher/
├── ccode                       # Main executable script
├── README.md                   # User documentation
└── docs/
    ├── plans/                  # This design doc
    └── package-minimal.md      # Device Management docs
```

**Script Logic:**
1. Build project array: Device-Management first, then Developer projects alphabetically
2. Display menu using bash `select` built-in
3. On selection: `cd` to directory and `exec claude` to launch

**Key Technical Decisions:**
- Use `select` for menu (no dependencies, built into bash)
- Use `exec claude` to replace shell process (stays in same terminal window)
- Simple error handling: invalid selections re-prompt automatically
- Estimated length: 30-40 lines of bash

## Installation

**Method:** Symlink from project to PATH

1. Make script executable: `chmod +x ~/Developer/project-launcher/ccode`
2. Create symlink: `ln -s ~/Developer/project-launcher/ccode /usr/local/bin/ccode`
3. Document in Device Management (5-step workflow)

**Benefits:**
- Script stays in project under version control
- Symlink documented in Device Management
- Easy to edit (changes take effect immediately)
- Easy to remove (delete symlink)

## Device Management Integration

**What gets tracked:**
- Symlink: `/usr/local/bin/ccode`
- Points to: `~/Developer/project-launcher/ccode`
- Category: Development Tools / CLI Utilities
- Installation type: Global (command-line utility)
- Dependencies: None

**Documentation:** Minimal template (simple utility, obvious purpose)

## Future Considerations (YAGNI - not implementing now)

- Recently accessed projects
- Custom ordering
- Project favorites
- Fuzzy search filtering
- Configuration file

Keep it simple. Add features only when actually needed.
