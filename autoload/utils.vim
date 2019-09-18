"
" Vim setup utilities file
"
" Mantainer:    Pablo Gimenez <pablogipi@gmail.com>
" Last change:  September 17, 2019 - 00:55 AM.
"
"

" GuiTabLabel {{{
" Set tabs label appearance: 
function! utils#GuiTabLabel()
    " add the tab number
    let label = '['.tabpagenr()

    " modified since the last save?
    let buflist = tabpagebuflist(v:lnum)
    for bufnr in buflist
        if getbufvar(bufnr, '&modified')
            let label .= '*'
            break
        endif
    endfor

    " count number of open windows in the tab
    let wincount = tabpagewinnr(v:lnum, '$')
    if wincount > 1
        let label .= ', '.wincount
    endif
    let label .= '] '

    " add the file name without path information
    let n = bufname(buflist[tabpagewinnr(v:lnum) - 1])
    let label .= fnamemodify(n, ':t')

    return label
endfunction

"}}}

" NeatFoldText {{{
" Improve text for folding line
function! utils#NeatFoldText()
    let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
    let lines_count = v:foldend - v:foldstart + 1
    let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
    let foldchar = matchstr(&fillchars, 'fold:\zs.')
    let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
    let foldtextend = lines_count_text . repeat(foldchar, 8)
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
" }}}

" SetLocalPath {{{
" Set the local path for the current buffer to the folder that contains the
" loaded file
function! utils#SetLocalPath ()
    " Current basename for the buffer
    let baseName = expand("%:p:h")
    if isdirectory(baseName)
        silent exe 'lcd ' . fnameescape(baseName)
    endif
endfunction
" }}}

" JustifyHelpHeader  {{{
" Justify vim help headers. Distribute title to the left and tag to the right.
function! utils#JustifyHelpHeader()
    " Do justify
    silent! s/^\s*\(.\{-\}\)\s\+\([*|].*[*|]\)\s*$/\=printf("%s%*.s%s", submatch(1),((&tw?&tw:&wm?winwidth(0)-&wm:winwidth(0)) - len(split(submatch(1).submatch(2),'\zs'))), ' ', submatch(2))/
    " Disavle hilight last search
    nohl
endfu 
" }}}

" ShowUwantedSpaces {{{
" Show/highlight unwanted spaces.
" By unwanted we mean spaces before a tab, tabs or spaces at the end of a line.
" From VimTip 878:
"   http://vim.wikia.com/wiki/VimTip878
function! utils#ShowUnwantedSpaces(...)
    let @/="\\v(\\s+$)|( +\\ze\\t)"
    let oldhlsearch=&hlsearch
    if !a:0
        let &hlsearch=!&hlsearch
    else
        let &hlsearch=a:1
    end
    return oldhlsearch
endfunction
" }}}

" TrimSpaces {{{
" Delete unwanted spaces.
" By unwanted we mean spaces before a tab, tabs or spaces at the end of a line.
" From VimTip 878:
"   http://vim.wikia.com/wiki/VimTip878
" By default the range for this function is the whole file:
function! utils#TrimSpaces() range
    let oldhlsearch=utils#ShowUnwantedSpaces(1)
    execute a:firstline.",".a:lastline."substitute ///gec"
    let &hlsearch=oldhlsearch
endfunction
" }}}

" TabCommand {{{
" Function to pipe the output of an ex command in a new tab
function! utils#TabCommand(cmd)
    redir => message
    silent execute a:cmd
    redir END
    tabnew
    silent put=message
    set nomodified
endfunction
"}}}

" ShellOpen {{{
" This function is awrapper for the Conque terminal functions to integrate it
" in TDVim.
" It will automatically split the current window and create a new window with
" the a terminal created by Conque terminal pluging.
" It can use the first argument as the shell program. In case the isn't any
" argument then it will use the SHELL environment variable, if it is not
" specified then it will try to use /bin/sh .
function! utils#ShellOpen(...)

    if (a:0 > 0 && a:1 != '')
        let prog = a:1
        echo "Paso"
    elseif exists("$SHELL")
        let prog = $SHELL
    else
        let prog =  '/bin/sh'
    endif

    " Call to conque terminal:
    call conque_term#open(prog, ['botright split'])

