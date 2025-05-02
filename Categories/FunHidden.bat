@echo off

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

cd /d "%~dp0"

set LOGFILE=%~dp0FunHidden.log
if not exist %LOGFILE% echo Log initialized on %date% %time% > %LOGFILE%

powershell -Command "& { $host.UI.RawUI.BufferSize = New-Object Management.Automation.Host.Size(100, 300) }"

cls
echo =======================================================
echo I                                                     I
echo I             "Fun & Hidden Commands"                 I
echo I                                                     I
echo =======================================================
echo I "Try cool tricks and fun utilities:"                I
echo I --------------------------------------------------- I
echo I "[1] color 0A    - Change CMD color"                I
echo I "[2] title [text] - Modify CMD window title"        I
echo I "[3] echo [text] - Display custom text"             I
echo I "[4] tree        - Graphical representation of"     I
echo I      "directories"                                  I
echo I "[5] cls         - Clear CMD screen"                I
echo =======================================================
echo I                                                     I
echo I "Use the corresponding number to execute a command" I
echo I "or type [back] to return:"                         I
echo I                                                     I
echo =======================================================

:menu
set /p choice=Enter your selection (1-5 or back):
set choice=%choice: =%  :: Trim spaces
echo Debug: User input received in FunHidden: %choice% >> %LOGFILE%
if "%choice%"=="back" exit
if "%choice%"=="1" color 0A
if "%choice%"=="2" title Fun Hidden Commands
if "%choice%"=="3" echo Enter your custom text: & set /p text= & echo %text%
if "%choice%"=="4" tree
if "%choice%"=="5" cls
if "%choice%"=="" goto menu
echo Invalid input. Please try again. >> %LOGFILE%
goto menu