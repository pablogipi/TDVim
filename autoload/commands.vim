" Custom commands Vim setup file
"
" Manteiner:	Pablo Gimenez <pablogipi@gmail.com>
" Last change:	2012 May 11
"
"

" InitCommands {{{
" Init commands
function! commands#InitCommands()
    call commands#EditCommands()
    call commands#UtilsCommands()
    call commands#WindowsCommands()
    call commands#DevelopmentCommands()
endfunction
" }}}

" Edit Commands {{{
" Edit commands
" Commands used for editing text
function! commands#EditCommands ()
    " Command to justify a help line for vim docs
    "command! JustifyHelpHeader :call utils#JustifyHelpHeader()

    " Show/Delete unwanted spaces:
    " DEPRECATED:
    "command -bar -nargs=? TdvimShowUnwantedSpaces call utils#ShowUnwantedSpaces(<args>)
    command -bar -nargs=0 -range=% TdvimTrimSpaces <line1>,<line2>call utils#TrimSpaces()
    command -bar -nargs=1 TdvimSearch call utils#SearchAndResults(<f-args>)
    " DEPRECATED:
    "command -bar -nargs=1 TdvimAck call utils#AckWrapper(<f-args>)

endfunction
" }}}

" UtilsCommands {{{
" Utility commands
function! commands#UtilsCommands ()
    " Open a new tab with the output of a command.
    command -nargs=+ -complete=command TdvimTabCommand call utils#TabCommand(<f-args>)
    "  Insert time stamp
    command -bar -nargs=0 TdvimTimeStamp call utils#InsertTimestamp( 2, "a" )

endfunction
" }}}

" WindowsCommands {{{
" Commands to operate on different windows
function! commands#WindowsCommands ()
    " Open a buffer with an embedded shell
    "command! -nargs=? -complete=shellcmd Shell call utils#ShellOpen(<q-args>)
    " Wrapper for browser command.
    command! -nargs=0 TdvimFinder NERDTreeToggle
    "command! -nargs=0 TdvimFinder call utils#ToggleVExplorer()
    " Wrapper for instpector
    command! -nargs=0 TdvimInspector TagbarToggle
    " Wrapper for outliner
    "command! -nargs=0 Outliner FoldDigestToggle
    " Delete buffer without deleting window
    "command TdvimBufferDelete bp | sp | bn | bd
    command TdvimBufferDelete bp | sp | bn | bw
    " Close all windows of a certain type
    command! -nargs=1 -complete=filetype TdvimCloseWindowType call utils#CloseAllWindowsByType(<f-args>  )


endfunction
" }}}

" DevelopmentCommands {{{
" Commands to operate on different windows
function! commands#DevelopmentCommands ()
    " Convenient command to see the difference between the current buffer and the
    " file it was loaded from, thus the changes you made.
    command! TdvimDiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		\ | wincmd p | diffthis

    command! TdvimCscope call utils#TdvimCscope()

    "command! -nargs=* TdvimMake make <args> | cwindow 10 | call utils#MoveQuickfixBottom( ) | cc
    command! -nargs=* TdvimMake make <args> | cwindow 10 | cc | setlocal cursorline

endfunction
" }}}

" FZF{{{
"command! FZFTags call utils#FZFTags()
" }}}

" vim: ts=8 ft=vim nowrap fdm=marker
