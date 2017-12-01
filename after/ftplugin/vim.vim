" File: vim.vim
" Author: Pablo Gimenez <pablogipi@gmail.com>
" Description: VimL language setup for TDVim
" Last Change: June 19, 2012 - 02:41 AM
"

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
