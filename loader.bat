@echo off
echo *******************************************
echo * Copyright LuisTheOne PyBat Pythonloader *
echo *******************************************
rem pybat [name] [Python Version] [32-64 bit] [From] [Filename]
set name=%1
set pyver=%2
set pybit=%3
set from=%4
set filename=%5
echo %name%
echo %pyver%
echo %pybit%
echo %from%
echo %filename%

:createscript
if exist %systemdrive%\users\%username%\documents\pythonloader\started.txt (
    goto start
) else (
    goto firststart
)
:start
echo [1]Launch
echo [2]Update
echo [3]Exit
set asw=0
set /p asw="Please choose: "

if %asw%==1 echo 1
if %asw%==2 echo 2
if %asw%==3 echo 3
:firststart
mkdir %systemdrive%\users\%username%\documents\pythonloader
mkdir %systemdrive%\users\%username%\documents\pythonloader\python-%pyver%
powershell Invoke-WebRequest -Uri https://www.python.org/ftp/python/%pyver%/python-%pyver%-embed-%pybit%.zip -Outfile %systemdrive%\users\%username%\documents\pythonloader\python-%pyver%\python-%pyver%.zip
powershell Expand-Archive %systemdrive%\users\%username%\documents\pythonloader\python-%pyver%\python-%pyver%.zip -DestinationPath %systemdrive%\users\%username%\documents\pythonloader\python-%pyver%
del %systemdrive%\users\%username%\documents\pythonloader\python-%pyver%\python-%pyver%.zip
echo started > %systemdrive%\users\%username%\documents\pythonloader\started.txt
powershell Invoke-WebRequest -Uri %from% -Outfile %systemdrive%\users\%username%\documents\pythonloader\scripts\%filename%
cls
echo Completed, please re-open
:exit

pause