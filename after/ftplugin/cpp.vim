" File: cpp.vim
" Author: Pablo Gimenez <pablogipi@gmail.com>
" Description: C/C++ language setup for TDVim
" Last Change: June 19, 2012 - 02:41 AM
"

" We want to keep comments within an 80 column limit, but not code.
" These two options give us that
setlocal formatoptions=crq
setlocal textwidth=80

" Highlight strings inside C comments
let c_comment_strings=1

" Folding
setlocal foldmethod=indent

" Enable spelling, only used for comments
set spell

" Enable show information about tags in preview window
set completeopt+=preview

" Increment default preview window height
set previewheight=10

" VimCompletesMe
let b:vcm_tab_complete = "omni"

"
" Keymaps
"
" Switch to alternate buffer
nnoremap  <silent> <buffer> <C-F3>		    :FSHere<CR>
vnoremap  <silent> <buffer> <C-F3>		    <Esc>:FSHere<CR>
inoremap  <silent> <buffer> <C-F3>		    <Esc>:FSHere<CR>
