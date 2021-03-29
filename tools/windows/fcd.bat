::
:: Wrapper around fzf to implement fuzzy cd
::

@echo off

::for /f %%i in ('sed -rn "s/^\ +export\ +HOUDINI_MAJOR_RELEASE=([0-9]+)$/\1/p" %SETUP_SCRIPT%') do set HOUDINI_MAJOR_RELEASE=%%i
::for /f %%i in ('fd -td -d4 ^| fzf') do echo %%i 
for /f %%i in ('fd -td . %1 ^| fzf') do cd %%i 
