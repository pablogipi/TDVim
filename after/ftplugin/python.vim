" File: python.vim
" Author: Pablo Gimenez <pablogipi@gmail.com>
" Description: Python language setup for TDVim
" Last Change: September 12, 2021 - 19:02 PM.
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
augroup tdvim_python
    " Autosave
    autocmd CursorHold *.py update
    autocmd FileType python setlocal indentkeys-=<:>
    autocmd FileType python setlocal indentkeys-=:
    autocmd FileType python setlocal indentkeys+==else
augroup END
" Set autocommand to set current tag on cursor hold
:autocmd CursorHold *.py ++nested call utils#UpdateCurrentTag()
" Test highlight word under cursor...
":au! CursorHold *.py ++nested call utils#HighlightWordUnderCursor()
"nnoremap <leader>* :<C-u>let @/ = expand('<cword>')<cr> 

" Identation:
"set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class


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

" 
" Alignements
let g:easy_align_delimiters['i'] = { 'pattern': ' import ',  'left_margin': 0, 'right_margin': 0, 'stick_to_left': 0 }
let g:easy_align_delimiters['a'] = { 'pattern': ' as ',  'left_margin': 0, 'right_margin': 0, 'stick_to_left': 0 }