endfunction
"}}}

" SourceUserSettings {{{
" Load user setup file
function! utils#SourceUserSettings()
    if has('unix')
        " unix-like platform (including Cygwin)
        if filereadable($HOME . "/myvimrc")
            source $HOME/myvimrc
        elseif filereadable($HOME . "/.myvimrc")
            source $HOME/.myvimrc
        elseif filereadable($HOME . "/_myvimrc")
            source $HOME/_myvimrc
        else
            " Do nothing
        endif

        if has ('gui_running')
            if filereadable($HOME . "/mygvimrc")
                source $HOME/mygvimrc
            elseif filereadable($HOME . "/.mygvimrc")
                source $HOME/.mygvimrc
            elseif filereadable($HOME . "/_mygvimrc")
                source $HOME/_mygvimrc
            else
                " Do nothing
            endif
        endif
    else
        " probably Windows
        if has("win32")
            if filereadable($HOME . "/myvimrc")
                source $HOME/myvimrc
            elseif filereadable($HOME . "/_myvimrc")
                source $HOME/_myvimrc
            elseif filereadable($HOME . "/.myvimrc")
                source $HOME/.myvimrc
            else
                " Do nothing
            endif
        endif

        if has('gui_running')
            if has("win32")
                if filereadable($HOME . "/mygvimrc")
                    source $HOME/mygvimrc
                elseif filereadable($HOME . "/_mygvimrc")
                    source $HOME/_mygvimrc
                elseif filereadable($HOME . "/.mygvimrc")
                    source $HOME/.mygvimrc
                else
                    " Do nothing
                endif
            endif
        endif
    endif
endfunction
"}}}

" updateStatusLineColors {{{
" Reload colors for status line using lightline.
" This function is designed to be called from a ColorScheme event in an
" autocommand.
function! utils#updateStatusLineColors()
    "echom "Update status line colors"
    "if !exists('g:loaded_lightline')
    "    echom "lightline not exists"
    "    echom g:colors_name
    "    return
    "endif
    try
        " TODO: get current colorscheme, look for it in the colors in
        " lightline, if it exists, set it
        "if g:colors_name =~# 'wombat\|solarized\|landscape\|jellybeans\|seoul256\|Tomorrow'
        if g:colors_name =~# 'solarized\|seoul256\|one\|pencil\|gruvbox|rigel'
            "let g:lightline = { 'colorscheme': substitute(substitute(g:colors_name, '-', '_', 'g'), '256.*', '', '') }
            "let g:lightline.colorscheme = substitute(substitute(g:colors_name, '-', '_', 'g'), '256.*', '', '')
            let g:lightline.colorscheme = g:colors_name
            if exists('g:loaded_lightline')
                call lightline#init()
                call lightline#colorscheme()
                call lightline#update()
            endif
        else
            let g:lightline.colorscheme = 'default'
        endif
    catch
    endtry
endfunction
" }}}

" ToggleMenuBar {{{
" Funcion to toggle the menu and toolbar
function! utils#ToggleMenuBar()
    " Get if menu bar is present, then togle it
    if &go=~#'m'
    set go-=m
    else
    set go+=m
    endif
    " Do the same with toolbar
    if &go=~#'T'
    set go-=T
    else
    set go+=T
    endif

endfunction
"}}}

" LightLine utility functions {{{
function! utils#LightlineReadonly()
    if &filetype == "help"
        return ''
    else
        return &readonly ? '' : ''
    endif
endfunction

function! utils#LightlineModified()
    return &modified ? '⊚' : ''
endfunction

function! utils#LightlineFugitive()
    if exists('*fugitive#head')
        let branch = fugitive#head()
        return branch !=# '' ? ''.branch : ''
    endif
    return ''
endfunction

function! utils#LightlineGit()
    if exists('*gitbranch#name')
        let branch = gitbranch#name()
        return branch !=# '' ? ''.branch : ''
    endif
    return ''
