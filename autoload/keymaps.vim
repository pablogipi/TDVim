" File: keymaps.vim
" Author: Pablo Gimenez <pablogipi@gmail.com>
" Description: Keymaps TDVim setup
" Last Change: April 12, 2021 - 12:19 PM.

" Note:
" For a complete list of keymaps take a look at ../doc/tdvim.txt


" Template: {{{
"if has("win32") || has("win64") 
" For windows
"elseif $TERM_PROGRAM =~ 'Apple_Terminal'
" For Mac OS X terminal
"elseif has("gui_macvim")
" Mac OS X macvim
"elseif has("mac") || has("macunix")
" For Mac OS X
"elseif (has("unix") || has("win32unix")) && has("gui_running")

" For Unix with GUI running (gvim)
"elseif (has("unix") || has("win32unix")) && (has("mouse_gpm") || has("mouse_sysmouse") || has("mouse_xterm") || has("mouse"))
" For Unix running with mouse support(Terminals and GUI)

"elseif has("unix") || has("win32unix")
" For Unix 

"else
" Default
"endif
" }}}

" Simple Template {{{
"if has("win32") || has("win64")
"" For windows
"elseif has("gui_macvim")
" Mac OS X macvim
"elseif has("unix") || has("win32unix")
"" For Unix
"else
"endif
" }}}

" LoadKeymaps {{{
" Load Keymaps, call all functions that laods every section keymaps
function! keymaps#LoadKeymaps()
    call keymaps#TerminalKeycodes()
    call keymaps#MainOperations()
    call keymaps#WindowManagement()
    call keymaps#CommandLine()
    call keymaps#Modes()
    call keymaps#Edit()
    call keymaps#TextNavigation()
    call keymaps#Development()
    call keymaps#Help()
endfunction

" }}}

