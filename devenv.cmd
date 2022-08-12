:: Setup dev environment for neovim config
::
@echo off

:: Point to our dev env
set XDG_CONFIG_HOME=c:\dev
set XDG_DATA_HOME=c:\dev

:: Path to latest NeoVim
set PATH=C:\opt\nvim_06\bin;%PATH%