endfunction

function! utils#LightlineDeviconsFiletype()
    "return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
    if &filetype == "help"
        return 'ﬁ'
    else
        return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() : '') : ''
    endif
endfunction

function! utils#LightlineDeviconsFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" LightlineMode {{{2
" Custom version of original lightline mode function to return
" mode string.
" Customizations:
" - Support preview window
let s:LightLineModeMap = { 'n': 'NORMAL', 'i': 'INSERT', 'R': 'REPLACE', 'v': 'VISUAL', 'V': 'V-LINE', "\<C-v>": 'V-BLOCK',
        \     'c': 'COMMAND', 's': 'SELECT', 'S': 'S-LINE', "\<C-s>": 'S-BLOCK', 't': 'TERMINAL'
        \}
function! utils#LightlineMode() abort
    if &previewwindow
        return 'PREVIEW'
    elseif &filetype == "ctrlp"
        return 'CTRLP'
    elseif &filetype == "help"
        return 'HELP'
    else
        return get(s:LightLineModeMap, mode(), '')
    endif
endfunction
" }}}

" LightlinePreview {{{2
" Return PREVIEW string or nothing, used in lightline for inactive windows
function! utils#LightlinePreview() abort
    if &previewwindow
        return 'PREVIEW'
    else
        return ''
    endif
endfunction
" }}}
" }}}

" SetFancyUI {{{
" Set fancy unicode symbols for UI. Mostly lightline.
function! utils#SetFancyUI()

    if has("gui_running")
        if exists('g:loaded_lightline') && exists('g:lightline')
            if has_key( g:lightline, 'component' )
                let g:lightline.component.lineinfo = ' %3l:%-2v'
            else
                let g:lightline.component = {}
                let g:lightline.component.lineinfo = ' %3l:%-2v'
            endif
            if has_key( g:lightline, 'component_function' )
                let g:lightline.component_function.readonly = 'utils#LightlineReadonly'
                let g:lightline.component_function.fugitive = 'utils#LightlineFugitive'
                let g:lightline.component_function.git = 'utils#LightlineGit'
            else
                let g:lightline.component_function = {}
                let g:lightline.component_function.readonly = 'utils#LightlineReadonly'
                let g:lightline.component_function.fugitive = 'utils#LightlineFugitive'
                let g:lightline.component_function.git = 'utils#LightlineGit'
            endif
            let g:lightline.separator = { 'left': '', 'right': '' }
            let g:lightline.subseparator = { 'left': '', 'right': '' }    
        endif
        if exists('g:loaded_lightline_buffer')
            let g:lightline_buffer_logo = "\u233e"
            let g:lightline_buffer_readonly_icon = ''
            let g:lightline_buffer_modified_icon = '✭'
            let g:lightline_buffer_git_icon = ' '
            let g:lightline_buffer_ellipsis_icon = '..'
            let g:lightline_buffer_expand_left_icon = "\u25c4"
            let g:lightline_buffer_expand_right_icon = "\u25ba"
            let g:lightline_buffer_active_buffer_left_icon = ''
            let g:lightline_buffer_active_buffer_right_icon = ''
            let g:lightline_buffer_separator_icon = "\u25b9"
        endif
    endif
endfunction
"}}}

" GetOS {{{
" Get host OS: 
" 0: Unkmown OS
" 1: UNIX (usually Linux), no Mac
" 2: MacOS
" 3: Windows
function! utils#GetOS()
    if has("win32") || has("win64") || has("win32unix")
        return 3
    elseif has("mac") || has("macunix")
        return 2
    elseif has("unix")
        return 1
    else
        return 0
    endif
endf
" }}}

