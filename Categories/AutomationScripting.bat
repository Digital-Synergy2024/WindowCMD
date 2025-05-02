@echo off

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

cd /d "%~dp0"

set LOGFILE=%~dp0AutomationScripting.log
if not exist %LOGFILE% echo Log initialized on %date% %time% > %LOGFILE%

powershell -Command "& { $host.UI.RawUI.BufferSize = New-Object Management.Automation.Host.Size(100, 300) }"

cls
echo =======================================================
echo I                                                     I
echo I             "Automation & Scripting"                I
echo I                                                     I
echo =======================================================
echo I "Automate tasks and create scripts:"                I
echo I --------------------------------------------------- I
echo I "[1] schtasks /create         - Create a new task"  I
echo I "[2] schtasks /delete         - Delete a task"      I
echo I "[3] powershell               - Open PowerShell"    I
echo I "[4] notepad [script.bat]     - Create/edit a"      I
echo I      "batch script"                                 I
echo =======================================================
echo I                                                     I
echo I "Use the corresponding number to execute a command" I
echo I "or type [back] to return:"                         I
echo I                                                     I
echo =======================================================

:menu
set /p choice=Enter your selection (1-4 or back): 
echo Debug: User input received in AutomationScripting: %choice% >> %LOGFILE%
if "%choice%"=="back" exit
if "%choice%"=="1" schtasks /create
if "%choice%"=="2" schtasks /delete
if "%choice%"=="3" powershell
if "%choice%"=="4" notepad script.bat
if "%choice%"=="" goto menu
echo Invalid input. Please try again. >> %LOGFILE%
goto menu