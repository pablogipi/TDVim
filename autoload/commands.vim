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
    command! JustifyHelpHeader :call utils#JustifyHelpHeader()

    " Show/Delete unwanted spaces:
    command -bar -nargs=? ShowUnwantedSpaces call utils#ShowUnwantedSpaces(<args>)
    command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call utils#TrimSpaces()

endfunction
" }}}

" UtilsCommands {{{
" Utility commands
function! commands#UtilsCommands ()
    " Open a new tab with the output of a command.
    command -nargs=+ -complete=command TabCommand call utils#TabCommand(<q-args>)

endfunction
" }}}

" WindowsCommands {{{
" Commands to operate on different windows
function! commands#WindowsCommands ()
    " Open a buffer with an embedded shell
    command! -nargs=? -complete=shellcmd Shell call utils#ShellOpen(<q-args>)
    " Wrapper for browser command.
    command! -nargs=0 Finder NERDTreeToggle
    " Wrapper for instpector
    command! -nargs=0 Inspector TagbarToggle
    " Wrapper for outliner
    command! -nargs=0 Outliner FoldDigestToggle

endfunction
" }}}

" DevelopmentCommands {{{
" Commands to operate on different windows
function! commands#DevelopmentCommands ()
    " Convenient command to see the difference between the current buffer and the
    " file it was loaded from, thus the changes you made.
    command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		\ | wincmd p | diffthis
endfunction
" }}}

" vim: ts=8 ft=vim nowrap fdm=marker