" NextIndent {{{
"
"
" Jump to the next or previous line that has the same level or a lower
" level of indentation than the current line.
"
" exclusive (bool): true: Motion is exclusive
" false: Motion is inclusive
" fwd (bool): true: Go to next line
" false: Go to previous line
" lowerlevel (bool): true: Go to line with lower indentation level
" false: Go to line with the same indentation level
" skipblanks (bool): true: Skip blank lines
" false: Don't skip blank lines
function! utils#NextIndent(exclusive, fwd, lowerlevel, skipblanks)
    let line = line('.')
    let column = col('.')
    let lastline = line('$')
    let indent = indent(line)
    let stepvalue = a:fwd ? 1 : -1
    while (line > 0 && line <= lastline)
        let line = line + stepvalue
        if ( ! a:lowerlevel && indent(line) == indent ||
                    \ a:lowerlevel && indent(line) < indent)
            if (! a:skipblanks || strlen(getline(line)) > 0)
                if (a:exclusive)
                    let line = line - stepvalue
                endif
                exe line
                exe "normal " column . "|"
                return
            endif
        endif
    endwhile
endfunc
"}}}

" ProjectSettings {{{
" Load local settings sourcing a vim file at the current working directory
" and looking for other locations up in the hirarchy.
" This way is possible to have layers on loc configuration files.
" The founded files are stored in a stack, so last found, the top in the
" hirarchy is sourced first, so the deep in the hirarchy up to the current
" location has more priority.
"
" Usage: call to this function from an autocommand using the BufEnter event.
"
" Configuration:
" - g:tdvim_project_configname : list of names to be used as local
" configurations.
"   Default: ["project.vim", "Project.vim"]
" - g:tdvim_project_depth : how far inthe hirarchy look from current working
" directory to the top root. A value of 0 means no limit, keep sarching up to
" the top root.
"   Default: 3
" - g:tdvim_project_detect_git : detect if file is inside a git repo and find
" root for the repo, only source local settings from it.
"   Default: 1
" g:tdvim_project_enable_logging : enable logging message for every time local
" settins are set.
"   Default: 1
" g:tdvim_project_dev_locations: list of patterns to be ued to chek if current
" locationshould try to use local settings file.
"   Default: ["dev"]
function! utils#ProjectSettings( dirname, depth )
    " Check if the buffer has already been setup
    if exists( "b:tdvim_project_loaded" )
        return
    endif

    " Don't try to walk a remote directory tree -- takes too long, too many
    " what if's
    let l:netrwProtocol = strpart(a:dirname, 0, stridx(a:dirname, "://"))
    if l:netrwProtocol != ""
        return
    endif

    let l:gitfound = 0
    let l:projectdir = a:dirname

    " Get config variables
    if !exists( "g:tdvim_project_configname" )
        let g:tdvim_project_configname = ["project.vim", "Project.vim"]
    endif
    if !exists( "g:tdvim_project_depth" )
        let g:tdvim_project_depth = 3
    endif
    if !exists( "g:tdvim_project_detect_git" )
        let g:tdvim_project_detect_git = 1
    endif
    if !exists( "g:tdvim_project_enable_logging" )
        let g:tdvim_project_enable_logging = 1
    endif
    if !exists( "g:tdvim_project_dev_locations" )
        let g:tdvim_project_dev_locations = ["dev"]
    endif

    " Check depth:
    if a:depth > 0 && a:depth >= g:tdvim_project_depth
        return
    endif

    " Checkdev locations
    let l:isgoodloc = 0
    for pat in g:tdvim_project_dev_locations
        if l:projectdir =~# pat
            let l:isgoodloc = 1
            break
        endif
    endfor
    if !l:isgoodloc
        return
    endif

    "echomsg "Looking for project.vim"

    " Try to use git
    if g:tdvim_project_detect_git && executable( 'git' )
        silent let l:projectdir = system( "git rev-parse --show-toplevel" )
        let l:projectdir = substitute(l:projectdir, "\n", "", "g")
        "echomsg "Git dir"
        if len( l:projectdir ) && l:projectdir !~ "^fatal:"
            "echomsg l:projectdir
            "echomsg "Try to use git"
            let l:gitfound = 1
        "else
            "echomsg "Not GIT repo found"
        endif
    endif

    " Convert windows paths to unix style (they still work)
    let l:projectdir = substitute(l:projectdir, "\\", "/", "g")

    " Walk up to the top of the directory tree
    if !l:gitfound
        let l:parentDir = strpart(l:projectdir, 0, strridx(l:projectdir, "/"))
        if isdirectory(l:parentDir)
            call utils#ProjectSettings( l:parentDir, a:depth+1 )
        endif
    endif

    " Now walk back down the path and source first match in settingsFile list 
    " as you find them. This way child directories can 'inherit' from their parents
    for pat in g:tdvim_project_configname
        let l:settingsFile = l:projectdir . "/" . pat
        if filereadable( l:settingsFile )
            exec ":source " . l:settingsFile
            if g:tdvim_project_enable_logging 
                echomsg "TDVim Project for " . @% . " loaded settings from: " . l:settingsFile 
            endif
            break
        endif
    endfor
    let b:tdvim_project_loaded = 1
