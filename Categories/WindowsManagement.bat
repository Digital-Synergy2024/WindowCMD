@echo off

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

cd /d "%~dp0"

set LOGFILE=%~dp0WindowsManagement.log
if not exist %LOGFILE% echo Log initialized on %date% %time% > %LOGFILE%

powershell -Command "& { $host.UI.RawUI.BufferSize = New-Object Management.Automation.Host.Size(100, 300) }"

cls
echo =======================================================
echo I                                                     I
echo I                "Windows Management"                 I
echo I                                                     I
echo =======================================================
echo I "Access hidden Windows tools and settings:"         I
echo I --------------------------------------------------- I
echo I "[1] control                - Open Control Panel"   I
echo I "[2] msconfig               - Open System"          I
echo I      "Configuration"                                I
echo I "[3] regedit                - Open Registry"        I
echo I      "Editor"                                       I
echo I "[4] eventvwr               - Open Event Viewer"    I
echo I "[5] taskmgr                - Open Task Manager"    I
echo =======================================================
echo I                                                     I
echo I "Use the corresponding number to execute a command" I
echo I "or type [back] to return:"                         I
echo I                                                     I
echo =======================================================

:menu
set /p choice=Enter your selection (1-5 or back): 
echo Debug: User input received in WindowsManagement: %choice% >> %LOGFILE%
if "%choice%"=="back" exit
if "%choice%"=="1" control
if "%choice%"=="2" msconfig
if "%choice%"=="3" regedit
if "%choice%"=="4" eventvwr
if "%choice%"=="5" taskmgr
if "%choice%"=="" goto menu
echo Invalid input. Please try again. >> %LOGFILE%
goto menu