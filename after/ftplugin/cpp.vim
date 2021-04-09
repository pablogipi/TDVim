" File: cpp.vim
" Author: Pablo Gimenez <pablogipi@gmail.com>
" Description: C/C++ language setup for TDVim
" Last Change: April 09, 2021 - 16:37 PM.
"

" We want to keep comments within an 80 column limit, but not code.
" These two options give us that
setlocal formatoptions=crq
setlocal textwidth=80

" Highlight strings inside C comments
let c_comment_strings=1

" Folding
"setlocal foldmethod=indent
setlocal foldmethod=syntax

" Enable spelling, only used for comments
set spell

" Enable show information about tags in preview window
set completeopt+=preview

" iskeyword for C/C++
setlocal iskeyword=a-z,A-Z,48-57,_

" Autocommands
augroup tdvim_cpp
    " Set autocommand to set current tag on cursor hold
    autocmd! CursorHold *.cpp,*.c, *.h,*.hpp,*.C ++nested call utils#UpdateCurrentTag()
augroup END

" Increment default preview window height
set previewheight=10

" VimCompletesMe
let b:vcm_tab_complete = "omni"

"
" Keymaps
"
" Switch to alternate buffer
"nnoremap  <silent> <buffer> <C-F3>		    :FSHere<CR>
"vnoremap  <silent> <buffer> <C-F3>		    <Esc>:FSHere<CR>
"inoremap  <silent> <buffer> <C-F3>		    <Esc>:FSHere<CR>
silent! nunmap <C-F3>
silent! vunmap <C-F3>
silent! iunmap <C-F3>
nmap  <silent> <buffer> <C-F3>		    :FSHere<CR>
vmap  <silent> <buffer> <C-F3>		    <Esc>:FSHere<CR>
imap  <silent> <buffer> <C-F3>		    <Esc>:FSHere<CR>