endfunction
" 
" }}}

" PreviewWindowSetup {{{
" Setup preview window depending based on previous window type.
" This is mainly used to offer a better preview for tags and other
" development help.
" Usage: call this using an autocommand
function! utils#PreviewWindowSetup()
    if &previewwindow			" if we really are at the preview window
        if &filetype == ""
            " Tags preview
            set filetype=passwd 
        else
            " Preview jump to tag
            silent! foldopen!   " Disable folds
            setlocal cursorline " Highlight current line
            set ro              " Force Read-Only
        endif
    endif
endfunction
" }}}

" ShowTDVimHelp {{{
" Show TDVim help window
function! utils#ShowTDVimHelp(  )
    :helpclose
    :botright h tdvim

    " Help buffer local maps
    map <silent> <buffer> <Esc> :bdelete<CR>
    map <silent> <buffer> q :bdelete<CR>

    ":silent file! TDVim Help
endfunction
" }}}

" SetupFirstStartup {{{
function! utils#SetupFirstStartup()
    " If home vin location doesnt exist, 
    " or user's vim location is empty then install all plugins.
    let plugsloc = $HOME . '/.vim/plugged'
    let installplugs = 0
    let cleanplugs = 0
    if utils#GetOS() == 3
        "Windows
        let plugsloc = $HOME . '/vimfiles/plugged'
    endif
    if empty(glob(plugsloc))
        call mkdir( plugsloc )
        let installplugs = 1
    endif
    if !installplugs && empty(glob(plugsloc . "/*"))
        let installplugs = res == 1 ? 1 : 0
    endif
    if installplugs
        let msg = "Can't find TDVim plug-ins, install them?"
        let res = confirm( msg, "&Yes\n&No", 1, "Question" )
        if res == 1
            PlugInstall
            let plugsloc = $HOME . '/.vim/plugged'
            if utils#GetOS() == 3
                "Windows
                let plugsloc = $HOME . '/vimfiles/plugged'
            endif
            echomsg "Plugins installed in " . plugsloc
            echomsg "Please restart VIM"
        endif
    endif
endfunction
" }}}

" ToggleVExplorer {{{
" Open/Close Netrw explorer as a side drawer
function! utils#ToggleVExplorer()
    let found = 0
    let curwindow = winnr()
    let curbuf =  bufname( curwindow )
    execute curwindow  . 'wincmd t'
    if getwinvar(0, '&syntax') == 'netrw'
        let found = 1
    endif
    if found
        close!
        let curwindow = bufwinnr( curbuf )
        execute curwindow .'wincmd w'
    else
        let path = substitute(exists("b:netrw_curdir")? b:netrw_curdir : expand("%:p"), '^\(.*[/\\]\)[^/\\]*$','\1','e')
        exe "20Lexplore ".path
        "setlocal winfixwidth
        "let t:expl_buf_num = bufnr("%")
    endif

    "if exists("t:expl_buf_num")
        "let expl_win_num = bufwinnr(t:expl_buf_num)
        "if expl_win_num != -1
            ""let cur_win_nr = winnr()
            "let cur_buf =  bufname( winnr() )
            "exec expl_win_num . 'wincmd w'
            "close
            "let cur_win_nr = bufwinnr( cur_buf )
            "exec cur_win_nr . 'wincmd w'
            "unlet t:expl_buf_num
        "else
            "unlet t:expl_buf_num
        "endif
    "else
        "let path = substitute(exists("b:netrw_curdir")? b:netrw_curdir : expand("%:p"), '^\(.*[/\\]\)[^/\\]*$','\1','e')
        "exe "15Lexplore ".path
        ""setlocal winfixwidth

        "let t:expl_buf_num = bufnr("%")
    "endif    
