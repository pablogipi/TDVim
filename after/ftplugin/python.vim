" File: python.vim
" Author: Pablo Gimenez <pablogipi@gmail.com>
" Description: Python language setup for TDVim
" Last Change: April 20, 2021 - 23:53 PM.
"

" XXX: Some test settings to see if we can speed up syntax and folding
" Enable lazyredraw to speed things
set lazyredraw
" https://www.chunkhang.com/blog/slow-syntax-highlighting-in-vim
set regexpengine=1

" Enable syntax highlight errors
let python_highlight_all=1

" Enable spelling, only used for comments
set spell

" We want to keep comments within an 80 column limit, but not code.
" These two options give us that
setlocal formatoptions=crq
setlocal textwidth=80

" iskeyword for Python
"setlocal iskeyword+=.,_

" Set compiler to pylint for errorand syntax  checking:
"autocmd FileType python compiler pylint

" Autocommands
"augroup tdvim_python
" Set autocommand to set current tag on cursor hold
:au! CursorHold *.py ++nested call utils#UpdateCurrentTag()
"augroup END
" Test highlight word under cursor...
":au! CursorHold *.py ++nested call utils#HighlightWordUnderCursor()
"nnoremap <leader>* :<C-u>let @/ = expand('<cword>')<cr> 


"
" Abbreviations
" Multiline comment with three single quotes
iabbrev '' '''

"
" Keymaps
"
" Change omnicomplete for Python, force using tag completion instead
"silent! iunmap   <C-Space>
"imap    <silent> <buffer> <C-Space> <C-x><C-]>
" Set S-F11 to run syntax checker
silent! nunmap   <S-F11>
nmap    <silent> <buffer> <C-S-F11> :call flake8#Flake8()<CR>

silent! unmap   ]]
silent! unmap   ][
silent! unmap   []
silent! unmap   [[

map <buffer> ]] <Plug>(PythonsenseStartOfNextPythonFunction)
map <buffer> ][ <Plug>(PythonsenseEndOfPythonFunction)
map <buffer> [] <Plug>(PythonsenseStartOfPythonFunction)
map <buffer> [[ <Plug>(PythonsenseEndOfPreviousPythonFunction)
