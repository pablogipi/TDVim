" File: vimrc
" Author: Pablo Gimenez <pablogipi@gmail.com>
" Description: Minimal Vim setup used to run TDVim
" Last Change: June 19, 2012 - 02:19 AM
"
" You should have a proper TDVim setup to use this file.
" Refer to the installation docs in the Wiki about how to install
" TDVim in your system
"
" Set the runtime path to use look first into the TDVim distribution directory
" Sources the main TDVim startup file
" Finally tries to source the user vim configuration.
"
" So to setup TDVim you just only need to setup properly an environment
" variable called TDVIMROOT, which should point to the directory that contains
" the TDVim release.
" The user config usually is this same file $HOME/.vimrc, in UNIX, so to allow
" the user to make her/his own setup this script will try to load a file
" called .myvimrc in UNIX or _myvimrc in Windows.
"
" TDVim credits:
" Pablo Gimenez <pablogipi@gmail.com>: project founder and main developer
" Bram Moolenaar <Bram@vim.org>: VIM founder and main developer
"
"
"

" Minimum setup for pathogen and derivates:
syntax on
filetype plugin indent on

if exists("$TDVIMROOT")
    " Only load TDVim and VAM if cetain criteria is sathisfied
    "if (v:version >= 800)
	if (v:version >= 800 && (has('python') || has('python3')))
		let s:tdvimroot = substitute($TDVIMROOT, "\\", "/", "g")
        "Add TDVim to runtim path
        execute "set rtp^=" . s:tdvimroot
        execute "set rtp+=" . s:tdvimroot . "/after"

        " TODO: detectg wheter or not we  are in neovim or vim and load
        " init.vim or vimrc
        " Load TDVim !!
        "let s:loadScriptPath =  $TDVIMROOT . "/init.vim"
		let s:loadScriptPath =  s:tdvimroot . "/init.vim"
        exec "source " . s:loadScriptPath
        "echomsg "TDVim " . s:tdvimroot . " loaded"
    else
        echohl ErrorMsg
        echoerr "TDVim needs at least VIM v8 with Python support"
        echohl Normal
    endif
else
    echohl ErrorMsg
    echoerr "TDVIMROOT not defined.Please set an environment variable called TDVIMROOT to the TDVim install location"
    echohl Normal
endif

" vim: ts=8 ft=vim nowrap fdm=marker ff=unix
