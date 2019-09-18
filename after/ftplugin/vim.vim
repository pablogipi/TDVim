" File: vim.vim
" Author: Pablo Gimenez <pablogipi@gmail.com>
" Description: VimL language setup for TDVim
" Last Change: September 06, 2019 - 01:00 AM.
"

" DEPRECATED: using this file to setup autocommands and events is DEPRECATED.
" vimrc is used instead.

" Setup for indending
setlocal smartindent

" Folds
setlocal foldmethod=marker

" VimCompletesMe
let b:vcm_tab_complete = "vim"

" Enable show information about tags in preview window
set completeopt+=preview

" Increment default preview window height
set previewheight=10

" Autocommands
augroup tdvim_vim
    " Delete any extra white space at the end of the line before writing the file
    autocmd BufWritePre *.vim normal m`:%s/\s\+$//e ``
augroup END