" TerminalKeycodes {{{
" Keycodes to map terminal codes to vim keycodes
" Needed to keep compatibility with gvim keymaps
function! keymaps#TerminalKeycodes()
    if !has('gui_running')
        "if tdvim#GetValue('g:tdvim_term_mode') == 0
            "" For GNOME terminal
            "call tdvim#MapFastKeycode('<C-F2>', "^[O1;5Q")
            "call tdvim#MapFastKeycode('<C-S-F2>', "^[O1;6Q")
            "call tdvim#MapFastKeycode('<C-F3>', "^[O1;5R")
            "call tdvim#MapFastKeycode('<C-S-F3>', "^[O1;6R")
            "call tdvim#MapFastKeycode('<C-F4>', "^[O1;5S")
            "call tdvim#MapFastKeycode('<C-S-F4>', "^[O1;6S")
            "call tdvim#MapFastKeycode('<C-F5>', "^[[15;5~]")
            "call tdvim#MapFastKeycode('<C-S-F5>', "^[[15;6~]")
            "call tdvim#MapFastKeycode('<C-F6>', "^[[17;5~]"))
            "call tdvim#MapFastKeycode('<C-S-F6>', "^[[17;6~]")
            "call tdvim#MapFastKeycode('<C-F7>', "^[[18;5~]")
            "call tdvim#MapFastKeycode('<C-S-F7>', "^[[18;6~]")
            "call tdvim#MapFastKeycode('<C-F7>', "^[[18;5~]")
            "call tdvim#MapFastKeycode('<C-S-F7>', "^[[18;6~]")
            "call tdvim#MapFastKeycode('<C-F8>', "^[[19;5~]")
            "call tdvim#MapFastKeycode('<C-S-F8>', "^[[19;6~]")
            "call tdvim#MapFastKeycode('<C-F9>', "^[[20;5~]")
            "call tdvim#MapFastKeycode('<C-S-F9>', "^[[20;6~]")
            "call tdvim#MapFastKeycode('<C-F10>', "^[[21;5~]")
            "call tdvim#MapFastKeycode('<C-S-F10>', "^[[21;6~]")
            "call tdvim#MapFastKeycode('<C-F11>', "^[[23;5~]")
            "call tdvim#MapFastKeycode('<C-S-F11>', "^[[23;6~]")
            "call tdvim#MapFastKeycode('<C-F12>', "^[[24;5~]")
            "call tdvim#MapFastKeycode('<C-S-F12>', "^[[24;6~]")
        "elseif tdvim#GetValue('g:tdvim_term_mode') == 1
            "" For any other terminal: xterm, urxvt, rxvt, mrxvt, konsole
            "call tdvim#MapFastKeycode('<C-F1>', "^[O5P")
            "call tdvim#MapFastKeycode('<C-F2>', "^[O5Q")
            "call tdvim#MapFastKeycode('<C-S-F2>', "^[O6Q")
            "call tdvim#MapFastKeycode('<C-F3>', "^[O5R")
            "call tdvim#MapFastKeycode('<C-S-F3>', "^[O6R")
            "call tdvim#MapFastKeycode('<C-F4>', "^[O5S")
            "call tdvim#MapFastKeycode('<C-S-F4>', "^[O6S")
            "call tdvim#MapFastKeycode('<C-F5>', "^[[15;5~]")
            "call tdvim#MapFastKeycode('<C-S-F5>', "^[[15;6~]")
            "call tdvim#MapFastKeycode('<C-F6>', "^[[17;5~]")
            "call tdvim#MapFastKeycode('<C-S-F6>', "^[[17;6~]")
            "call tdvim#MapFastKeycode('<C-F7>', "^[[18;5~]")
            "call tdvim#MapFastKeycode('<C-S-F7>', "^[[18;6~]")
            "call tdvim#MapFastKeycode('<C-F8>', "^[[19;5~]")
            "call tdvim#MapFastKeycode('<C-S-F8>', "^[[19;6~]")
            "call tdvim#MapFastKeycode('<C-F9>', "^[[20;5~]")
            "call tdvim#MapFastKeycode('<C-S-F9>', "^[[20;6~]")
            "call tdvim#MapFastKeycode('<C-F10>', "^[[21;5~]")
            "call tdvim#MapFastKeycode('<C-S-F10>', "^[[21;6~]")
            "call tdvim#MapFastKeycode('<C-F11>', "^[[23;5~]")
            "call tdvim#MapFastKeycode('<C-S-F11>', "^[[23;6~]")
            "call tdvim#MapFastKeycode('<C-F12>', "^[[24;5~]")
            "call tdvim#MapFastKeycode('<C-S-F12>', "^[[24;6~]")
        "else

        "endif
        " Fix Shift, Ctrl and Ctrl-Shift functions keys combinations
        " F1-F4
        let a=0    
        let b='PQRS'    
        while a < 4    
            exec 'set <s-f' . (a + 1) . ">=\eO1;2" . b[a]
            exec 'map <esc>O1;3' . b[a] ' <a-f' . (a + 1) . '>'
            exec 'map <esc>O1;5' . b[a] ' <c-f' . (a + 1) . '>'
            exec 'map <esc>O1;6' . b[a] ' <c-s-f' . (a + 1) . '>'
            let a+=1    
        endwhile
        "F5-F12
        let a=5 
        let b='1517181920212324' 
        let c=0 
        while a < 16 
            exec 'set <s-f' . a . ">=\e[" . b[c : c + 1] . ';2~'
            exec 'map <esc>[' . b[c : c + 1] . ';5~ <c-f' . a . '>'
            exec 'map <esc>[' . b[c : c + 1] . ';6~ <c-s-f' . a . '>'
            let a+=1 
            let c+=2
        endwhile
        " Fix Alt<a-z> 
        let c='a'
        while c <= 'z'
            exec "set <A-".c.">=\e".c
            exec "imap \e".c." <A-".c.">"
            let c = nr2char(1+char2nr(c))
        endw
    endif
endf
" }}}

" MainOperations {{{
" Main operations like open, save, new, quit, etc ...
function! keymaps#MainOperations ()
    " Various Settings {{{2
    " Don't use Ex mode, use Q for formatting
    map Q gq

    " Make shift-insert work like in Xterm
    if (has("unix") || has("win32unix")) && (has("mouse_gpm") || has("mouse_sysmouse") || has("mouse_xterm") || has("mouse"))
        map! <S-Insert> <MiddleMouse>
    endif

    "Page Up Down with Command Key
    "if has("mac") || has("macunix") 
    "    noremap <silent> <D-U> <C-U>
    "    noremap <silent> <D-D> <C-D>
    "endif

    " F1 only for help
    inoremap <F1> <ESC>
    nnoremap <F1> <ESC>
    vnoremap <F1> <ESC>

    " }}}

    " Open Files -> Ctrl-O or - to open in same buffer {{{2
    "------------------------------------------------------------------------------
    " Open files with Ctrl-o
    " Open the file in a new tab using Ctrl-Alt-o
    nnoremap <unique> <silent>  <Plug>TdvimOpenFile :browse e<CR>
    nnoremap <unique> <silent>  <Plug>TdvimOpenFileTab :browse tabnew<CR>
    inoremap <unique> <silent>  <Plug>TdvimOpenFile <Esc>:browse e<CR>
    inoremap <unique> <silent>  <Plug>TdvimOpenFileTab <Esc>:browse tabnew<CR>

    nmap  <silent>      <C-o>   <Plug>TdvimOpenFile
    nmap  <silent>      <C-M-o> <Plug>TdvimOpenFileTab
    imap  <silent>      <C-o>   <Plug>TdvimOpenFile
    imap  <silent>      <C-M-o> <Plug>TdvimOpenFileTab

    " }}}

    " Fuzzy Finder Open Files -> S-F3 {{{2
    "nnoremap <unique> <silent> <Plug>TdvimFinder :CtrlP<CR>
    "inoremap <unique> <silent> <Plug>TdvimFinder :CtrlP<CR>i
    "vnoremap <unique> <silent> <Plug>TdvimFinder :CtrlP<CR>v
    nnoremap <unique> <silent> <Plug>TdvimFinder :LeaderfFileFullScreen<CR>
    inoremap <unique> <silent> <Plug>TdvimFinder <Esc>:LeaderfFileFullScreen<CR>
    vnoremap <unique> <silent> <Plug>TdvimFinder :LeaderfFileFullScreen<CR>
    "nnoremap <unique>           <Plug>TdvimFinder       :find 
    "inoremap <unique>           <Plug>TdvimFinder       <Esc>:find 
    "vnoremap <unique>           <Plug>TdvimFinder       <Esc>:find 

    nmap     <S-F3>   <Plug>TdvimFinder
    imap     <S-F3>   <Plug>TdvimFinder
    vmap     <silent> <S-F3>   <Plug>TdvimFinder

    " }}}

    " Fuzzy Finder MRU ->  C-S-F3{{{2
    " Default map to C-S-F3
    "nnoremap <unique> <silent>          <Plug>TdvimFinderMru    :CtrlPMRU<CR>
    "inoremap <unique> <silent>          <Plug>TdvimFinderMru    :CtrlPMRU<CR>i
    "vnoremap <unique> <silent>          <Plug>TdvimFinderMru    :CtrlPMRU<CR>v
    nnoremap <unique> <silent>          <Plug>TdvimFinderMru    :LeaderfMru<CR>
    inoremap <unique> <silent>          <Plug>TdvimFinderMru    <Esc>:LeaderfMru<CR>
    vnoremap <unique> <silent>          <Plug>TdvimFinderMru    :LeaderfMru<CR>
    "nnoremap <unique> <silent>          <Plug>TdvimFinderMru    :browse oldfiles<CR>
    "inoremap <unique> <silent>          <Plug>TdvimFinderMru    <Esc>:browse oldfiles<CR>
    "vnoremap <unique> <silent>          <Plug>TdvimFinderMru    <Esc>:browse oldfiles<CR>

    nmap <silent> <C-S-F3>              <Plug>TdvimFinderMru
    imap <silent> <C-S-F3>              <Plug>TdvimFinderMru
    vmap <silent> <C-S-F3>              <Plug>TdvimFinderMru
    " }}}

    " New File -> Ctrl-N. New File in Tab -> Ctrl-Alt-N {{{2
    " New file in the same buffer or in new tab
    nnoremap <unique> <silent>   <Plug>TdvimNewFile :enew<CR>
    nnoremap <unique> <silent>   <Plug>TdvimNewFileTab :tabnew<CR>

    nmap  <silent>      <C-n>   <Plug>TdvimNewFile
    nmap  <silent>      <C-M-n> <Plug>TdvimNewFileTab
    " }}}

    " Save File -> Ctrl-S (leader-w, leader-wa). Save As -> Ctrl-Alt-S {{{2
    " To save, ctrl-s and save-as Ctrl-Alt-s
    noremap <unique> <silent>   <Plug>TdvimSaveFile :if expand("%") == ""<CR>:browse confirm update<CR>:else<CR>:confirm update<CR>:endif<CR><CR>
    noremap <unique> <silent>   <Plug>TdvimSaveFileAs :browse confirm saveas<CR>
    noremap! <unique> <silent>  <Plug>TdvimSaveFile <Esc>:if expand("%") == ""<CR>:browse confirm update<CR>:else<CR>:confirm update<CR>:endif<CR><CR>
    noremap! <unique> <silent>  <Plug>TdvimSaveFileAs <Esc>:browse confirm saveas<CR>

    map  <silent>       <C-s>       <Plug>TdvimSaveFile
    map  <silent>       <C-M-s>     <Plug>TdvimSaveFileAs
    map! <silent>       <C-s>       <Plug>TdvimSaveFile
    map! <silent>       <C-M-s>     <Plug>TdvimSaveFileAs
    nmap <silent>   <leader>w   :w<CR>
    nmap <silent>   <leader>wa  :wa<CR>
    vmap <silent>   <leader>w   <Esc>:w<CR>
    vmap <silent>   <leader>wa  <Esc>:wa<CR>
    " }}}

    " Open Start Menu -> C-S-F1 {{{2
    noremap <unique> <Plug>TdvimOpenSession :Startify<CR>  

    nmap    <C-S-F1> <Plug>TdvimOpenSession
    " }}}

    " Open options/preferences {{{2
    "noremap <unique> <Plug>TdvimPreferences :options<CR>

    "nmap    <F10> <Plug>TdvimPreferences
    " }}}


endfunction

" }}}

" WindowManagement {{{
" Operations to work with windows, tabs, etc ...
function! keymaps#WindowManagement()
    " Tabs Browsing, close tabs/window {{{2
    " Tabs mappings don't work in terminals
    "

    " Maximize/restore windows {{{2
    nnoremap <unique> <silent> <Plug>TdvimZoom :MaximizerToggle<CR>
    vnoremap <unique> <silent> <Plug>TdvimZoom :MaximizerToggle<CR>v

    nmap     <silent> <leader><Space>  <Plug>TdvimZoom
    vmap     <silent> <leader><Space>  <Plug>TdvimZoom
    
    " }}}

    " Incraese/Decrease window heigh {{{2
    " with Alt-Shift Up or Down
    nnoremap <unique> <silent> <Plug>TdvimWindowIncreaseHeight <C-W>+
    nnoremap <unique> <silent> <Plug>TdvimWindowDecreaseHeight <C-W>-
    vnoremap <unique> <silent> <Plug>TdvimWindowIncreaseHeight <C-W>+
    vnoremap <unique> <silent> <Plug>TdvimWindowDecreaseHeight <C-W>-
    inoremap <unique> <silent> <Plug>TdvimWindowIncreaseHeight <C-O><C-W>+
    inoremap <unique> <silent> <Plug>TdvimWindowDecreaseHeight <C-O><C-W>-

    nmap <silent> <C-S-Up>   <Plug>TdvimWindowIncreaseHeight
    nmap <silent> <C-S-Down> <Plug>TdvimWindowDecreaseHeight
    vmap <silent> <C-S-Up>   <Plug>TdvimWindowIncreaseHeight
    vmap <silent> <C-S-Down> <Plug>TdvimWindowDecreaseHeight
    imap <silent> <C-S-Up>   <Plug>TdvimWindowIncreaseHeight
    imap <silent> <C-S-Down> <Plug>TdvimWindowDecreaseHeight
    "}}}

    " Incrase/Decrase window width{{{2
    " with Alt-Shift < or >
    nnoremap <unique> <silent>    <Plug>TdvimWindowIncreaseWidth <C-W>>
    nnoremap <unique> <silent>    <Plug>TdvimWindowDecreaseWidth <C-W><
    vnoremap <unique> <silent>    <Plug>TdvimWindowIncreaseWidth <C-W>>
    vnoremap <unique> <silent>    <Plug>TdvimWindowDecreaseWidth <C-W><
    inoremap <unique> <silent>    <Plug>TdvimWindowIncreaseWidth <C-O><C-W>>
    inoremap <unique> <silent>    <Plug>TdvimWindowDecreaseWidth <C-O><C-W><

    nmap     <silent> <C-S-Left>  <Plug>TdvimWindowDecreaseWidth
    nmap     <silent> <C-S-Right> <Plug>TdvimWindowIncreaseWidth
    vmap     <silent> <C-S-Left>  <Plug>TdvimWindowDecreaseWidth
    vmap     <silent> <C-S-Right> <Plug>TdvimWindowIncreaseWidth
    imap     <silent> <C-S-Left>  <Plug>TdvimWindowDecreaseWidth
    imap     <silent> <C-S-Right> <Plug>TdvimWindowIncreaseWidth
    "}}}

    " Moving around windows {{{2
    " Alt+[Left|Right|Up|Down]
    nnoremap <unique> <silent> <Plug>TdvimMoveToRightWindow    <C-W><Right>
    nnoremap <unique> <silent> <Plug>TdvimMoveToLeftWindow     <C-W><Left>
    nnoremap <unique> <silent> <Plug>TdvimMoveToUpWindow       <C-W><Up>
    nnoremap <unique> <silent> <Plug>TdvimMoveToDownWindow     <C-W><Down>
    nnoremap <unique> <silent> <Plug>TdvimSwitchWindow         <C-W>p
    vnoremap <unique> <silent> <Plug>TdvimSwitchWindow         <C-W>p
    inoremap <unique> <silent> <Plug>TdvimSwitchWindow         <C-O><C-W>p
    vnoremap <unique> <silent> <Plug>TdvimMoveToRightWindow    <C-W><Right>
    vnoremap <unique> <silent> <Plug>TdvimMoveToLeftWindow     <C-W><Left>
    vnoremap <unique> <silent> <Plug>TdvimMoveToUpWindow       <C-W><Up>
    vnoremap <unique> <silent> <Plug>TdvimMoveToDownWindow     <C-W><Down>
    inoremap <unique> <silent> <Plug>TdvimMoveToRightWindow    <C-O><C-W><Right>
    inoremap <unique> <silent> <Plug>TdvimMoveToLeftWindow     <C-O><C-W><Left>
    inoremap <unique> <silent> <Plug>TdvimMoveToUpWindow       <C-O><C-W><Up>
    inoremap <unique> <silent> <Plug>TdvimMoveToDownWindow     <C-O><C-W><Down>
    nnoremap <unique> <silent> <Plug>TdvimMoveToFarRightWindow 10<C-W>l
    nnoremap <unique> <silent> <Plug>TdvimMoveToFarLeftWindow  10<C-W>h
    nnoremap <unique> <silent> <Plug>TdvimMoveToTopWindow      10<C-W>k
    nnoremap <unique> <silent> <Plug>TdvimMoveToBottomWindow   10<C-W>j

    nmap <silent> <M-Right>         <Plug>TdvimMoveToRightWindow
    nmap <silent> <M-Left>          <Plug>TdvimMoveToLeftWindow
    nmap <silent> <M-Up>            <Plug>TdvimMoveToUpWindow
    nmap <silent> <M-Down>          <Plug>TdvimMoveToDownWindow
    nmap <silent> <leader>p         <Plug>TdvimSwitchWindow
    vmap <silent> <M-Right>         <Plug>TdvimMoveToRightWindow
    vmap <silent> <M-Left>          <Plug>TdvimMoveToLeftWindow
    vmap <silent> <M-Up>            <Plug>TdvimMoveToUpWindow
    vmap <silent> <M-Down>          <Plug>TdvimMoveToDownWindow
    vmap <silent> <leader>p         <Plug>TdvimSwitchWindow
    imap <silent> <M-Right>         <Plug>TdvimMoveToRightWindow
    imap <silent> <M-Left>          <Plug>TdvimMoveToLeftWindow
    imap <silent> <M-Up>            <Plug>TdvimMoveToUpWindow
    imap <silent> <M-Down>          <Plug>TdvimMoveToDownWindow

    nmap <silent> <leader><Right>         <Plug>TdvimMoveToFarRightWindow
    nmap <silent> <leader><Left>          <Plug>TdvimMoveToFarLeftWindow
    nmap <silent> <leader><Up>            <Plug>TdvimMoveToTopWindow
    nmap <silent> <leader><Down>          <Plug>TdvimMoveToBottomWindow
    " }}}
    
    " Scroll previous window {{{2
    nnoremap <unique> <silent> <Plug>TdvimScrollUpPrevWindow    :call utils#ScrollPrevWindow( 0 )<CR>
    nnoremap <unique> <silent> <Plug>TdvimScrollDownNextWindow    :call utils#ScrollPrevWindow( 1 )<CR>
    nmap <silent> <C-Up>         <Plug>TdvimScrollUpPrevWindow
    nmap <silent> <C-Down>          <Plug>TdvimScrollDownNextWindow

    " }}}

    " Splitting windows {{{2
    " Split vertical with Alt-t
    " Split horizontal with Alt-Shift-t
    nnoremap <unique> <silent>   <Plug>TdvimSplitWindow  <C-W>v<C-W>p
    vnoremap <unique> <silent>   <Plug>TdvimSplitWindow  <C-W>v<C-W>p
    inoremap <unique> <silent>   <Plug>TdvimSplitWindow  <C-O><C-W>v<C-W>p
    nnoremap <unique> <silent>   <Plug>TdvimSplitHWindow <C-W>s<C-W>p
    vnoremap <unique> <silent>   <Plug>TdvimSplitHWindow <C-W>s<C-W>p
    inoremap <unique> <silent>   <Plug>TdvimSplitHWindow <C-O><C-W>s<C-W>p

    nmap     <silent> <leader>s  <Plug>TdvimSplitWindow
    vmap     <silent> <leader>s  <Plug>TdvimSplitWindow
    nmap     <silent> <leader>sh <Plug>TdvimSplitHWindow
    vmap     <silent> <leader>sh <Plug>TdvimSplitHWindow

    " }}}

    " Close window {{{2
    nnoremap <unique> <silent>  <Plug>TdvimCloseWindow <C-W>c
    vnoremap <unique> <silent>  <Plug>TdvimCloseWindow <C-W>c
    inoremap <unique> <silent>  <Plug>TdvimCloseWindow <C-O><C-W>c

    nmap     <silent> <leader>q <Plug>TdvimCloseWindow
    vmap     <silent> <leader>q <Plug>TdvimCloseWindow
    " }}}

    " Close buffer, without losing the window {{{2
    nnoremap <unique> <silent>  <Plug>TdvimCloseBuffer :TdvimBufferDelete<CR>
    vnoremap <unique> <silent>  <Plug>TdvimCloseBuffer <Esc>:TdvimBufferDelete<CR>
    inoremap <unique> <silent>  <Plug>TdvimCloseBuffer <C-O>TdvimBufferDelete

    nmap     <silent> <leader>x <Plug>TdvimCloseBuffer
    vmap     <silent> <leader>x <Plug>TdvimCloseBuffer
    " }}}

    " Reset windows size {{{2
    nnoremap <unique> <silent>  <Plug>TdvimResetWindows <C-W>=
    vnoremap <unique> <silent>  <Plug>TdvimResetWindows <C-W>=
    inoremap <unique> <silent>  <Plug>TdvimResetWindows <C-O><C-W>=

    nmap     <silent> <leader>= <Plug>TdvimResetWindows
    vmap     <silent> <leader>= <Plug>TdvimResetWindows
    " }}}

    " Togle menu and toolbar {{{2
    nnoremap <unique> <silent>  <Plug>TdvimToggleMenuBar :call utils#ToggleMenuBar()<CR>

    nmap     <silent> <C-F8>    <Plug>TdvimToggleMenuBar
    nmap     <silent> <leader>m <Plug>TdvimToggleMenuBar
    " }}}

    " Explorer {{{2
    " Keys to toggle browser window. By default NERD Tree file browser
    " By default mapped to F8
    " NERDTree
    nnoremap <unique> <silent> <Plug>TdvimExplorer :NERDTreeToggle<CR>
    inoremap <unique> <silent> <Plug>TdvimExplorer :NERDTreeToggle<CR>i
    vnoremap <unique> <silent> <Plug>TdvimExplorer :NERDTreeToggle<CR>v
    nnoremap <unique> <silent> <Plug>TdvimFocusExplorer :NERDTreeFocus<CR>
    nnoremap <unique> <silent> <Plug>TdvimFindInExplorer :NERDTreeFind<CR>
    "netrw
    "nnoremap <unique> <silent> <Plug>TdvimExplorer :call utils#ToggleVExplorer()<CR>
    "inoremap <unique> <silent> <Plug>TdvimExplorer :call utils#ToggleVExplorer()<CR>i
    "vnoremap <unique> <silent> <Plug>TdvimExplorer :call utils#ToggleVExplorer()<CR>v

    nmap     <silent> <F8>     <Plug>TdvimExplorer
    imap     <silent> <F8>     <Plug>TdvimExplorer
    vmap     <silent> <F8>     <Plug>TdvimExplorer
    nmap     <unique> <silent>                    <leader>e <Plug>TdvimFocusExplorer
    nmap     <unique> <silent>                    <leader>je <Plug>TdvimFocusExplorer
    nmap     <unique> <silent>                    <leader>ef <Plug>TdvimFindInExplorer 
    " }}}

    " In Window Explorer -> - {{{2
    " Open explorer in current window
    " By default mapped to -
    "NERDTree
    nnoremap <unique> <silent> <Plug>TdvimOpenFileInBuffer :e .<CR>
    "netrw
    "nnoremap <unique> <Plug>TdvimOpenFileInBuffer :Explore<CR>

    nmap     <unique> <silent>                    -         <Plug>TdvimOpenFileInBuffer
    " }}}

    " Outliner {{{2
    " Keys to toggle the hirarchical inspector.
    " Mapped to C-S-F8
    "nnoremap <unique> <silent>          <Plug>TdvimOutliner     :FoldDigestToggle<CR>
    "inoremap <unique> <silent>          <Plug>TdvimOutliner     :FoldDigestToggle<CR>i
    "vnoremap <unique> <silent>          <Plug>TdvimOutliner     :FoldDigestToggle<CR>v

    "nmap <silent> <C-S-F8>          <Plug>TdvimOutliner
    "imap <silent> <C-S-F8>          <Plug>TdvimOutliner
    "vmap <silent> <C-S-F8>          <Plug>TdvimOutliner
    " }}}

    " Buffers explorer -> F3 {{{2
    "nnoremap <unique> <silent>  <Plug>TdvimBuffers :CtrlPBuffer<CR>
    "inoremap <unique> <silent>  <Plug>TdvimBuffers <Esc>:CtrlPBuffer<CR>i
    "vnoremap <unique> <silent>  <Plug>TdvimBuffers :CtrlPBuffer<CR>v
    nnoremap <unique> <silent>  <Plug>TdvimBuffers :LeaderfBuffer<CR>
    inoremap <unique> <silent>  <Plug>TdvimBuffers <Esc>:LeaderfBuffer<CR>
    vnoremap <unique> <silent>  <Plug>TdvimBuffers :LeaderfBuffer<CR>
    "nnoremap <unique>   <Plug>TdvimBuffers :buffer 
    "inoremap <unique>   <Plug>TdvimBuffers <Esc>:buffer 
    "vnoremap <unique>   <Plug>TdvimBuffers <Esc>:buffer 

    nmap      <F3>      <Plug>TdvimBuffers
    imap      <F3>      <Plug>TdvimBuffers
    vmap      <F3>      <Plug>TdvimBuffers
    nmap      <leader>b <Plug>TdvimBuffers
    vmap      <leader>b <Plug>TdvimBuffers
    " }}}

    " Terminal -> F7 {{{2
    " TODO: keymaps for Nuake
    nnoremap <unique> <silent>  <Plug>TdvimTerminal :Nuake<CR>
    inoremap <unique> <silent>  <Plug>TdvimTerminal <C-\><C-n>:Nuake<CR>
    tnoremap <unique> <silent>  <Plug>TdvimTerminal <C-\><C-n>:Nuake<CR>

    nmap      <F7>      <Plug>TdvimTerminal
    imap      <F7>      <Plug>TdvimTerminal
    tmap      <F7>      <Plug>TdvimTerminal
    nmap      <C-\>      <Plug>TdvimTerminal
    imap      <C-\>      <Plug>TdvimTerminal
    tmap      <C-\>      <Plug>TdvimTerminal

    tnoremap <F2> <C-w>N:
    tnoremap <F2> <C-w>N:
    " }}}

    " Alternate buffers -> C-F3{{{2
    nnoremap  <unique> <silent>    <Plug>TdvimAlternateBuffer  :e #<CR>
    vnoremap  <unique> <silent>    <Plug>TdvimAlternateBuffer  <Esc>:e #<CR>
    inoremap  <unique> <silent>    <Plug>TdvimAlternateBuffer  <Esc>:e #<CR>

    nmap <silent> <C-F3> <Plug>TdvimAlternateBuffer
    vmap <silent> <C-F3> <Plug>TdvimAlternateBuffer
    imap <silent> <C-F3> <Plug>TdvimAlternateBuffer
    " }}}

    " Close Preview Window {{{2
    nnoremap <unique> <silent> <Plug>TdvimClosePreviewWindow <C-W><C-Z>
    vnoremap <unique> <silent> <Plug>TdvimClosePreviewWindow <C-W><C-Z>
    inoremap <unique> <silent> <Plug>TdvimClosePreviewWindow <C-O><C-W><C-Z>

    nmap <silent> <leader>qp <Plug>TdvimClosePreviewWindow
    vmap <silent> <leader>qp <Plug>TdvimClosePreviewWindow

    " }}}

    " Close Help Window {{{2
    "nnoremap <unique> <silent> <Plug>TdvimCloseHelpWindow :HelpAllClose<CR>
    "vnoremap <unique> <silent> <Plug>TdvimCloseHelpWindow <Esc>:HelpAllClose<CR>
    "inoremap <unique> <silent> <Plug>TdvimCloseHelpWindow <Esc>:HelpAllClose<CR>
    nnoremap <unique> <silent> <Plug>TdvimCloseHelpWindow :TdvimCloseWindowType help<CR>
    vnoremap <unique> <silent> <Plug>TdvimCloseHelpWindow <Esc>:TdvimCloseWindowType help<CR>
    inoremap <unique> <silent> <Plug>TdvimCloseHelpWindow <Esc>:TdvimCloseWindowType help<CR>

    nmap <silent> <leader>qh <Plug>TdvimCloseHelpWindow
    vmap <silent> <leader>qh <Plug>TdvimCloseHelpWindow
    " }}}

    " Close QuickFix Window {{{2
    "nnoremap <unique> <silent> <Plug>TdvimCloseHelpWindow :HelpAllClose<CR>
    "vnoremap <unique> <silent> <Plug>TdvimCloseHelpWindow <Esc>:HelpAllClose<CR>
    "inoremap <unique> <silent> <Plug>TdvimCloseHelpWindow <Esc>:HelpAllClose<CR>
    "nnoremap <unique> <silent> <Plug>TdvimCloseQuickfixWindow :TdvimCloseWindowType quickfix<CR>
    "vnoremap <unique> <silent> <Plug>TdvimCloseQuickfixWindow <Esc>:TdvimCloseWindowType quickfix<CR>
    "inoremap <unique> <silent> <Plug>TdvimCloseQuickfixWindow <Esc>:TdvimCloseWindowType quickfix<CR>
    nnoremap <unique> <silent> <Plug>TdvimCloseQuickfixWindow :cclose<CR>
    vnoremap <unique> <silent> <Plug>TdvimCloseQuickfixWindow <Esc>:cclose<CR>
    inoremap <unique> <silent> <Plug>TdvimCloseQuickfixWindow <Esc>:cclose<CR>

    nmap <silent> <leader>qq <Plug>TdvimCloseQuickfixWindow
    vmap <silent> <leader>qq <Plug>TdvimCloseQuickfixWindow
    " }}}

    " Close Location Window {{{2
    "nnoremap <unique> <silent> <Plug>TdvimCloseHelpWindow :HelpAllClose<CR>
    "vnoremap <unique> <silent> <Plug>TdvimCloseHelpWindow <Esc>:HelpAllClose<CR>
    "inoremap <unique> <silent> <Plug>TdvimCloseHelpWindow <Esc>:HelpAllClose<CR>
    nnoremap <unique> <silent> <Plug>TdvimCloseLocationWindow :lclose<CR>
    vnoremap <unique> <silent> <Plug>TdvimCloseLocationWindow <Esc>:lclose<CR>
    inoremap <unique> <silent> <Plug>TdvimCloseLocationWindow <Esc>:lclose<CR>

    nmap <silent> <leader>ql <Plug>TdvimCloseLocationWindow
    vmap <silent> <leader>ql <Plug>TdvimCloseLocationWindow
    " }}}

    " Close Previous Window {{{2
    nnoremap <unique> <silent> <Plug>TdvimClosePreviousWindow :call utils#ClosePreviousWindow()<CR>
    vnoremap <unique> <silent> <Plug>TdvimClosePreviousWindow <Esc>:call utils#ClosePreviousWindow()<CR>
    inoremap <unique> <silent> <Plug>TdvimClosePreviousWindow <Esc>:call utils#ClosePreviousWindow()<CR>

    nmap <silent> <leader>qw <Plug>TdvimClosePreviousWindow
    vmap <silent> <leader>qw <Plug>TdvimClosePreviousWindow
    " }}}

    " Jump to QuickFix Window {{{2
    nnoremap <unique> <silent> <Plug>TdvimJumpToQuickfixWindow :call utils#JumpToWindowsByType( "quickfix" )<CR>
    vnoremap <unique> <silent> <Plug>TdvimJumpToQuickfixWindow <Esc>:call utils#JumpToWindowsByType( "quickfix" )<CR>
    inoremap <unique> <silent> <Plug>TdvimJumpToQuickfixWindow <Esc>:call utils#JumpToWindowsByType( "quickfix" )<CR>

    nmap <silent> <leader>jq <Plug>TdvimJumpToQuickfixWindow 
    vmap <silent> <leader>jq <Plug>TdvimJumpToQuickfixWindow
    " }}}

    " Jump to Location List Window {{{2
    nnoremap <unique> <silent> <Plug>TdvimJumpToLocationWindow :call utils#JumpToWindowsByType( "location" )<CR>
    vnoremap <unique> <silent> <Plug>TdvimJumpToLocationWindow <Esc>:call utils#JumpToWindowsByType( "location" )<CR>
    inoremap <unique> <silent> <Plug>TdvimJumpToLocationWindow <Esc>:call utils#JumpToWindowsByType( "location" )<CR>

    nmap <silent> <leader>jl <Plug>TdvimJumpToLocationWindow 
    vmap <silent> <leader>jl <Plug>TdvimJumpToLocationWindow
    " }}}

    " Jump to Preview Window {{{2
    nnoremap <unique> <silent> <Plug>TdvimJumpToPreviewWindow :call utils#JumpToWindowsByType( "preview" )<CR>
    vnoremap <unique> <silent> <Plug>TdvimJumpToPreviewWindow <Esc>:call utils#JumpToWindowsByType( "preview" )<CR>
    inoremap <unique> <silent> <Plug>TdvimJumpToPreviewWindow <Esc>:call utils#JumpToWindowsByType( "preview" )<CR>

    nmap <silent> <leader>jp <Plug>TdvimJumpToPreviewWindow 
    vmap <silent> <leader>jp <Plug>TdvimJumpToPreviewWindow
    " }}}

    " Leaderf Comands Window {{{2
    " Comands menu for LeaderF search commands 
    " By default mapped to S-F7

    nmap      <S-F7>     :LeaderfSelf<CR>
    imap      <S-F7>     <Esc>:LeaderfSelf<CR>
    vmap      <S-F7>     :LeaderfSelf<CR>
    " }}}

endfunction
" }}}

" CommandLine {{{
" Keymaps to work fro mthe command line
function! keymaps#CommandLine()
    " Seems the <Plug> form doesnt works well with command line maps

    " Shell line navigation style {{{2
    cnoremap  <unique>      <Plug>TdvimCmdLHome     <Home>
    cnoremap  <unique>      <Plug>TdvimCmdLEnd      <End>

    cmap  <C-A>     <Plug>TdvimCmdLHome
    cmap  <C-E>     <Plug>TdvimCmdLEnd
    "
    " }}}

    " Paste into command line {{{2
    cnoremap  <unique> <silent>     <Plug>TdvimCmdLPaste    <C-R>+

    cmap  <C-V>     <Plug>TdvimCmdLPaste
    " }}}

endfunction
" }}}

" Modes {{{
" Operatiosn to change between modes
function! keymaps#Modes()
    " Jump to command line
    nnoremap  <unique>      <Plug>TdvimJumpCmdLMode     :
    vnoremap  <unique>      <Plug>TdvimJumpCmdLMode     :
    inoremap  <unique>      <Plug>TdvimJumpCmdLMode     <Esc>:
    " Jump visual mode
    nnoremap  <unique>      <Plug>TdvimJumpVMode        <Esc>v
    vnoremap  <unique>      <Plug>TdvimJumpVMode        <Esc>v
    inoremap  <unique>      <Plug>TdvimJumpVMode        <Esc>v
    " Jump visual block mode
    nnoremap  <unique>      <Plug>TdvimJumpVBlockMode   <Esc><C-v>
    vnoremap  <unique>      <Plug>TdvimJumpVBlockMode   <Esc><C-v>
    inoremap  <unique>      <Plug>TdvimJumpVBlockMode   <Esc><c-v>
    " Jump to command palette
    "nnoremap  <unique>      <Plug>TdvimJumpCmdPalette   :CtrlPCmdPalette<CR>
    "vnoremap  <unique>      <Plug>TdvimJumpCmdPalette   :CtrlPCmdPalette<CR>
    "inoremap  <unique>      <Plug>TdvimJumpCmdPalette   <Esc>:CtrlPCmdPalette<CR>
    nnoremap  <unique>      <Plug>TdvimJumpCmdPalette   :LeaderfHistoryCmd<CR>
    vnoremap  <unique>      <Plug>TdvimJumpCmdPalette   :LeaderfHistoryCmd<CR>
    inoremap  <unique>      <Plug>TdvimJumpCmdPalette   <Esc>:LeaderfHistoryCmd<CR>

    " Default mapping:
    " F2 : Jump to command line
    " S-F2 : Jump to visual block
    " C-F2 : Command History
    nmap  <F2>              <Plug>TdvimJumpCmdLMode
    vmap  <F2>              <Plug>TdvimJumpCmdLMode
    imap  <F2>              <Plug>TdvimJumpCmdLMode
    nmap  <C-F2>            <Plug>TdvimJumpCmdPalette
    vmap  <C-F2>            <Plug>TdvimJumpCmdPalette
    imap  <C-F2>            <Plug>TdvimJumpCmdPalette
    nmap  <S-F2>            <Plug>TdvimJumpVBlockMode
    vmap  <S-F2>            <Plug>TdvimJumpVBlockMode
    imap  <S-F2>            <Plug>TdvimJumpVBlockMode

endfunction
" }}}

" Edit {{{
" Keymaps for editing operations
function! keymaps#Edit()
    
    " Add lines {{{2
    " Add lines being in normal mode, after or before the current one.
    " XXX: Done by unimpaired plugin
    "nnoremap <unique> <silent>   <Plug>TdvimNextLines    o<Esc>
    "nnoremap <unique> <silent>   <Plug>TdvimBackLines    O<Esc>

    "nmap <silent> <C-M-CR> <Plug>TdvimNextLines
    "nmap <silent> <M-S-CR> <Plug>TdvimBackLines
    " }}}

    " Alignments {{{2
    " Enter interactive align mode using easy align plugin
    " To enter in interactive alignement press Enter in visual mode
    "
    "" Align to left/right/center in visual mode
    vnoremap <unique> <silent> <Plug>TdvimAlignMode :LiveEasyAlign<CR>
    nnoremap <unique> <silent> <Plug>TdvimAlignMode :LiveEasyAlign<CR>

    vmap <silent> <Enter>   <Plug>TdvimAlignMode
    nmap <silent> <leader>a <Plug>TdvimAlignMode
    vmap <silent> <leader>a <Plug>TdvimAlignMode

    " }}}

    " Surround {{{2
    " Surround commands
    " Not assigned
    "xnoremap  <unique>    <Plug>TdvimQuoteSurround             S'
    "nnoremap  <unique>    <Plug>TdvimQuoteSurround             ysiw'
    "inoremap  <unique>    <Plug>TdvimQuoteSurround             <Esc>viwS'eea
    "xnoremap  <unique>    <Plug>TdvimParenthesisSurround       S)
    "nnoremap  <unique>    <Plug>TdvimParenthesisSurround       viwS)
    inoremap <unique> <Plug>TdvimParenthesisSurround    <Esc>viwS)eea

    nmap     <silent> <leader>' ysiw'
    vmap     <silent> <leader>' S'
    nmap     <silent> <leader>" ysiw"
    vmap     <silent> <leader>" S"
    nmap     <silent> <leader>) ysiw)
    vmap     <silent> <leader>) S)
    nmap     <silent> <leader>( ysiw(
    vmap     <silent> <leader>( S(
    nmap     <silent> <leader>] ysiw]
    vmap     <silent> <leader>] S]
    nmap     <silent> <leader>[ ysiw[
    vmap     <silent> <leader>[ S[
    nmap     <silent> <leader>} ysiw}
    vmap     <silent> <leader>} S}
    nmap     <silent> <leader>{ ysiw{
    vmap     <silent> <leader>{ S{
    nmap     <silent> <leader>> ysiw>
    vmap     <silent> <leader>> S>
    nmap     <silent> <leader>< ysiw<
    vmap     <silent> <leader>< S<
    " }}}

    " Delete in Visual using Backspace and Del. Delete words with Ctrl-Back{{{2
    " Delete on visual mode using Del or Backspace
    " XXX: set by mswin.vim
    "vnoremap <unique> <silent>  <Plug>TdvimVDelV d
    "vmap <silent>      <BS>    <Plug>TdvimVDelV
    "vmap <silent>      <Del>   <Plug>TdvimVDelV

    "word deletion
    " Delete words using Ctrl-Backspace or Control-Spr
    " No work on terminals
    noremap <unique> <silent>   <Plug>TdvimWordBackspace db
    noremap <unique> <silent>   <Plug>TdvimWordDelete de
    inoremap <unique> <silent>  <Plug>TdvimWordBackspace <C-w>
    inoremap <unique> <silent>  <Plug>TdvimWordDelete _<Esc>mzew<BS>i<Del><Esc>v`z"_c

    imap <silent>       <C-BS>  <Plug>TdvimWordBackspace
    nmap <silent>       <C-BS>  <Plug>TdvimWordBackspace
    nmap <silent>       <C-Del> <Plug>TdvimWordDelete
    imap <silent>       <C-Del> <Plug>TdvimWordDelete
    " }}}

    " Copy/Cut/Paste {{{2
    " XXX: set by mswin.vim
    " Easy copy/paste using Ctrl-C/X/V
    " normal copy/paste
    "vnoremap <unique> <silent>   <Plug>TdvimCopySelection   "0ygv"+ygv"*yi
    "vnoremap <unique> <silent>   <Plug>TdvimCutSelection    "+d:let @*=@+<CR>:let @0=@+<CR>i
    "inoremap <unique> <silent>   <Plug>TdvimPasteSelection  <C-O>"+p<Right>
    
    "vmap <silent>    <C-c>   <Plug>TdvimCopySelection
    "vmap <silent>    <C-x>   <Plug>TdvimCutSelection
    "imap <silent>    <C-v>   <Plug>TdvimPasteSelection 

    " }}}

    " Jump To Start/End File{{{2
    nnoremap <unique> <silent>   <Plug>TdvimJumpStart gg
    nnoremap <unique> <silent>   <Plug>TdvimJumpEnd   G 
    vnoremap <unique> <silent>   <Plug>TdvimJumpStart <Esc>gg
    vnoremap <unique> <silent>   <Plug>TdvimJumpEnd   <Esc>G

    nmap <silent>  <C-PageUp>           <Plug>TdvimJumpStart 
    nmap <silent>  <C-PageDown>         <Plug>TdvimJumpEnd
    "vmap <silent>  <C-PageUp>          <Plug>TdvimJumpStart 
    "vmap <silent>  <C-PageDown>                <Plug>TdvimJumpEnd
    " }}}

    " Indentation Jump{{{2
    " Jump to next or previous line with the same or less indentation
    " Next or previous line with same indentation
    nnoremap <unique> <silent>   <Plug>TdvimNextIndentLine          :call utils#NextIndent(0, 1, 0, 1)<CR>
    nnoremap <unique> <silent>   <Plug>TdvimPrevIndentLine          :call utils#NextIndent(0, 0, 0, 1)<CR>
    vnoremap <unique> <silent>   <Plug>TdvimNextIndentLine          <Esc>:call utils#NextIndent(0, 1, 0, 1)<CR>m'gv''
    vnoremap <unique> <silent>   <Plug>TdvimPrevIndentLine          <Esc>:call utils#NextIndent(0, 0, 0, 1)<CR>m'gv''
    onoremap <unique> <silent>   <Plug>TdvimNextIndentLine          :call utils#NextIndent(0, 1, 0, 1)<CR>
    onoremap <unique> <silent>   <Plug>TdvimPrevIndentLine          :call utils#NextIndent(0, 0, 0, 1)<CR>
    " Next or previous line with one leve less indentation
    nnoremap <unique> <silent>   <Plug>TdvimNextLessIndentLine  :call utils#NextIndent(0, 1, 1, 1)<CR>
    nnoremap <unique> <silent>   <Plug>TdvimPrevLessIndentLine  :call utils#NextIndent(0, 0, 1, 1)<CR>
    vnoremap <unique> <silent>   <Plug>TdvimNextLessIndentLine  <Esc>:call utils#NextIndent(0, 1, 1, 1)<CR>m'gv''
    vnoremap <unique> <silent>   <Plug>TdvimPrevLessIndentLine  <Esc>:call utils#NextIndent(0, 0, 1, 1)<CR>m'gv''
    onoremap <unique> <silent>   <Plug>TdvimNextLessIndentLine  :call utils#NextIndent(1, 1, 1, 1)<CR>
    onoremap <unique> <silent>   <Plug>TdvimPrevLessIndentLine  :call utils#NextIndent(1, 0, 1, 1)<CR>


    nmap <silent>       [l      <Plug>TdvimPrevIndentLine
    nmap <silent>       ]l      <Plug>TdvimNextIndentLine
    nmap <silent>       [L      <Plug>TdvimPrevLessIndentLine
    nmap <silent>       ]L      <Plug>TdvimNextLessIndentLine
    vmap <silent>       [l      <Plug>TdvimPrevIndentLine
    vmap <silent>       ]l      <Plug>TdvimNextIndentLine
    vmap <silent>       [L      <Plug>TdvimPrevLessIndentLine
    vmap <silent>       ]L      <Plug>TdvimNextLessIndentLine
    omap <silent>       [l      <Plug>TdvimPrevIndentLine
    omap <silent>       ]l      <Plug>TdvimNextIndentLine
    omap <silent>       [L      <Plug>TdvimPrevLessIndentLine
    omap <silent>       ]L      <Plug>TdvimNextLessIndentLine


    " }}}

    " Selections {{{2
    " Shift selection {{{
    " XXX: set by mswin.vim
    " Select going up and down using Shift-Up and Shift-Down
    "nnoremap <unique> <silent>   <Plug>TdvimRightSelection         v
    "nnoremap <unique> <silent>   <Plug>TdvimLeftSelection          v
    "nnoremap <unique> <silent>   <Plug>TdvimUpSelection            v<Up>
    "nnoremap <unique> <silent>   <Plug>TdvimDownSelection          v<Down>
    "inoremap <unique> <silent>   <Plug>TdvimRightSelection         <Esc><Right>v
    "inoremap <unique> <silent>   <Plug>TdvimLeftSelection          <Esc>v<Left>
    "inoremap <unique> <silent>   <Plug>TdvimUpSelection            <Esc>v<Up>
    "inoremap <unique> <silent>   <Plug>TdvimDownSelection          <Esc>v<Down>
    "vnoremap <unique> <silent>   <Plug>TdvimRightSelection         <Right>
    "vnoremap <unique> <silent>   <Plug>TdvimLeftSelection          <Left>
    "vnoremap <unique> <silent>   <Plug>TdvimUpSelection            <Up>
    "vnoremap <unique> <silent>   <Plug>TdvimDownSelection          <Down>

    "nmap <silent>      <S-Right>       <Plug>TdvimRightSelection
    "nmap <silent>      <S-Left>        <Plug>TdvimLeftSelection
    "nmap <silent>      <S-Up>          <Plug>TdvimUpSelection
    "nmap <silent>      <S-Down>        <Plug>TdvimDownSelection
    "imap <silent>      <S-Right>       <Plug>TdvimRightSelection
    "imap <silent>      <S-Left>        <Plug>TdvimLeftSelection
    "imap <silent>      <S-Up>          <Plug>TdvimUpSelection
    "imap <silent>      <S-Down>        <Plug>TdvimDownSelection
    "vmap <silent>      <S-Right>       <Plug>TdvimRightSelection
    "vmap <silent>      <S-Left>        <Plug>TdvimLeftSelection
    "vmap <silent>      <S-Up>          <Plug>TdvimUpSelection
    "vmap <silent>      <S-Down>        <Plug>TdvimDownSelection

    " }}}

    "home/end selection {{{
    " XXX: set by mswin.vim
    " Select to the end or start of the line using Shift-End or
    " Shift-Home respectively 
    " Select to the start or end of the file  using Ctrl-Shift-End or
    " Ctrl-Shift-Home respectively
    " This settings don't work with the terminal due to some limitations of
    " terminal emulators
    "nnoremap <unique> <silent>   <Plug>TdvimHomeSelection          v<Home>
    "nnoremap <unique> <silent>   <Plug>TdvimEndSelection           v<End>
    "inoremap <unique> <silent>   <Plug>TdvimHomeSelection          <Esc>v<Home>
    "inoremap <unique> <silent>   <Plug>TdvimEndSelection           <Esc><Right>v<End>
    "nnoremap <unique> <silent>   <Plug>TdvimTopSelection           vgg<Home>
    "nnoremap <unique> <silent>   <Plug>TdvimBottomSelection        vG<End>
    "inoremap <unique> <silent>   <Plug>TdvimTopSelection           <Esc>vgg<Home>
    "inoremap <unique> <silent>   <Plug>TdvimBottomSelection        <Esc><Right>vG<End>

    "nmap       <S-Home>    <Plug>TdvimHomeSelection
    "nmap       <S-End>     <Plug>TdvimEndSelection
    "imap       <S-Home>    <Plug>TdvimHomeSelection
    "imap       <S-End>     <Plug>TdvimEndSelection
    "nmap       <C-S-Home>  <Plug>TdvimTopSelection
    "nmap       <C-S-End>   <Plug>TdvimBottomSelection
    "imap       <C-S-Home>  <Plug>TdvimTopSelection
    "imap       <C-S-End>   <Plug>TdvimBottomSelection

    " }}}

    "half page down/up selection {{{
    " XXX: set by mswin.vim
    " Select pages usinf Shit-PgUp or Shit-PgDown 
    " Same problem here as with the Home/End mappings. Don't work on terminals
    "nnoremap <unique> <silent>   <Plug>TdvimPgUpSelection          v<C-U><Home>
    "nnoremap <unique> <silent>   <Plug>TdvimPgDownSelection        v<C-D><End>
    "vnoremap <unique> <silent>   <Plug>TdvimPgUpSelection          <C-U><Home>
    "vnoremap <unique> <silent>   <Plug>TdvimPgDownSelection        <C-D><End>
    "vnoremap <unique> <silent>   <Plug>TdvimPgUp                   <C-U><Home>
    "vnoremap <unique> <silent>   <Plug>TdvimPgDown                 <C-D><End>
    "inoremap <unique> <silent>   <Plug>TdvimPgUpSelection          <Esc>v<C-U><Home>
    "inoremap <unique> <silent>   <Plug>TdvimPgDownSelection        <Esc>v<C-D><End>

    "nmap <S-PageDown>   <Plug>TdvimPgDownSelection
    "nmap <S-PageUp>    <Plug>TdvimPgUpSelection
    "vmap <S-PageDown>   <Plug>TdvimPgDownSelection
    "vmap <S-PageUp>    <Plug>TdvimPgUpSelection
    "vmap <PageDown>    <Plug>TdvimPgDown
    "vmap <PageUp>      <Plug>TdvimPgUp
    "imap <S-PageDown>   <Plug>TdvimPgDownSelection
    "imap <S-PageUp>    <Plug>TdvimPgUpSelection

    " }}}

    "word selection {{{
    " XXX: set by mswin.vim
    " Select word to the left and right wit Ctrl-Left or Ctrl-Right
    "nmap <C-S-Left> vbge<Space>
    "nnoremap <unique> <silent>   <Plug>TdvimCtrlLeftSelection      vb
    "nnoremap <unique> <silent>   <Plug>TdvimCtrlRightSelection     ve
    "vnoremap <unique> <silent>   <Plug>TdvimCtrlLeftSelection      b
    "vnoremap <unique> <silent>   <Plug>TdvimCtrlRightSelection     e
    "inoremap <unique> <silent>   <Plug>TdvimCtrlLeftSelection      <Esc><Left>vb
    "inoremap <unique> <silent>   <Plug>TdvimCtrlRightSelection     <Esc><Right>ve

    "nmap       <C-S-Left>      <Plug>TdvimCtrlLeftSelection
    "nmap       <C-S-Right>     <Plug>TdvimCtrlRightSelection
    "vmap       <C-S-Left>      <Plug>TdvimCtrlLeftSelection
    "vmap       <C-S-Right>     <Plug>TdvimCtrlRightSelection
    "imap       <C-S-Left>      <Plug>TdvimCtrlLeftSelection
    "imap       <C-S-Right>     <Plug>TdvimCtrlRightSelection

    " }}}

    " Select all text {{{
    " XXX: set by mswin.vim
    "nnoremap <unique> <silent>   <Plug>TdvimAllSelection       ggVG
    "vnoremap <unique> <silent>   <Plug>TdvimAllSelection       <Esc>ggVG 
    "inoremap <unique> <silent>   <Plug>TdvimAllSelection       <Esc>ggVG 

    "nmap       <C-a>       <Plug>TdvimAllSelection
    "vmap       <C-a>       <Plug>TdvimAllSelection
    "imap       <C-a>       <Plug>TdvimAllSelection
    " }}}

    " }}}

    " Search using incsearch and anzu {{{2
    " Advanced search using incsearch and anzu plugins
    " FIXME: this is causing issues at the moment, gvim crashes, disable all anzu keymaps and the plugin
    " map <silent>   /           <Plug>(incsearch-forward)
    " map <silent>   ?           <Plug>(incsearch-backward)
    " map <silent>   g/          <Plug>(incsearch-stay)
    " map <silent>   n           <Plug>(incsearch-nohl)<Plug>(anzu-n-with-echo)
    " map <silent>   N           <Plug>(incsearch-nohl)<Plug>(anzu-N-with-echo)
    " map <silent>   *           <Plug>(incsearch-nohl-*)
    " map <silent>   #           <Plug>(incsearch-nohl-#)
    " map <silent>   g*          <Plug>(incsearch-nohl-g*)
    " map <silent>   g#          <Plug>(incsearch-nohl-g#)


    " }}}

    " Search & Replace (Disabled){{{2
    " XXX: set by mswin.vim
    " Smart search and replace
    " With Ctrl-R we make a search and replace of the word under the cursor. Just
    " type the new word in the command line

    "nnoremap  <unique> <silent>    <Plug>TdvimSearchReplace  :%s/<C-R><C-A>//g<Left><Left>
    "vnoremap  <unique> <silent>    <Plug>TdvimSearchReplace  :%s/<C-R>*//g<Left><Left>
    "inoremap  <unique> <silent>    <Plug>TdvimSearchReplace  <Esc>:%s/<C-R><C-A>//g<Left><Left>

    "if has("win32") || has("win64")
        "" For windows
        "nmap <silent>    <C-R>   <Plug>TdvimSearchReplace
        "vmap <silent>    <C-R>   <Plug>TdvimSearchReplace
        "imap <silent>    <C-R>   <Plug>TdvimSearchReplace
    "elseif has("mac") || has("macunix") " TODO Untested on Mac
        "" For Mac OS X
        "nmap <silent>    <C-R>   <Plug>TdvimSearchReplace
        "vmap <silent>    <C-R>   <Plug>TdvimSearchReplace
        "imap <silent>    <C-R>   <Plug>TdvimSearchReplace
    "elseif has("unix") || has("win32unix")
        "" For Unix
        "nmap <silent>    <C-R>   <Plug>TdvimSearchReplace
        "vmap <silent>    <C-R>   <Plug>TdvimSearchReplace
        "imap <silent>    <C-R>   <Plug>TdvimSearchReplace
    "else
        "nmap <silent>    <C-R>   <Plug>TdvimSearchReplace
        "vmap <silent>    <C-R>   <Plug>TdvimSearchReplace
        "imap <silent>    <C-R>   <Plug>TdvimSearchReplace
    "endif

    " }}}
    
    " File History {{{2
    " Default map to C-S-F4
    nnoremap  <unique> <silent>    <Plug>TdvimHistory  :GundoToggle<CR>
    vnoremap  <unique> <silent>    <Plug>TdvimHistory  <Esc>:GundoToggle<CR>
    inoremap  <unique> <silent>    <Plug>TdvimHistory  <Esc>:GundoToggle<CR>


    nmap <silent>    <C-S-F4>  <Plug>TdvimHistory
    vmap <silent>    <C-S-F4>  <Plug>TdvimHistory
    imap <silent>    <C-S-F4>  <Plug>TdvimHistory

    " }}}

endfunction
" }}}

" TextNavigation {{{
function! keymaps#TextNavigation()

    " Search in files- F4{{{2
    " Search word under cursor or selection
    " Default mapped to F4
    " DEPRECATED
    "nnoremap <unique>  <Plug>TdvimSearch :TdvimSearch <C-R><C-W>
    "inoremap <unique>  <Plug>TdvimSearch <Esc>:TdvimSearch  <C-R><C-W>
    "vnoremap <unique>  <Plug>TdvimSearch :TdvimSearch <C-R><C-W>

    "nmap     <F6>      <Plug>TdvimSearch
    "nmap     <leader>f <Plug>TdvimSearch
    "imap     <F6>      <Plug>TdvimSearch
    "vmap     <F6>      <Plug>TdvimSearch
    "vmap     <leader>f <Plug>TdvimSearch
    " }}}

    " Grep - F4{{{2
    " Grep word under cursor or selection
    " Default mapped to F4
    "nnoremap <unique>   <Plug>TdvimGrep :Grepper -open -query <C-R><C-W><CR>
    "inoremap <unique>   <Plug>TdvimGrep <Esc>:Grepper -cword -open <CR>
    "vnoremap <unique>   <Plug>TdvimGrep :Grepper -cword -open <CR>
    nnoremap <unique>   <Plug>TdvimGrep :lgrep <C-R><C-W><CR>:lopen<CR>
    inoremap <unique>   <Plug>TdvimGrep <Esc>:lgrep -cword <CR>:lopen<CR>
    vnoremap <unique>   <Plug>TdvimGrep :lgrep -cword <CR>:lopen<CR>

    nmap <F4>      <Plug>TdvimGrep
    nmap <leader>g <Plug>TdvimGrep
    nmap <leader>f <Plug>TdvimGrep
    imap <F4>      <Plug>TdvimGrep
    vmap <F4>      <Plug>TdvimGrep
    vmap <leader>g <Plug>TdvimGrep
    vmap <leader>f <Plug>TdvimGrep
    " }}}

    " Navigate Grep results. Navigate Location list entries {{{2
    " Default mapped to []s
    nnoremap <unique> <silent> <Plug>TdvimPrevSearch <C-O>
    nnoremap <unique> <silent> <Plug>TdvimNextSearch <C-I>
    ""nnoremap <unique> <silent> <Plug>TdvimJumps    :CtrlPChange<CR>
    ""inoremap <unique> <silent> <Plug>TdvimJumps    <Esc>:CtrlPChange<CR>
    ""vnoremap <unique> <silent> <Plug>TdvimJumps    <Esc>:CtrlPChange<CR>

    nmap <silent> [s :lprev<CR>
    nmap <silent> ]s :lnext<CR>
    nmap <silent> [S :lfirst<CR>
    nmap <silent> ]S :llast<CR>
    " }}}

    " Grep Operator - gs{{{2
    " Grep operator, works with motions and text objects in normal mode:
    " gsW, gsiw, gsi", etc ...
    " Use selection in visual mode
    " Default mapped to gs
    nmap gs  <plug>(GrepperOperator)
    xmap gs  <plug>(GrepperOperator)

    " }}}

    " Navigate Changes {{{2
    " Default mapped to []c
    nnoremap <unique> <silent> <Plug>TdvimPrevChange g;
    inoremap <unique> <silent> <Plug>TdvimPrevChange <Esc>g;
    vnoremap <unique> <silent> <Plug>TdvimPrevChange g;
    nnoremap <unique> <silent> <Plug>TdvimNextChange g,
    inoremap <unique> <silent> <Plug>TdvimNextChange <Esc>g,
    vnoremap <unique> <silent> <Plug>TdvimNextChange g,
    ""nnoremap <unique> <silent> <Plug>TdvimChanges    :CtrlPChange<CR>
    ""inoremap <unique> <silent> <Plug>TdvimChanges    <Esc>:CtrlPChange<CR>
    ""vnoremap <unique> <silent> <Plug>TdvimChanges    <Esc>:CtrlPChange<CR>
    nnoremap <unique> <silent> <Plug>TdvimChanges    :changes<CR>
    inoremap <unique> <silent> <Plug>TdvimChanges    <Esc>:changes<CR>
    vnoremap <unique> <silent> <Plug>TdvimChanges    <Esc>:changes<CR>

    "nmap <silent> <C-F4>            <Plug>TdvimPrevChanges
    "imap <silent> <C-F4>            <Plug>TdvimPrevChanges
    "vmap <silent> <C-F4>            <Plug>TdvimPrevChanges
    nmap <silent> [c <Plug>TdvimPrevChange
    imap <silent> [c <Plug>TdvimPrevChange
    vmap <silent> [c <Plug>TdvimPrevChange
    "nmap <silent> <C-S-F4>            <Plug>TdvimNextChange
    "imap <silent> <C-S-F4>            <Plug>TdvimNextChange
    "vmap <silent> <C-S-F4>            <Plug>TdvimNextChange
    nmap <silent> ]c <Plug>TdvimNextChange
    imap <silent> ]c <Plug>TdvimNextChange
    vmap <silent> ]c <Plug>TdvimNextChange
    "nmap <silent>   <C-F4> <Plug>TdvimChanges
    "imap <silent>   <C-F4> <Plug>TdvimChanges
    "vmap <silent>   <C-F4> <Plug>TdvimChanges
    nmap <leader>fc <Plug>TdvimChanges
    vmap <leader>fc <Plug>TdvimChanges
    " }}}

    " Navigate hunks using Git Gutter {{{2
    nmap [h <Plug>(GitGutterPrevHunk)
    nmap ]h <Plug>(GitGutterNextHunk)

    " }}}

    " Navigate Jumps {{{2
    " Default mapped to []j
    nnoremap <unique> <silent> <Plug>TdvimPrevJump <C-O>
    nnoremap <unique> <silent> <Plug>TdvimNextJump <C-I>
    ""nnoremap <unique> <silent> <Plug>TdvimJumps    :CtrlPChange<CR>
    ""inoremap <unique> <silent> <Plug>TdvimJumps    <Esc>:CtrlPChange<CR>
    ""vnoremap <unique> <silent> <Plug>TdvimJumps    <Esc>:CtrlPChange<CR>

    nmap <silent> [j <Plug>TdvimPrevJump
    nmap <silent> ]j <Plug>TdvimNextJump
    " }}}

    " Navigate Lines {{{2
    " Default mapped to S-F4
    "nnoremap <unique> <silent> <Plug>TdvimLines    :CtrlPLine<CR>
    "inoremap <unique> <silent> <Plug>TdvimLines    <Esc>:CtrlPLine<CR>
    "vnoremap <unique> <silent> <Plug>TdvimLines    <Esc>:CtrlPLine<CR>
    nnoremap <unique> <silent> <Plug>TdvimLines    :LeaderfLine<CR>
    inoremap <unique> <silent> <Plug>TdvimLines    <Esc>:LeaderfLine<CR>
    vnoremap <unique> <silent> <Plug>TdvimLines    <Esc>:LeaderfLine<CR>

    nmap <silent>   <S-F4> <Plug>TdvimLines
    imap <silent>   <S-F4> <Plug>TdvimLines
    vmap <silent>   <S-F4> <Plug>TdvimLines
    nmap <leader>fl <Plug>TdvimLines
    vmap <leader>fl <Plug>TdvimLines
    " }}}
endfunction
" }}}

" Development {{{
" Operations usaully used when programing
function! keymaps#Development()

    " Build Next/Previous Error from error list (Quickfix) - F11 {{{2
    " Using F11
    nnoremap <unique> <Plug>TdvimBuild       :TdvimMake<CR>
    vnoremap <unique> <Plug>TdvimBuild       <Esc>:TdvimMake<CR>
    inoremap <unique> <Plug>TdvimBuild       <Esc>:TdvimMake<CR>
    nnoremap <unique> <Plug>TdvimNextError   :cnext<CR>
    vnoremap <unique> <Plug>TdvimNextError   <Esc>:cnext<CR>
    inoremap <unique> <Plug>TdvimNextError   <Esc>:cnext<CR>
    nnoremap <unique> <Plug>TdvimPrevError   :cprevious<CR>
    vnoremap <unique> <Plug>TdvimPrevError   <Esc>:cprevious<CR>
    inoremap <unique> <Plug>TdvimPrevError   <Esc>:cprevious<CR>
    "nnoremap <unique> <Plug>TdvimBuildErrors :QToggle<CR>
    "vnoremap <unique> <Plug>TdvimBuildErrors <Esc>:QToggle<CR>A

    nmap     <silent> <F11>                  <Plug>TdvimBuild
    vmap     <silent> <F11>                  <Plug>TdvimBuild
    imap     <silent> <F11>                  <Plug>TdvimBuild
    nmap     <silent> <C-F11>                <Plug>TdvimNextError
    nmap     <silent> <S-F11>                <Plug>TdvimPrevError
    vmap     <silent> <C-F11>                <Plug>TdvimNextError
    vmap     <silent> <S-F11>                <Plug>TdvimPrevError
    imap     <silent> <C-F11>                <Plug>TdvimNextError
    imap     <silent> <S-F11>                <Plug>TdvimPrevError
    "nmap     <silent> <C-S-F11>              <Plug>TdvimBuildErrors
    "vmap     <silent> <C-S-F11>              <Plug>TdvimBuildErrors
    " }}}
    
    " Syntax Next/Previous Error from error list (Location) - F10{{{2
    " Using F10
    "nnoremap <unique> <Plug>TdvimCheckSyntax     :Errors<CR>
    "vnoremap <unique> <Plug>TdvimCheckSyntax     <Esc>:Errors<CR>
    "inoremap <unique> <Plug>TdvimCheckSyntax     <Esc>:Errors<CR>
    "nnoremap <unique> <Plug>TdvimNextSyntaxError :lnext<CR>
    "vnoremap <unique> <Plug>TdvimNextSyntaxError <Esc>:lnext<CR>
    "inoremap <unique> <Plug>TdvimNextSyntaxError <Esc>:lnext<CR>
    "nnoremap <unique> <Plug>TdvimPrevSyntaxError :lprevious<CR>
    "vnoremap <unique> <Plug>TdvimPrevSyntaxError <Esc>:lprevious<CR>
    "inoremap <unique> <Plug>TdvimPrevSyntaxError <Esc>:lprevious<CR>
    "nnoremap <unique> <Plug>TdvimSyntaxErrors    :LToggle<CR>
    "vnoremap <unique> <Plug>TdvimSyntaxErrors    <Esc>:LToggle<CR>A

    "nmap     <silent> <F10>                      <Plug>TdvimCheckSyntax
    "vmap     <silent> <F10>                      <Plug>TdvimCheckSyntax
    "imap     <silent> <F10>                      <Plug>TdvimCheckSyntax
    "nmap     <silent> <C-F10>                    <Plug>TdvimNextSyntaxError
    "nmap     <silent> <S-F10>                    <Plug>TdvimPrevSyntaxError
    "vmap     <silent> <C-F10>                    <Plug>TdvimNextSyntaxError
    "vmap     <silent> <S-F10>                    <Plug>TdvimPrevSyntaxError
    "imap     <silent> <C-F10>                    <Plug>TdvimNextSyntaxError
    "imap     <silent> <S-F10>                    <Plug>TdvimPrevSyntaxError
    "nmap     <silent> <C-S-F10>                  <Plug>TdvimSyntaxErrors
    "vmap     <silent> <C-S-F10>                  <Plug>TdvimSyntaxErrors
    "}}}

    " Toggle Comments - F5 {{{2
    nmap <silent> <F5>       <Plug>NERDCommenterToggle
    vmap <silent> <F5>       <Plug>NERDCommenterToggle
    imap <silent> <F5>       <Esc>\c<Space>
    nmap <silent> <leader>ct <Plug>NERDCommenterToggle
    vmap <silent> <leader>ct <Plug>NERDCommenterToggle
    " }}}

    " Multiline Comments - F5 {{{2
    nmap <silent> <C-F5>     <Plug>NERDCommenterSexy
    vmap <silent> <C-F5>     <Plug>NERDCommenterSexy
    imap <silent> <C-F5>     <Esc>\cs
    nmap <silent> <leader>cs <Plug>NERDCommenterSexy
    vmap <silent> <leader>cs <Plug>NERDCommenterSexy
    " }}}

    " Yank and comment - S-F5 {{{2
    nmap <silent> <S-F5>     <Plug>NERDCommenterYank
    vmap <silent> <S-F5>     <Plug>NERDCommenterYank
    imap <silent> <S-F5>     <Esc>\cy
    nmap <silent> <leader>cy <Plug>NERDCommenterYank
    vmap <silent> <leader>cy <Plug>NERDCommenterYank
    " }}}

    " Buffer Tags Finder {{{2
    " Default mapped to C-S-F6
    nnoremap <unique> <silent> <Plug>TdvimTagFinder :LeaderfTag<CR>
    inoremap <unique> <silent> <Plug>TdvimTagFinder <Esc>:LeaderfTag<CR>
    vnoremap <unique> <silent> <Plug>TdvimTagFinder :LeaderfTag<CR>
    "nnoremap <unique> <silent> <Plug>TdvimTagFinder :tags
    "inoremap <unique> <silent> <Plug>TdvimTagFinder <Esc>:tags
    "vnoremap <unique> <silent> <Plug>TdvimTagFinder :tags

    nmap <silent> <C-S-F6> <Plug>TdvimTagFinder
    imap <silent> <C-S-F6> <Plug>TdvimTagFinder
    vmap <silent> <C-S-F6> <Plug>TdvimTagFinder
    " }}}

    " Current function scope - S-F6 {{{2
    nnoremap <unique> <silent> <Plug>TdvimCurrentFunction :TagbarCurrentTag fs<CR>
    inoremap <unique> <silent> <Plug>TdvimCurrentFunction <Esc>:TagbarCurrentTag fs<CR>
    vnoremap <unique> <silent> <Plug>TdvimCurrentFunction :TagbarCurrentTagt fs<CR>

    nmap <silent> <S-F6> <Plug>TdvimCurrentFunction
    imap <silent> <S-F6> <Plug>TdvimCurrentFunction
    vmap <silent> <S-F6> <Plug>TdvimCurrentFunction
    " }}}

    " Jump to Tags Finder {{{2
    nnoremap <unique> <silent> <Plug>TdvimJumpToTagsWindow :call utils#JumpToWindowsByType( "tagbar" )<CR>
    vnoremap <unique> <silent> <Plug>TdvimJumpToTagsWindow <Esc>:call utils#JumpToWindowsByType( "tagbar" )<CR>
    inoremap <unique> <silent> <Plug>TdvimJumpToTagsWindow <Esc>:call utils#JumpToWindowsByType( "tagbar" )<CR>

    nmap <silent> <leader>jt <Plug>TdvimJumpToTagsWindow 
    vmap <silent> <leader>jt <Plug>TdvimJumpToTagsWindow
    " }}}

    " Show tag for current word in Preview Window - C-F6 {{{2
    " Default mapped to C-F6
    "nnoremap <unique> <silent> <Plug>TdvimShowCurrentTag :ptjump <C-R><C-W><CR>
    nnoremap <unique> <silent> <Plug>TdvimShowCurrentTag :call utils#PreviewTag( "<C-R><C-W>" )<CR>
    inoremap <unique> <silent> <Plug>TdvimShowCurrentTag <Esc>:ptjump <C-R><C-W><CR>
    vnoremap <unique> <silent> <Plug>TdvimShowCurrentTag :ptjump <C-R><C-W><CR>

    nmap     <silent> <C-F6>   <Plug>TdvimShowCurrentTag
    imap     <silent> <C-F6>   <Plug>TdvimShowCurrentTag
    vmap     <silent> <C-F6>   <Plug>TdvimShowCurrentTag
    " }}}

    " Show tags for current word in popup window - <lambda>i {{{2
    " Default mapped to <lambda>i
    nnoremap <unique> <silent> <Plug>TdvimInfoCurrentTag :call utils#EchoTagDefinition("popup")<CR>
    vnoremap <unique> <silent> <Plug>TdvimInfoCurrentTag :call utils#EchoTagDefinition("popup") <C-R><C-W><CR>

    nmap     <silent> <leader>i   <Plug>TdvimInfoCurrentTag
    vmap     <silent> <leader>i   <Plug>TdvimInfoCurrentTag
    " }}}

    " Search Functions F6 {{{2
    " Default mapped to F6
    "nnoremap <unique> <silent> <Plug>TdvimSearchFunctions :CtrlPFunky <C-R><C-W><CR>
    "inoremap <unique> <silent> <Plug>TdvimSearchFunctions <Esc>:CtrlPFunky <C-R><C-W><CR>
    "vnoremap <unique> <silent> <Plug>TdvimSearchFunctions :CtrlPFunky <C-R><C-W><CR>
    "nnoremap <unique> <silent> <Plug>TdvimSearchFunctions :LeaderfFunction<CR>
    "inoremap <unique> <silent> <Plug>TdvimSearchFunctions <Esc>:LeaderfFunction<CR>
    "vnoremap <unique> <silent> <Plug>TdvimSearchFunctions :LeaderfFunction<CR>
    nnoremap <unique> <silent> <Plug>TdvimSearchFunctions :LeaderfBufTag<CR>
    inoremap <unique> <silent> <Plug>TdvimSearchFunctions <Esc>:LeaderfBufTag<CR>
    vnoremap <unique> <silent> <Plug>TdvimSearchFunctions :LeaderfBufTag<CR>

    nmap     <silent> <F6>   <Plug>TdvimSearchFunctions
    imap     <silent> <F6>   <Plug>TdvimSearchFunctions
    vmap     <silent> <F6>   <Plug>TdvimSearchFunctions
    nmap     <silent> <leader>fu   <Plug>TdvimSearchFunctions
    vmap     <silent> <leader>fu   <Plug>TdvimSearchFunctions
    " }}}

    " Tags Explorer - S-F8 {{{2
    nnoremap <unique> <silent> <Plug>TdvimTagExplorer :TagbarToggle<CR>
    inoremap <unique> <silent> <Plug>TdvimTagExplorer <Esc>:TagbarToggle<CR>
    vnoremap <unique> <silent> <Plug>TdvimTagExplorer :TagbarToggle<CR>

    nmap     <silent> <S-F8>     <Plug>TdvimTagExplorer
    imap     <silent> <S-F8>     <Plug>TdvimTagExplorer
    vmap     <silent> <S-F8>     <Plug>TdvimTagExplorer
    " }}}

    " Snippets Ctrl-Tab {{{2
    " Expand: Ctrl-Shift-Tab
    " View available snippets: Ctrl-B
    imap <C-Tab> <Plug>snipMateNextOrTrigger
    smap <C-Tab> <Plug>snipMateNextOrTrigger
    vmap <C-Tab> <Plug>snipMateVisual
    imap <C-B> <Plug>snipMateShow
    " }}}

    " Update Tags - F12 {{{2
    " Default mapped to F12
    "nnoremap <unique> <silent> <Plug>TdvimUpdateTags :!ctags      -R --sort=1 --c++-kinds=+p --fields=+iaS --extras=+q --exclude='.git' --exclude='.svn' --exclude='*.so'<CR>
    "inoremap <unique> <silent> <Plug>TdvimUpdateTags <Esc>:!ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extras=+q --exclude='.git' --exclude='.svn' --exclude='*.so'<CR>
    "vnoremap <unique> <silent> <Plug>TdvimUpdateTags :!ctags      -R --sort=1 --c++-kinds=+p --fields=+iaS --extras=+q --exclude='.git' --exclude='.svn' --exclude='*.so'<CR>
    nnoremap <unique>  <Plug>TdvimUpdateBufferTags :GutentagsUpdate<CR>
    inoremap <unique>  <Plug>TdvimUpdateBufferTags <Esc>:GutentagsUpdate<CR>
    vnoremap <unique>  <Plug>TdvimUpdateBufferTags :GutentagsUpdate<CR>
    nnoremap <unique>  <Plug>TdvimUpdateTags :GutentagsUpdate!<CR>
    inoremap <unique>  <Plug>TdvimUpdateTags <Esc>:GutentagsUpdate!<CR>
    vnoremap <unique>  <Plug>TdvimUpdateTags :GutentagsUpdate!<CR>

    nmap      <F12>    <Plug>TdvimUpdateBufferTags
    imap      <F12>    <Plug>TdvimUpdateBufferTags
    vmap      <F12>    <Plug>TdvimUpdateBufferTags

    nmap      <C-F12>    <Plug>TdvimUpdateTags
    imap      <C-F12>    <Plug>TdvimUpdateTags
    vmap      <C-F12>    <Plug>TdvimUpdateTags
    " }}}

    " Autocomplete {{{2
    " Code Insight
    "inoremap <C-space> <c-x><c-o>
    "inoremap <M-space> <c-x><c-]>
    inoremap <unique> <silent>  <Plug>TdvimOmnicompletion <C-x><C-o>
    imap     <silent> <C-space> <Plug>TdvimOmnicompletion
    "inoremap <unique> <silent>  <Plug>TdvimCompletion <C-p>
    "imap     <silent> <tab> <Plug>TdvimCompletion
    " Normal auto complete
    inoremap <silent> <tab> <c-r>=utils#TabAutocompleteWrapper("backward")<cr>
    inoremap <silent> <s-tab> <c-r>=utils#TabAutocompleteWrapper("forward")<cr>

    "}}}

    " Tasks  list - C-S-F8 {{{2
    nnoremap <unique> <silent>  <Plug>TdvimTODO :TagmaTaskToggle<CR>
    vnoremap <unique> <silent>  <Plug>TdvimTODO <Esc>:TagmaTaskToggle<CR>
    inoremap <unique> <silent>  <Plug>TdvimTODO <Esc>:TagmaTaskToggle<CR>

    nnoremap <silent> <C-S-F8>  :TagmaTaskToggle<CR>
    vnoremap <silent> <C-S-F8>  <Esc>:TagmaTaskToggle<CR>
    inoremap <silent> <C-S-F8>  <Esc>:TagmaTaskToggle<CR>
    nnoremap <silent> <Leader>t :TagmaTaskToggle<CR>
    " }}}

    " File Diff with saved version {{{2
    " Default map to C-F4
    "
    nnoremap  <unique> <silent>    <Plug>TdvimFileDiff  :DiffChangesDiffToggle <CR>
    vnoremap  <unique> <silent>    <Plug>TdvimFileDiff  <Esc>:DiffChangesDiffToggle <CR>
    inoremap  <unique> <silent>    <Plug>TdvimFileDiff  <Esc>:DiffChangesDiffToggle <CR>


    nmap <silent>    <C-F4>  <Plug>TdvimFileDiff
    vmap <silent>    <C-F4>  <Plug>TdvimFileDiff
    imap <silent>    <C-F4>  <Plug>TdvimFileDiff

    " }}}

    " Git Diff  {{{2
    " Default map to S-F9
    nnoremap  <unique>     <Plug>TdvimGitDiff  :call utils#GitDiffToggle()<CR>
    vnoremap  <unique>     <Plug>TdvimGitDiff  <Esc>:call utils#GitDiffToggle()<CR>
    inoremap  <unique>     <Plug>TdvimGitDiff  <Esc>:call utils#GitDiffToggle()<CR>


    nmap     <S-F9>  <Plug>TdvimGitDiff
    vmap     <S-F9>  <Plug>TdvimGitDiff
    imap     <S-F9>  <Plug>TdvimGitDiff
    nmap     <leader>gd  <Plug>TdvimGitDiff
    vmap     <leader>gd  <Plug>TdvimGitDiff

    " }}}

    " Git Status  {{{2
    " Default map to F9
    "nnoremap  <unique>     <Plug>TdvimGitStatus  :Gstatus<CR>
    "vnoremap  <unique>     <Plug>TdvimGitStatus  <Esc>:Gstatus<CR>
    "inoremap  <unique>     <Plug>TdvimGitStatus  <Esc>:Gstatus<CR>
    nnoremap  <unique>     <Plug>TdvimGitStatus  :call utils#GitStatusToggle()<CR>
    vnoremap  <unique>     <Plug>TdvimGitStatus  <Esc>:call utils#GitStatusToggle()<CR>
    inoremap  <unique>     <Plug>TdvimGitStatus  <Esc>:call utils#GitStatusToggle()<CR>


    nmap     <F9>  <Plug>TdvimGitStatus
    vmap     <F9>  <Plug>TdvimGitStatus
    imap     <F9>  <Plug>TdvimGitStatus
    nmap     <leader>gs  <Plug>TdvimGitStatus
    vmap     <leader>gs  <Plug>TdvimGitStatus

    " }}}

    " Git File Log  {{{2
    " Default map to C-S-F9
    "nnoremap  <unique>     <Plug>TdvimGitLog  :Glog --<CR>
    "vnoremap  <unique>     <Plug>TdvimGitLog  <Esc>:Glog --<CR>
    "inoremap  <unique>     <Plug>TdvimGitLog  <Esc>:Glog --<CR>
    nnoremap  <unique>     <Plug>TdvimGitFileLog  :call utils#GitFileLogToggle()<CR>
    vnoremap  <unique>     <Plug>TdvimGitFileLog  <Esc>:call utils#GitFileLogToggle()<CR>
    inoremap  <unique>     <Plug>TdvimGitFileLog  <Esc>:call utils#GitFileLogToggle()<CR>

    nmap     <C-S-F9>  <Plug>TdvimGitFileLog
    vmap     <C-S-F9>  <Plug>TdvimGitFileLog
    imap     <C-S-F9>  <Plug>TdvimGitFileLog

    " }}}

    " Git log  {{{2
    " Default map to C-F9
    "nnoremap  <unique>     <Plug>TdvimGitLog  :Glog --<CR>
    "vnoremap  <unique>     <Plug>TdvimGitLog  <Esc>:Glog --<CR>
    "inoremap  <unique>     <Plug>TdvimGitLog  <Esc>:Glog --<CR>
    nnoremap  <unique>     <Plug>TdvimGitLog  :call utils#GitLogToggle()<CR>
    vnoremap  <unique>     <Plug>TdvimGitLog  <Esc>:call utils#GitLogToggle()<CR>
    inoremap  <unique>     <Plug>TdvimGitLog  <Esc>:call utils#GitLogToggle()<CR>

    nmap     <C-F9>  <Plug>TdvimGitLog
    vmap     <C-F9>  <Plug>TdvimGitLog
    imap     <C-F9>  <Plug>TdvimGitLog
    nmap     <leader>gl  <Plug>TdvimGitLog
    vmap     <leader>gl  <Plug>TdvimGitLog

    " }}}

    " Git Grep - N/A{{{2
    " Grep word under cursor or selection in all files tracked by Git
    nnoremap <unique>   <Plug>TdvimGitGrep :Grep      <C-R><C-W>
    inoremap <unique>   <Plug>TdvimGitGrep <Esc>:Grep <C-R><C-W>
    vnoremap <unique>   <Plug>TdvimGitGrep :Grep      <C-R><C-W>

    " }}}

    " Code Insight {{{2
    "nnoremap <unique> <silent>      <Plug>TdvimCodeInsight      :SrcExplToggle<CR>
    "vnoremap <unique> <silent>      <Plug>TdvimCodeInsight      <Esc>:SrcExplToggle<CR>
    "inoremap <unique> <silent>      <Plug>TdvimCodeInsight      <Esc>:SrcExplToggle<CR>

    "nnoremap <silent> <C-F9>        :SrcExplToggle<CR>
    "vnoremap <silent> <C-F9>        <Esc>:SrcExplToggle<CR>
    "inoremap <silent> <C-F9>        <Esc>:SrcExplToggle<CR>
    " }}}

    " Tags jump []-t{{{2
    " Jump to next point in tag stack - ]t
    "nnoremap <silent> ]t   <C-]>
    "vnoremap <silent> ]t   <C-]>
    nnoremap <silent> ]t   <C-]>
    vnoremap <silent> ]t   <C-]>
    " Select tag to jump
    "nnoremap <silent> [T   g]
    "vnoremap <silent> [T   g]
    "inoremap <silent> <C-[>   <ESC>:pop

    " Jump to previous point in tag stack - [t
    nnoremap <silent> [t   <C-T>
    vnoremap <silent> [t   <C-T>
    "nnoremap <silent> [T   :tags<CR>
    "vnoremap <silent> [T   <ESC>:tags<CR>
    "inoremap <silent> <C-[>   <ESC>:pop

    " Diffs jump []-d{{{2
    " Jump to next diff change ]d
    nnoremap <silent> ]d   ]c
    vnoremap <silent> ]d   ]c

    " Jump to previous diff change [d
    nnoremap <silent> [d   [c
    vnoremap <silent> [d   [c

    " Preview tag  {{{2
    nnoremap <unique> <silent> <Plug>TdvimPreviewTag <C-W>}
    inoremap <unique> <silent> <Plug>TdvimPreviewTag <C-O><C-W>}
    vnoremap <unique> <silent> <Plug>TdvimPreviewTag <C-W>}

    
    " Search for tag in Gtags:
    "nmap     <silent> ]T   :GtagsCursor <CR>
    "nmap     <silent> ]T   :call utils#GtagsCmdWrapper( "GtagsCursor" ) <CR>
    "imap     <silent> ]T   <Esc>:call utils#GtagsCmdWrapper( "GtagsCursor" ) <CR>
    "vmap     <silent> ]T   :call utils#GtagsCmdWrapper( "GtagsCursor" ) <CR>
    nmap     <silent> ]T   :tselect <C-R><C-W><CR>
    imap     <silent> ]T   <Esc>:tselect <C-R><C-W><CR>
    vmap     <silent> ]T   :tselect <C-R><C-W><CR>

    " Search for references to current tag in Gtags
    nmap     <silent> [T   :call utils#GtagsCmdWrapper( "Gtags -r" ) <C-R><C-W><CR>
    imap     <silent> [T   <Esc>:call utils#GtagsCmdWrapper( "Gtags -r" ) <C-R><C-W><CR>
    vmap     <silent> [T   :call utils#GtagsCmdWrapper( "Gtags -r" )<C-R><C-W><CR>
    
    " Search for current symbol in Gtags
    nmap     <silent> <C-S-F6>   :call utils#GtagsCmdWrapper( "Gtags -s" )<C-R><C-W><CR>
    imap     <silent> <C-S-F6>   <Esc>:call utils#GtagsCmdWrapper( "Gtags -s" )<C-R><C-W><CR>
    vmap     <silent> <C-S-F6>   :call utils#GtagsCmdWrapper( "Gtags -s" )<C-R><C-W><CR>

    "}}}

endfunction
" }}}

" Help {{{
" Help commands
function! keymaps#Help()

    " Help Finder F1 {{{2
    " Default mapped to F1
    "nnoremap <unique>  <Plug>TdvimMainHelp :h 
    "inoremap <unique>  <Plug>TdvimMainHelp <Esc>:h 
    "vnoremap <unique>  <Plug>TdvimMainHelp <Esc>:h 
    nnoremap <unique> <silent> <Plug>TdvimMainHelp :LeaderfHelp<CR>
    inoremap <unique> <silent> <Plug>TdvimMainHelp <Esc>:LeaderfHelp<CR>
    vnoremap <unique> <silent> <Plug>TdvimMainHelp <Esc>:LeaderfHelp<CR>

    nmap      <F1>   <Plug>TdvimMainHelp
    imap      <F1>   <Plug>TdvimMainHelp
    vmap      <F1>   <Plug>TdvimMainHelp
    " }}}

    " Help For Current Word S-F1 {{{2
    " Default mapped to S-F1
    "nnoremap <unique> <silent> <Plug>TdvimHelpFinder :h      <C-R><C-W><CR>
    "inoremap <unique> <silent> <Plug>TdvimHelpFinder <Esc>:h <C-R><C-W><CR>
    "vnoremap <unique> <silent> <Plug>TdvimHelpFinder :h      <C-R><C-W><CR>
    nnoremap <unique> <silent> <Plug>TdvimHelpFinder :LeaderfHelpCword<CR>
    inoremap <unique> <silent> <Plug>TdvimHelpFinder <Esc>:LeaderfHelpCword<CR>
    vnoremap <unique> <silent> <Plug>TdvimHelpFinder :LeaderfHelpCword<CR>

    nmap     <silent> <S-F1>   <Plug>TdvimHelpFinder
    imap     <silent> <S-F1>   <Plug>TdvimHelpFinder
    vmap     <silent> <S-F1>   <Plug>TdvimHelpFinder
    " }}}

    " Main LeaderF Commands C-S-F2 {{{2
    nmap      <C-S-F2>   :LeaderfSelf<CR>
    imap      <C-S-F2>   <Esc>:LeaderfSelf<CR>
    vmap      <C-S-F2>   :LeaderfSelf<CR>
    " }}}

    " Open Shortcuts reference - C-F1 {{{2
    nnoremap <unique> <silent> <Plug>TdvimHelpShortcuts :call utils#ShowTDVimHelp()<CR>
    inoremap <unique> <silent> <Plug>TdvimHelpShortcuts <Esc>:call utils#ShowTDVimHelp()<CR>i
    vnoremap <unique> <silent> <Plug>TdvimHelpShortcuts <Esc>:call utils#ShowTDVimHelp()<CR>v

    nmap     <silent> <C-F1> <Plug>TdvimHelpShortcuts
    imap     <silent> <C-F1> <Plug>TdvimHelpShortcuts
    vmap     <silent> <C-F1> <Plug>TdvimHelpShortcuts
    " }}}

endfunction
" }}}

" CleanUpKeymaps {{{
" Remove not needed keymaps, probably set by other plugins?
function! keymaps#CleanUpKeymaps()
    " Remove unwanted unimpaired mappings:
    silent! unmap ]t
    silent! unmap [t

endfunction
" }}}

"
" Load all Keymaps
" Needed when script is called as plugin
"call keymaps#LoadKeymaps()

" vim: ts=8 ft=vim nowrap fdm=marker 
" 
