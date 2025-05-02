# Windows CMD Command Explorer

![Windows CMD Command Explorer](https://img.shields.io/badge/Windows-CMD%20Explorer-brightgreen)
![Version](https://img.shields.io/badge/Version-1.0-blue)
![License](https://img.shields.io/badge/License-MIT-green)

A comprehensive tool designed to help users navigate, learn, and execute Windows Command Prompt commands through an intuitive interface. This tool organizes hundreds of useful commands into logical categories with a user-friendly menu system.

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Screenshots](#screenshots)
- [Installation](#installation)
- [Usage](#usage)
- [Categories](#categories)
- [Command Reference](#command-reference)
- [System Requirements](#system-requirements)
- [Technical Details](#technical-details)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgments](#acknowledgments)

## 🔍 Overview

Windows CMD Command Explorer is a batch-based utility that simplifies access to Windows command-line tools. Whether you're a beginner learning command-line operations or an experienced administrator looking for a quick reference, this tool provides easy access to commands organized into functional categories with clear descriptions and documentation.

## ✨ Features

- **User-friendly interface** with clear menus and navigation
- **14 command categories** covering all major Windows administrative functions
- **Administrative privilege handling** with automatic elevation requests
- **Comprehensive logging** for troubleshooting and command history
- **Well-documented commands** with descriptions and usage examples
- **Console buffer optimization** for better readability
- **Color-coded interface** for improved user experience
- **Runs on any modern Windows system** (Windows 7 and newer)


## 💻 Installation

1. **Download the repository** as a ZIP file or clone it using Git:
   ```
   git clone https://github.com/Digital-Synergy2024/WindowsCMD.git
   ```

2. **Extract all files** to a location of your choice (e.g., `C:\Users\YourName\Desktop\WindowCMD\`)

3. **Run WindowsCMD.bat** by double-clicking it (administrative privileges will be requested automatically)

No additional installation is required - the tool runs directly from the extracted files.

## 🚀 Usage

1. Launch `WindowsCMD.bat` from the extracted folder
2. Select a category from the main menu by entering the corresponding number
3. Choose a command from the category submenu
4. Follow any prompts to execute the selected command
5. Use the "back" option to return to the main menu or exit the application

## 📁 Categories

### 1. File & Directory Management
Tools for handling files and directories: listing, creating, deleting, copying, moving, and changing attributes.

### 2. Disk & Storage Management
Utilities for disk health, formatting, partitioning, defragmentation, and cleanup.

### 3. Network & Internet Commands
Tools for network troubleshooting, configuration viewing, connectivity testing, and DNS operations.

### 4. System Commands
Access to system information, process management, and system control functions.

### 5. User & Security Management
Commands for user account creation, modification, deletion, and privilege management.

### 6. Power & Battery Management
Tools for power scheme configuration, battery reports, and shutdown options.

### 7. Windows Management
Access to hidden Windows administrative tools and system configuration utilities.

### 8. Advanced & Troubleshooting
Debugging and repair tools for system file integrity, Windows image repair, and driver verification.

### 9. Fun & Hidden Commands
Interesting command prompt tricks, customization options, and visual tools.

### 10. Updates & Maintenance
Windows update management and system maintenance utilities.

### 11. Software Control
Application management, installation, and removal tools.

### 12. Startup & Boot Configuration
System startup configuration and boot settings management.

### 13. Performance & Health Monitoring
Tools for monitoring system performance, resource usage, and health metrics.

### 14. Automation & Scripting
Utilities for task scheduling, script creation, and automation capabilities.

## 🧰 Command Reference

Each category contains specialized commands:

<details>
<summary>File & Directory Management</summary>

- `dir` - List files in current directory
- `cd [path]` - Change directory
- `mkdir [name]` - Create directory
- `rmdir [name]` - Remove directory
- `del [filename]` - Delete file
- `copy [source] [destination]` - Copy files
- `move [source] [destination]` - Move files
- `attrib [filename] +R/-R` - Modify file attributes
</details>

<details>
<summary>Disk & Storage Management</summary>

- `chkdsk C: /f /r` - Check disk for errors
- `diskpart` - Disk partitioning tool
- `format C:` - Format a drive
- `defrag C:` - Defragment a drive
- `cleanmgr` - Disk cleanup utility
</details>

<details>
<summary>Network & Internet Commands</summary>

- `ipconfig /all` - Display network configuration
- `ping [address]` - Test connectivity
- `tracert [address]` - Trace route
- `netstat -an` - View network connections
- `nslookup [website]` - DNS lookup
</details>

<details>
<summary>System Commands</summary>

- `systeminfo` - Display system information
- `tasklist` - View running processes
- `taskkill [PID]` - Terminate a process
- `shutdown /r /t 0` - Restart computer
- `wmic [query]` - Windows Management Instrumentation
</details>

<details>
<summary>Additional Categories</summary>

_Each category contains 3-8 specialized commands with similar level of detail as the examples above._
</details>

## 💾 System Requirements

- Windows 7, 8, 10, or 11
- Administrative privileges (requested automatically)
- 50MB free disk space (for log files)
- Standard Command Prompt capabilities

## 🔧 Technical Details

The Windows CMD Command Explorer is built using:
- Batch script (.bat files)
- PowerShell commands for enhanced functionality
- Windows native commands and utilities
- Administrative privilege elevation via UAC

All commands are executed in their native environment with appropriate permissions. The application creates log files to track usage and for troubleshooting purposes.

## 🤝 Contributing

Contributions to improve Windows CMD Command Explorer are welcome:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

Please ensure your code follows the existing style and includes appropriate documentation.

## 📜 License

Distributed under the MIT License. See `LICENSE` file for more information.

## 👏 Acknowledgments

- Microsoft for the Windows Command Line utility
- The open-source community for inspiration and guidance
- All contributors who have helped improve this tool

---

Created with ❤️ by [Digital-Synergy2024]
