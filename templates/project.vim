"
" Project Setup Script for TDVim
"

" CPP project settings
if &filetype == "cpp" || &filetype == "c"
    " Add tags HDK tags
    set tags+=opengl.tags
    set tags+=mytags.tags

    " Set build command
    set makeprg="nmake"
endif

" Python project settings
"if &filetype == "python"
"endif

" Vim project settings
"if &filetype == "vim"
"endif