endfunction
" }}}

" Wrapper functions for netrw keymaps {{{
function! utils#UserNetrwBrowseUpDir( islocal )
    call netrw#Call("NetrwBrowseUpDir(" . a:islocal . ")")
endfunction
function! utils#UserNetrwBrowseBackRecentDir( islocal )
    call netrw#Call('NetrwBookHistHandler(4,expand("%"))')
endfunction
function! utils#UserNetrwBrowseForwardRecentDir( islocal )
    call netrw#Call('NetrwBookHistHandler(5,expand("%"))')
endfunction
function! utils#UserNetrwRexplore( islocal )
    call netrw#Call('NetrwRexplore('. a:islocal . ',  "")' )
endfunction
" }}}

" ClosePreviousWindow {{{
" Close previous window
function! utils#ClosePreviousWindow()
    let prevwindow = winnr('#')
    if prevwindow > 0
        execute prevwindow . 'wincmd c'
    endif
endfunction
" }}}

" SearchAndResults {{{
" Perform a vimgrep search in current buffer and show results in Qicklist
" windoew
function! utils#SearchAndResults( pat )
    execute "vimgrep " . a:pat . " %"
    cwin
endfunction
"}}}

" InsertTimestamp {{{
" This function will insert a time stamp whatever the mode you are
" Modes could be two options:
" 1 - Insert just the time stamp
" 2 - Insert automatic time stamp using a pattern ready for autodate
" Insert is how to insert stuff:
" i - inssert
" a - append
function! utils#InsertTimestamp(mode, insert)
    "let l:stampStr=Strftime2(g:autodate_format)
    let l:stampStr=strftime(g:autodate_format)
    if a:mode == 1
        execute "normal " . a:insert. " " . l:stampStr
    else
        execute "normal " . a:insert. " " . g:autodate_keyword_pre . " ."
        execute "Autodate"
    endif
endfu
"}}}

" GitStatusToggle {{{
" Open Git status using fugitive's Gstatus in decent window at the bottom
" Toggle it if needed
function! utils#GitStatusToggle()
    " Save current window number to revert.
    let save_winnr = winnr()
    let nwin = 1
    let found = 0
    while 1
        let nbuf = winbufnr(nwin)
        " After all window processed, finish.
        if nbuf == -1
            break
        endif
        " Detect if window is Gstatus
        if getbufvar(nbuf, '&filetype') ==# 'gitcommit'
            execute nwin.'wincmd w'
            if &previewwindow
                let found = 1
                " Correct saved window number if younger window will be closed.
                if save_winnr >= nwin
                    let save_winnr = save_winnr - 1
                endif
                break
            endif
        endif
        let nwin = nwin + 1
    endwhile
    if found
        close!
        " Revert selected window.
        execute save_winnr.'wincmd w'
    else
        Gstatus
        let curwindow = winnr()
        execute curwindow  . 'wincmd J'
        resize 20
        "execute curwindow  . 'wincmd 10+'
    endif
endfunction
" }}}

" GitFileLogToggle {{{
" Open latest 10 revisions of a file in GIT in quickfix window 
" Toggle it if needed
function! utils#GitFileLogToggle()
    " Save current window number to revert.
    let found = 0
    for winnr in range(1, winnr('$'))
        if getwinvar(winnr, '&syntax') == 'qf'
            let found = 1
            break
        endif
    endfor
    if found
        cclose
        " Revert selected window.
        "execute save_winnr.'wincmd w'
    else
        " Create log, open quickfix window, move it down and go back to file
        Glog
        copen 10
        let curwindow = winnr()
        execute curwindow  . 'wincmd J'
        execute curwindow  . 'wincmd p'
        e #
    endif
