:: Setup dev environment for neovim config
::
@echo off

:: Point to our dev env
set XDG_CONFIG_HOME=c:\dev
set XDG_DATA_HOME=c:\dev

:: Add macro to use vi as nvim and gvim as nvim-qt
doskey vi=nvim $*
doskey gvim=nvim-qt $*
doskey gv=nvim-qt $*

:: Set nvim as default editor
set EDITOR=nvim
set VISUAL=nvim
set GIT_EDITOR=nvim

