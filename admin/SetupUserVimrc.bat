::
:: Install TDVim´s vimrc
::
:: Check if user already has a vimrc and a myvimrc
:: If there is already a myvimrc then copy vimrc template with backup
:: If there arent any myvimrc then copy existing vimrc as myvimrc and 
:: copy myvimrc as template
::

@echo off
setlocal enableextensions

set SCRIPTDIR=%~dp0
set CUR=%CD%
cd %SCRIPTDIR%
cd ..
:: Now at TDVim install dir
set VIMRC=%CD%\templates\vimrc
set MYVIMRC=%CD%\templates\myvimrc

::No vimrc
set NOVIMRC=0
set NOMYVIMRC=0
if exist %USERPROFILE%\_vimrc (
    echo User's vimrc found. Copy TDVim's vimrc saving backup of current one
    copy /Y %USERPROFILE%\_vimrc %USERPROFILE%\_vimrc.bak 
)
echo Update _vimrc ...
echo Copy myvimrc template into _myvimrc.template
copy /Y %VIMRC% %USERPROFILE%\_vimrc
copy /Y %MYVIMRC% %USERPROFILE%\_myvimrc.template



REM if not exist %USERPROFILE%\_vimrc (
    REM echo Couldn't find any vimrc. Copying TDVim's base vimrc and myvimrc
    REM copy %VIMRC% %USERPROFILE%\_vimrc
    REM copy %MYVIMRC% %USERPROFILE%\_myvimrc
REM ) else (
    REM find "TDVIMROOT" %USERPROFILE%\_vimrc >NUL
    REM if ERRORLEVEL 1 (
        REM echo User's vimrc found. Copy TDVim's vimrc saving backup of current one
        REM echo User's vimrc copy as _myvimrc, TDVim's users vimrc
        REM copy /Y %USERPROFILE%\_vimrc %USERPROFILE%\_vimrc.bak 
        REM copy /Y %VIMRC% %USERPROFILE%\_vimrc
        REM copy /Y %USERPROFILE%\_vimrc.bak %USERPROFILE%\_myvimrc
        REM copy /Y %MYVIMRC% %USERPROFILE%\_myvimrc.template
    REM ) else (
        REM echo TDVim's vimrc found. Only copy myvimrc template
        REM copy /Y %MYVIMRC% %USERPROFILE%\_myvimrc.template
        REM if not exist  %USERPROFILE%\_myvimrc (
            REM echo Use _myvimrc template as initial _myvimrc
            REM copy /Y %MYVIMRC% %USERPROFILE%\_myvimrc
        REM )
    REM )
REM )

:: Check for %USERPROFILE%\vimfiles
if not exist %USERPROFILE%\vimfiles\ (
	echo "Create user vimfiles folder"
	mkdir %USERPROFILE%\vimfiles
)


echo TDVim's vimrc should be now in %USERPROFILE%\_vimrc
echo User's vimrc is in %USERPROFILE%\_myvimrc
echo User's vimrc template is in %USERPROFILE%\_myvimrc.template

pause

cd %CUR%

