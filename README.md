# Project Launcher (ccode)

Quick launcher for Claude Code in project directories.

## What it does

Type `ccode` in any terminal to get an interactive menu of your projects. Select a project and Claude Code launches in that directory within the same terminal window.

## Usage

```bash
ccode
```

You'll see a numbered list:
```
Select a project:
1) Device-Management
2) bypass-paywall-clean
3) cageball
...
#?
```

Type a number and press Enter. Claude Code launches in the selected directory.

Press Ctrl+C to cancel.

## How it works

The script scans two locations:
- `~/Device-Management` (always listed first)
- All directories in `~/Developer/*` (sorted alphabetically)

It uses bash's built-in `select` command for the menu - no external dependencies required.

## Installation

1. Make the script executable:
   ```bash
   chmod +x ~/Developer/project-launcher/ccode
   ```

2. Create a symlink to your PATH:
   ```bash
   ln -s ~/Developer/project-launcher/ccode /usr/local/bin/ccode
   ```

3. Test it:
   ```bash
   ccode
   ```

The script stays in this project folder under version control, while the symlink makes it accessible from anywhere.

## Uninstallation

Remove the symlink:
```bash
rm /usr/local/bin/ccode
```

The script remains in this project folder if you want to reinstall later.

## Technical Details

- **Language:** Bash
- **Dependencies:** None (uses bash built-ins only)
- **Size:** ~45 lines
- **Compatible with:** macOS, Linux

## Development

Test the project list without interaction:
```bash
./test-cc.sh
```

Test the interactive menu without launching Claude:
```bash
./test-menu.sh
```
