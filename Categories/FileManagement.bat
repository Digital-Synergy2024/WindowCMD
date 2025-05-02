@echo off

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

cd /d "%~dp0"

set LOGFILE=%~dp0FileManagement.log
if not exist %LOGFILE% echo Log initialized on %date% %time% > %LOGFILE%

powershell -Command "& { $host.UI.RawUI.BufferSize = New-Object Management.Automation.Host.Size(100, 300) }"

cls
echo =======================================================
echo I                                                     I
echo I          "File & Directory Management"              I
echo I                                                     I
echo =======================================================
echo I "Manage files and folders efficiently:"             I
echo I --------------------------------------------------- I
echo I "[1] dir                  - View files in a"        I
echo I      "directory"                                    I
echo I "[2] cd [path]            - Change the current"     I
echo I      "directory"                                    I
echo I "[3] mkdir [name]         - Create a new folder"    I
echo I "[4] rmdir [name]         - Delete a folder"        I
echo I "[5] del [filename]       - Delete a specific"      I
echo I      "file"                                         I
echo I "[6] copy [source] [destination] - Copy files"      I
echo I "[7] move [source] [destination] - Move files"      I
echo I "[8] attrib [filename] +R/-R  - Modify file"        I
echo I      "attributes"                                   I
echo =======================================================
echo I                                                     I
echo I "Use the corresponding number to execute a command" I
echo I "or type [back] to return:"                         I
echo I                                                     I
echo =======================================================

:menu
set /p choice=Enter your selection (1-8 or back): 
echo Debug: User input received in FileManagement: %choice% >> %LOGFILE%
if "%choice%"=="back" exit
if "%choice%"=="1" dir
if "%choice%"=="2" cd
if "%choice%"=="3" mkdir
if "%choice%"=="4" rmdir
if "%choice%"=="5" del
if "%choice%"=="6" copy
if "%choice%"=="7" move
if "%choice%"=="8" attrib
if "%choice%"=="" goto menu
echo Invalid input. Please try again. >> %LOGFILE%
goto menu