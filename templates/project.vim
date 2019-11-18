"
" Project Setup Script for TDVim
"

" CPP project settings: 
if &filetype == "cpp" || &filetype == "c"
    " Add tags HDK tags
    set tags+=hdk.tags
    set tags+=opengl.tags
    set tags+=mytags.tags

    " Set build command
    if utils#GetOS() == 3
        "Windows
        set makeprg=nmake\ -f\ Makefile.nmake\ all
    endif
endif

" Python project settings: 
if &filetype == "python"
    " Add tags HOU tags
    set tags+=hou.tags
endif

" Vim project settings: 
"if &filetype == "vim"
"endif

" Add folder to file search paths: 
" set path += /apps/myapp/myincludes/*

" Debug Gutentags:
"let g:gutentags_trace = 1