endfunction
" }}}

" GitLogToggle {{{
" Open latest 10 revisions of a file in GIT in quickfix window 
" Toggle it if needed
function! utils#GitLogToggle()
    let save_winnr = winnr()
    let found = 0
    for winnr in range(1, winnr('$'))
        execute winnr .'wincmd w'
        let name = bufname( winbufnr( winnr ) )
        if getwinvar(winnr, '&syntax') == 'git' && name =~# "^fugitive:"
            let found = 1
            " Correct saved window number if younger window will be closed.
            if save_winnr >= winnr
                let save_winnr = save_winnr - 1
            endif
            break
        endif
    endfor
    if found
        close!
        " Revert selected window.
        execute save_winnr.'wincmd w'
    else
        let curwindow = winnr()
        execute curwindow  . 'wincmd s'
        execute curwindow  . 'wincmd p'
        "Glog --
        Glog --
        let curwindow = winnr()
        execute curwindow  . 'wincmd J'
    endif
endfunction
" }}}

" GitDiffToggle {{{
" Make diff of current file with it latest reviion in GITg 
" Toggle it if needed
function! utils#GitDiffToggle()
    let curwindow = winnr()
    let save_winnr = winnr()
    let found = 0
    let diffwins = []
    let curname = bufname("%")
    if curname =~# "^fugitive:"
        let curname = ""
    endif
    for winnr in range(1, winnr('$'))
        execute winnr .'wincmd w'
        let name = bufname( winbufnr( winnr ) )
        if getwinvar(winnr, '&diff')
            let found = 1
            "diffoff
            if name =~# "^fugitive:"
                " Correct saved window number if younger window will be closed.
                call add( diffwins, winnr )
                if save_winnr >= winnr
                    let save_winnr = save_winnr - 1
                endif
            elseif !len( curname )
                let curname = name
            endif
            break
        endif
    endfor
    execute curwindow .'wincmd w'
    if found
        for win in diffwins
            execute win .'wincmd w'
            close!
        endfor
        let curwindow = bufwinnr( curname  )
        execute curwindow .'wincmd w'
        diffoff
    else
        Gdiff
        let curwindow = bufwinnr( curname  )
        execute curwindow .'wincmd w'
    endif
endfunction
" }}}

" TabAutocompleteWrapper {{{
" Function to call to Autocomplete when pressing TAB
" Or insert a TAB if ther is nothing in front of the cursor
" From: https://stackoverflow.com/questions/2055417/mapping-tab-to-omicompletion-in-gvim 
function! utils#TabAutocompleteWrapper( direction)
    " Make TAB working in popup menu
    if pumvisible()
        if "backward" == a:direction
            return "\<C-P>"
        else
            return "\<C-N>"
        endif
    endif
    " Pass a normal TAB if there is no character in front.
    " Use autocomplete if there is something in front of the cursor
    let char_before = col('.') - 1
    if !char_before || getline('.')[char_before - 1] !~ '\k'
        if "backward" == a:direction
            return "\<BS>"
        else
            return "\<tab>"
        endif
    elseif "backward" == a:direction
        return "\<c-p>"
    else
        return "\<c-n>"
    endif
endfunction
" }}}

" SetupNERDTreeBuffer {{{
" Functiom to do some custom setups in a NERDtree buffer when Syntax event
" is triggered usinh autocommands.
" Close NERDtree window using - or Esc.
function! utils#SetupNERDTreeBuffer(  )
    " Check we are actually in a NERDTree buffer
    if &syntax !~ "nerdtree"
        echoerr "We are NOT in a NERDtree buffer!!!: " . curbuf
        return
    endif
    "echomsg "We are in a NERDtree buffer!!!"
    nmap <buffer> -        :call nerdtree#ui_glue#invokeKeyMap("q")<CR>
    nmap <buffer> <silent> <Esc> :call nerdtree#ui_glue#invokeKeyMap("q")<CR>



endfunction
"}}}


" vim: ts=8 ft=vim nowrap fdm=marker 
