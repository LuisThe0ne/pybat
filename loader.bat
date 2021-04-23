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


if exist %systemdrive%\users\%username%\documents\pythonloader\python-%pyver%\python.exe (
    goto start
) else (
    goto wrong
)
:start
echo Launcher for %name%
echo [1]Launch
echo [2]Exit
set asw=0
set /p asw="Please choose: "

if %asw%==1 goto launch
if %asw%==2 goto exit
:launch
%systemdrive%\users\%username%\documents\pythonloader\python-%pyver%\python.exe %systemdrive%\users\%username%\documents\pythonloader\scripts\%filename%

:wrong
echo went wrong
:exit

pause
