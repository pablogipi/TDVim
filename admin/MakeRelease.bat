::
:: Make Windows Release Script
::
:: Pack release and create Windows installer using Inno Setup
::

@echo off
setlocal enableextensions

set SCRIPTDIR=%~dp0
set CUR=%CD%

:: Assume this location for InnoSetup
set INNOPATH=\apps\InnoSetup5
:: Assume this script is run from a subfolder in the TDVim project
cd %SCRIPTDIR%
cd ..
set TDVIMDIR=%CD%
cd admin
set INNOSCRIPT=%CD%\"TDvim.iss"

if not exist %INNOPATH% (
    echo Couldn't find path to Inno Setup. Path doesn't exist: %INNOPATH%
    exit /b
)
if not exist %INNOSCRIPT% (
    echo Couldn't find Inno Setup script in: %INNOSCRIPT%
    exit /b
)
if "%~1" == "" ( 
    echo Script needs to provide release version
    echo Example:
    echo %0 0.2
    exit /b
)

:: Cleanup
cd %TDVIMDIR%
echo Cleanup files ...
del /S *~ *.swp
del /S /A:H *.swp

:: Compile Inno Setup Script
echo
echo Build installer from %INNOSCRIPT%
echo
%INNOPATH%\ISCC.exe /DMyAppVersion="%~1" %INNOSCRIPT%
