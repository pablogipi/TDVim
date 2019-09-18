" Autocommands Vim setup file
"
" Manteiner:	Pablo Gimenez <pablogipi@gmail.com>
" Last change:	2012 May 1
"
"

" XXX: DEPRECATED

" Autocommands {{{
" Setup autocommands. Call to functions that creates autocommands groups
function! autocmd#Autocommands()
    call autocmd#AfterStartup()
    call autocmd#AfterBufferRead()
    call autocmd#BufEnter()
    "call autocmd#BufLeave()
    "call autocmd#BufWinEnter()
    "call autocmd#BufWinLeave()
    "call autocmd#FileTypes()
    "call autocmd#SessionLoadPost()
endfunction
" }}}

" AfterStartup {{{
" Auto commands after vim has started
function! autocmd#AfterStartup()
    augroup vimStartup
	"au VimEnter * call utils#SourceUserSettings()
	"au ColorScheme * call utils#updateStatusLineColors()
    augroup END
endfunction
" }}}

" AfterBufferRead {{{
" Auto commands after the buffer has been read
function! autocmd#AfterBufferRead()
    augroup afterBufferRead
        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        autocmd BufRead *
                    \ if line("'\"") > 0 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif
        " Change local path to the folder containing the current buffer:
        autocmd BufRead * call utils#SetLocalPath()
    augroup END
endfunction
" }}}

" BufEnter {{{
" When entering a buffer
function! autocmd#BufEnter()
    augroup bufEnter
        " Set local path to path of current file"
        autocmd BufEnter * call utils#SetLocalPath()
        " TODO: add autocommand that calls to function that setups NERDTree
        " keymaps to close the window
        autocmd BufEnter NERD_tree_* call utils#SetupNERDTreeBuffer()

    augroup END
endfunction
" }}}

" BufLeave {{{
" When leaving a buffer
function! autocmd#BufLeave()
    augroup bufLeave
    augroup END
endfunction
" }}}

" BufWinEnter {{{
" Autocommands for the BufWinEnter event.
" Triggers when entering a window for a given buffer
function! autocmd#BufWinEnter()
    augroup bufWinEnter
        " Restore window display status, including folds state
        "au BufWinEnter * silent! loadview
    augroup END
endf
" }}}

" BufWinLeave {{{
" Autocommands for the BufWinLeave event.
" Triggers when leaveing a window for a given buffer
function! autocmd#BufWinLeave()
    augroup bufWinLeave
        " Save window display status, including folds state
        "au BufWinLeave * silent! mkview
    augroup END
endf
" }}}

" FileTypes {{{
" Autocommands to be executed when acertain filetype is laoded
" It will create an autocommand for every file type supported in TDVim.
" This autocommand will call to the Autocommands function in the corresponding
" autocommand file.
" XXX: Review this I think I can use Vim ftypes mechanism
function! autocmd#FileTypes()
    let ft_addons = { 
                \'python' : 'tdvimPython',
                \'cpp' : 'tdvimCpp',
                \'qf' : 'tdvimQf',
                \'vim': 'tdvimVim' 
                \}
    for t in keys(ft_addons)
        let cmd = 'au FileType ' . t . ' call ' . ft_addons[t] . '#Autocommands()'
        "echomsg "Enable autocommand for filetype: " . cmd
        exe(cmd)
    endfor
endfunction
" }}}

" SessionLoadPost {{{
" Commands to be executed after session load.
" Used to correctly setup vim after session load 
function! autocmd#SessionLoadPost()
    augroup sessionLoadPost
        " Save window display status, including folds state
    augroup END
endf
" }}}


" vim: ts=8 ft=vim nowrap fdm=marker
