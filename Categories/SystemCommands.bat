@echo off

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

cd /d "%~dp0"

set LOGFILE=%~dp0SystemCommands.log
if not exist %LOGFILE% echo Log initialized on %date% %time% > %LOGFILE%

powershell -Command "& { $host.UI.RawUI.BufferSize = New-Object Management.Automation.Host.Size(100, 300) }"

cls
echo =======================================================
echo I                                                     I
echo I                "System Commands"                    I
echo I                                                     I
echo =======================================================
echo I "Manage system information and processes:"          I
echo I --------------------------------------------------- I
echo I "[1] systeminfo             - Display system"       I
echo I      "information"                                  I
echo I "[2] tasklist               - List running"         I
echo I      "processes"                                    I
echo I "[3] taskkill [PID]         - Kill a process by"    I
echo I      "PID"                                          I
echo I "[4] shutdown /r /t 0       - Restart the"          I
echo I      "computer"                                     I
echo I "[5] wmic [query]           - Windows Management"   I
echo I      "Instrumentation"                              I
echo =======================================================
echo I                                                     I
echo I "Use the corresponding number to execute a command" I
echo I "or type [back] to return:"                         I
echo I                                                     I
echo =======================================================

:menu
set /p choice=Enter your selection (1-5 or back): 
echo Debug: User input received in SystemCommands: %choice% >> %LOGFILE%
if "%choice%"=="back" exit
if "%choice%"=="1" systeminfo
if "%choice%"=="2" tasklist
if "%choice%"=="3" taskkill
if "%choice%"=="4" shutdown /r /t 0
if "%choice%"=="5" wmic
if "%choice%"=="" goto menu
echo Invalid input. Please try again. >> %LOGFILE%
goto menu