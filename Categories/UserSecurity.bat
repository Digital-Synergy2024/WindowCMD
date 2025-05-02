@echo off

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

cd /d "%~dp0"

set LOGFILE=%~dp0UserSecurity.log
if not exist %LOGFILE% echo Log initialized on %date% %time% > %LOGFILE%

powershell -Command "& { $host.UI.RawUI.BufferSize = New-Object Management.Automation.Host.Size(100, 300) }"

cls
echo =======================================================
echo I                                                     I
echo I             "User & Security Management"            I
echo I                                                     I
echo =======================================================
echo I "Manage user accounts and security settings:"       I
echo I --------------------------------------------------- I
echo I "[1] net user               - List user accounts"   I
echo I "[2] net user [username]    - View user details"    I
echo I "[3] net user [username] /add - Add a new user"     I
echo I "[4] net user [username] /delete - Delete a user"   I
echo I "[5] net localgroup administrators [username] /add" I
echo I      "- Add user to admin group"                    I
echo =======================================================
echo I                                                     I
echo I "Use the corresponding number to execute a command" I
echo I "or type [back] to return:"                         I
echo I                                                     I
echo =======================================================

:menu
set /p choice=Enter your selection (1-5 or back): 
echo Debug: User input received in UserSecurity: %choice% >> %LOGFILE%
if "%choice%"=="back" exit
if "%choice%"=="1" net user
if "%choice%"=="2" net user
if "%choice%"=="3" net user /add
if "%choice%"=="4" net user /delete
if "%choice%"=="5" net localgroup administrators /add
if "%choice%"=="" goto menu
echo Invalid input. Please try again. >> %LOGFILE%
goto menu