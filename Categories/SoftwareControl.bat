@echo off

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

cd /d "%~dp0"

set LOGFILE=%~dp0SoftwareControl.log
if not exist %LOGFILE% echo Log initialized on %date% %time% > %LOGFILE%

powershell -Command "& { $host.UI.RawUI.BufferSize = New-Object Management.Automation.Host.Size(100, 300) }"

cls
echo =======================================================
echo I                                                     I
echo I                "Software Control"                   I
echo I                                                     I
echo =======================================================
echo I "Manage installed software and applications:"       I
echo I --------------------------------------------------- I
echo I "[1] appwiz.cpl              - Open Programs and"   I
echo I      "Features"                                     I
echo I "[2] winget list             - List installed"      I
echo I      "software (requires Winget)"                   I
echo I "[3] winget uninstall [name] - Uninstall software"  I
echo I      "(requires Winget)"                            I
echo =======================================================
echo I                                                     I
echo I "Use the corresponding number to execute a command" I
echo I "or type [back] to return:"                         I
echo I                                                     I
echo =======================================================

:menu
set /p choice=Enter your selection (1-3 or back): 
echo Debug: User input received in SoftwareControl: %choice% >> %LOGFILE%
if "%choice%"=="back" exit
if "%choice%"=="1" appwiz.cpl
if "%choice%"=="2" winget list
if "%choice%"=="3" winget uninstall
if "%choice%"=="" goto menu
echo Invalid input. Please try again. >> %LOGFILE%
goto menu