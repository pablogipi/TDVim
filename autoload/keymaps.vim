" File: keymaps.vim
" Author: Pablo Gimenez <pablogipi@gmail.com>
" Description: Keymaps TDVim setup
" Last Change: March 01, 2018 - 10:36 AM.
"


"
" Keymaps
"
" !! -> Don't work on terminals
"
" Files
" - Open File: Ctrl-O
" - Open File in new tab: Ctrl-Alt-O
" - Open files using Fuzzy Finder: F3
" - Open Recent Files Fuzzy Finder: Ctrl-Shift-F3
" - New File: Ctrl-N
" - New File in tab: Ctrl-Alt-N
" - Save: Ctrl-S , <leader>w 
" - Save All: <leader>wa
" - Open File Save As: Atrl-Alt-S
" - Open a saved session: Ctrl-Shift-F1
" - Open Preferences: F10
"
" Editing
" - Deleting Word: Ctrl-Backspace, Ctrl-Del
" - Add next line: Alt-Ctrl-CR
" - Add previous line: Alt-Shift-CR
" - Enter Align mode in Visual: CR (Enter)
" - Enter Align mode: <leader>a
" - Copy: Ctrl-C
" - Paste: Ctrl-V
" - Cut: Ctrl-X
" - Move and select: Shift-[Up|Down|Left|Right]
" - Select to Start or End of Line: Shift-[Home|End]  !!
" - Select to Start or End of File: Ctrl-Shift-[Home|End]  !!
" - Half Page Jump and Select: Shift-[PageUp|PageDown]  !!
" - Word Selection: Ctrl-Shift-[Left|Right]
" - Select All: Ctrl-a
" - Jump Start/End File: Ctrl-[PageUp|PageDown]
" - File History: F7
"
"
" Window Management
" - Maximize Window: Space
" - Change to next windows: Ctrl-F4
" - Increase/decrease window size: Ctrl-Shift-[Up|Down|Left|Right]
" - Move around windows: Alt-[Up|Down|Left|Right]
" - Switch between windows: <leader>p
" - Split window: <leader>s
" - Split horzontal window: <leader>sh
" - Show/Hide menu bar: Ctrl-F8
" - Explorer: F8
" - Buffers Explorer: F3, <leader>b
" - Switch Previous Buffer: Ctrl-F3
" - Close window: <leader>q
" - Close buffer: <leader>x
" - Close preview window: <leader>qp
" - Close help window: <leader>qh
" - Close previous window: <leader>qw
" - Reset windows size: <leader>=
"
" Explorer (Netrw)
" - Go up dir: u
" - Go previous dir: U
" - Go next in history: B
" - Go back to file buffer: -
"
" Modes:
" - Command Line: F2
" - Command Line Palette: Ctrl-F2
" - Visual Block Selection: Shift-F2
"
" Development
" - Move to prev or next indented line: [l , ]l 
" - Move to prev or next level indented line: [L , ]L 
" - Toggle Comment: F5, <leader>ct
" - Multiline Comment: Ctrl-F5, <leader>cs
" - Yank and Comment: Shift:F5, <leader>cy
" - Scope current function in tags: Ctrl-F4
" - Word Finder: F6
" - Word Finder in files: S-F6
" - Build: F11
" - Prev/Next Error: Shift/Ctrl F11
" - Errors list: Ctrl-Shift F11
" - Build Tags: F12
" - OmniComplete: Ctrl-x Ctrl-o , Ctrl-Space
" - Tags Explorer: Shift-F8
" - Tasks List: Ctrl-Shift-F8, <leader>t
" - Jump to tag: F4, ]t
" - Go back from tag stack: [t
" - Show tags match and jump: [T
" - Preview tags: S-F4, ]T
" - Autocomplete:TAB
" - Cycle autocompletion methods: Ctrl-m, Shift-m
" - Expand Snippet: <C-t>
" - Show available snippets: Ctrl-b
" - Forward/Backwards in snippets placeholders: TAB, Shift-TAB
" - File diff: Shift-F7
" - GiT File diff: Ctrl-F7
" - Git Status: F9
" - Git Diff: Shift-F9
"   FIXME: shortcut for MuComplete to cycle between matching methods cause
"   issues, test again.
"
" Function Keys
" - F1: help
"   - Shift-F1: Help for word under the cursor
"   - Ctrl-F1: Open shortcuts help
"   - Ctrl-Shift-F1: Open a saved session
" - F2: Command line mode
"   - Ctrl-F2: Command Line Palette
"   - Shift-F2: Visual block selection`
" - F3: Open buffer`
"   - Ctrl-Shift-F3: Open Recent files
"   - Shift-F3: Open Files
"   - Ctrl-F3: Switch previous buffer
" - F4: Tags/Symbol Finder
"   - Ctrl-F4: Scope current function in tags
"   - Shift-F4: Preview tag in file. Open in Preview window
" - F5: Toggle line comment
"   - Shift-F5: Yank and comment line
" - F6: Search word under cursor in buffer
"   - S-F6: Grep word under cursor in all files in location
"   - C-F6: Goto position of previous change
"   - C-S-F6: Goto position of next change
" - F7: File History
"   - Shift-F7: File diff
"   - Ctrl-F7: GIT file diff
" - F8: Open file browser
"   - Ctrl-F8: Enable/disable menu bar
"   - Shift-F8: Tags Explorer
"   - Ctrl-Shift-F8: Tasks list
" - F9: Git status
"   - Shift-F9: Git file log
"   - Ctrl-F9: Git log
" - F10: Open Preferences
" - F11: Build
"   - Ctrl F11: Next Error
"   - Shift F11: Prev Error
"   - Ctrl-Shift F11: Errors list
" - F12: Build Tags
"
" Leader Key
" - Save and Save all: w , wa
" - Enter Align Mode: a
" - Switch between windows: <leader>p
" - Split window: <leader>s
" - Split horzontal window: <leader>sh
" - Show/Hide Menu Bar: <leader>m
" - Explorer: <leader>e
" - Buffer Explorer: <leader>b
" - Find word under cursor in files (vimgrep): <leadef>f
" - Find word under cursor in all files in current locaton(Ack): <leadef>ff
" - Find word under cursor in all git trackedfiles: <leadef>fg
" - Toggle comments: <leader>ct
" - Comment and Yank:<leader>cy
" - Close window: <leader>q
" - Close preview window: <leader>qp
" - Close help window: <leader>qh
" - Close previous window: <leader>qw
" - Reset windows size: <leader>=
" - Tasks list: <leader>t
" - Close buffer without closing window: <leader>x
"

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

" -- LoadKeymaps -- {{{
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

    " Use TAB to match bracket pairs
    "nnoremap <tab> %
    "vnoremap <tab> %

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
    "nnoremap <unique> <silent>          <Plug>TdvimFinder       :CtrlP<CR>
    "inoremap <unique> <silent>          <Plug>TdvimFinder       :CtrlP<CR>i
    "vnoremap <unique> <silent>          <Plug>TdvimFinder       :CtrlP<CR>v
    nnoremap <unique>           <Plug>TdvimFinder       :find 
    inoremap <unique>           <Plug>TdvimFinder       <Esc>:find 
    vnoremap <unique>           <Plug>TdvimFinder       <Esc>:find 

    nmap  <S-F3>                <Plug>TdvimFinder
    imap  <S-F3>                <Plug>TdvimFinder
    vmap <silent> <S-F3>                <Plug>TdvimFinder

    " }}}

    " Fuzzy Finder MRU ->  C-S-F3{{{2
    " Default map to C-S-F3
    "nnoremap <unique> <silent>          <Plug>TdvimFinderMru    :CtrlPMRU<CR>
    "inoremap <unique> <silent>          <Plug>TdvimFinderMru    :CtrlPMRU<CR>i
    "vnoremap <unique> <silent>          <Plug>TdvimFinderMru    :CtrlPMRU<CR>v
    nnoremap <unique> <silent>          <Plug>TdvimFinderMru    :browse oldfiles<CR>
    inoremap <unique> <silent>          <Plug>TdvimFinderMru    <Esc>:browse oldfiles<CR>
    vnoremap <unique> <silent>          <Plug>TdvimFinderMru    <Esc>:browse oldfiles<CR>

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

    " Open Saved Session -> C-S-F1 {{{2
    noremap <unique> <Plug>TdvimOpenSession :SessionOpen  

    nmap    <C-S-F1> <Plug>TdvimOpenSession
    " }}}

    " Open options/preferences {{{2
    noremap <unique> <Plug>TdvimPreferences :options<CR>

    nmap    <F10> <Plug>TdvimPreferences
    " }}}


endfunction

" }}}

" WindowManagement {{{
" Operations to work with windows, tabs, etc ...
function! keymaps#WindowManagement()
    " Tabs Browsing, close tabs/window {{{2
    " Tabs mappings don't work in terminals

    " Open and navigate tabs DEPRECATED{{{3
    " Open new tab with Ctrl-Shift-t, and new tab with file browsing with
    " Ctrl+TAB and CTRL+Shift+TAB to go for and backeard in tabs
    " gn and gb again to go for and backward

    "FIXME: these mappings are disabled for the moment because it uses similar
    "keymaps as UltiSnips and I dont use tabs.
    "Let's find other keymaps in the future

    "nnoremap  <unique> <silent>    <Plug>TdvimNewTab  :tabnew<CR>
    "vnoremap  <unique> <silent>    <Plug>TdvimNewTab  <Esc>:tabnew<CR>
    "inoremap  <unique> <silent>    <Plug>TdvimNewTab  <Esc>:tabnew<CR>

    "nnoremap  <unique> <silent>    <Plug>TdvimPrevTab  :tabprevious<CR>
    "vnoremap  <unique> <silent>    <Plug>TdvimPrevTab  <Esc>:tabprevious<CR>
    "inoremap  <unique> <silent>    <Plug>TdvimPrevTab  <Esc>:tabprevious<CR>

    "nnoremap  <unique> <silent>    <Plug>TdvimNextTab  :tabnext<CR>
    "vnoremap  <unique> <silent>    <Plug>TdvimNextTab  <Esc>:tabnext<CR>
    "inoremap  <unique> <silent>    <Plug>TdvimNextTab  <Esc>:tabnext<CR>

    "if has("win32") || has("win64") 
    "" For windows
    "nmap <silent> <C-M-t> <Plug>TdvimNewTab
    "vmap <silent> <C-M-t> <Plug>TdvimNewTab
    "imap <silent> <C-M-t> <Plug>TdvimNewTab
    "if (exists("$C_TAB_SWITCHER") &&  $C_TAB_SWITCHER == 0) || !exists("$C_TAB_SWITCHER")
    "nmap <silent> <C-TAB> <Plug>TdvimNextTab
    "nmap <silent> <C-S-TAB> <Plug>TdvimPrevTab
    "imap <silent> <C-TAB> <Plug>TdvimNextTab
    "imap <silent> <C-S-TAB> <Plug>TdvimPrevTab
    "vmap <silent> <C-TAB> <Plug>TdvimNextTab
    "vmap <silent> <C-S-TAB> <Plug>TdvimPrevTab

    "endif
    "nmap <silent> tn <Plug>TdvimNextTab
    "vmap <silent> tn <Plug>TdvimNextTab
    "nmap <silent> tb <Plug>TdvimPrevTab
    "vmap <silent> tb <Plug>TdvimPrevTab
    "nmap <silent> tt <Plug>TdvimNewTab
    "vmap <silent> tt <Plug>TdvimNewTab

    ""elseif $TERM_PROGRAM =~ 'Apple_Terminal'
    "" For Mac OS X terminal
    "elseif has("gui_macvim")
    "" Mac OS X macvim
    "nmap <silent> <D-M-t> <Plug>TdvimNewTab
    "vmap <silent> <D-M-t> <Plug>TdvimNewTab
    "imap <silent> <D-M-t> <Plug>TdvimNewTab
    "if (exists("$C_TAB_SWITCHER") &&  $C_TAB_SWITCHER == 0) || !exists("$C_TAB_SWITCHER")
    "nmap <silent> <C-TAB> <Plug>TdvimNextTab
    "nmap <silent> <C-S-TAB> <Plug>TdvimPrevTab
    "imap <silent> <C-TAB> <Plug>TdvimNextTab
    "imap <silent> <C-S-TAB> <Plug>TdvimPrevTab
    "vmap <silent> <C-TAB> <Plug>TdvimNextTab
    "vmap <silent> <C-S-TAB> <Plug>TdvimPrevTab
    "endif
    "nmap <silent> tn <Plug>TdvimNextTab
    "vmap <silent> tn <Plug>TdvimNextTab
    "nmap <silent> tb <Plug>TdvimPrevTab
    "vmap <silent> tb <Plug>TdvimPrevTab
    "nmap <silent> tt <Plug>TdvimNewTab
    "vmap <silent> tt <Plug>TdvimNewTab
    "elseif has("mac") || has("macunix")
    "" For Mac OS X
    "nmap <silent> <D-M-t> <Plug>TdvimNewTab
    "vmap <silent> <D-M-t> <Plug>TdvimNewTab
    "imap <silent> <D-M-t> <Plug>TdvimNewTab
    "if (exists("$C_TAB_SWITCHER") &&  $C_TAB_SWITCHER == 0) || !exists("$C_TAB_SWITCHER")
    "nmap <silent> <C-TAB> <Plug>TdvimNextTab
    "nmap <silent> <C-S-TAB> <Plug>TdvimPrevTab
    "imap <silent> <C-TAB> <Plug>TdvimNextTab
    "imap <silent> <C-S-TAB> <Plug>TdvimPrevTab
    "vmap <silent> <C-TAB> <Plug>TdvimNextTab
    "vmap <silent> <C-S-TAB> <Plug>TdvimPrevTab
    "endif
    "nmap <silent> tn <Plug>TdvimNextTab vmap <silent> tn <Plug>TdvimNextTab nmap <silent> tb <Plug>TdvimPrevTab
    "vmap <silent> tb <Plug>TdvimPrevTab
    "nmap <silent> tt <Plug>TdvimNewTab
    "vmap <silent> tt <Plug>TdvimNewTab

    "elseif (has("unix") || has("win32unix")) && has("gui_running")
    "" For Unix with GUI running (gvim)
    "nmap <silent> <C-M-t> <Plug>TdvimNewTab
    "vmap <silent> <C-M-t> <Plug>TdvimNewTab
    "imap <silent> <C-M-t> <Plug>TdvimNewTab
    "if (exists("$C_TAB_SWITCHER") &&  $C_TAB_SWITCHER == 0) || !exists("$C_TAB_SWITCHER")
    "nmap <silent> <C-tab> <Plug>TdvimNextTab
    "nmap <silent> <C-S-tab> <Plug>TdvimPrevTab
    "imap <silent> <C-tab> <Plug>TdvimNextTab
    "imap <silent> <C-S-tab> <Plug>TdvimPrevTab
    "vmap <silent> <C-tab> <Plug>TdvimNextTab
    "vmap <silent> <C-S-tab> <Plug>TdvimPrevTab
    "endif
    "nmap <silent> tn <Plug>TdvimNextTab
    "vmap <silent> tn <Plug>TdvimNextTab
    "nmap <silent> tb <Plug>TdvimPrevTab
    "vmap <silent> tb <Plug>TdvimPrevTab
    "nmap <silent> tt <Plug>TdvimNewTab
    "vmap <silent> tt <Plug>TdvimNewTab
    ""elseif (has("unix") || has("win32unix")) && (has("mouse_gpm") || has("mouse_sysmouse") || has("mouse_xterm") || has("mouse"))
    "" For Unix running with mouse support(Terminals and GUI)

    ""elseif has("unix") || has("win32unix")
    "" For Unix 

    ""else
    "" Default
    "endif
    "}}}

    " Close tabs or windows DEPRECATED{{{3
    " XXX: for the moment test using C-F4
    " XXX: DEPRECATED
    "nnoremap  <unique> <silent> <Plug>TdvimCloseSomething :call tdvim#CloseSomething(0)<CR>
    "vnoremap  <unique> <silent> <Plug>TdvimCloseSomething <Esc>:call tdvim#CloseSomething(0)<CR>
    "inoremap  <unique> <silent> <Plug>TdvimCloseSomething <Esc>:call tdvim#CloseSomething(0)<CR>
    "if has("win32") || has("win64") 
    "" For windows
    "nmap <silent> <C-F4> <Plug>TdvimCloseSomething
    "imap <silent> <C-F4> <Plug>TdvimCloseSomething
    "vmap <silent> <C-F4> <Plug>TdvimCloseSomething
    ""elseif $TERM_PROGRAM =~ 'Apple_Terminal'
    "" For Mac OS X terminal
    "elseif has("gui_macvim")
    "" Mac OS X macvim
    "nmap <silent> <C-F4> <Plug>TdvimCloseSomething
    "imap <silent> <C-F4> <Plug>TdvimCloseSomething
    "vmap <silent> <C-F4> <Plug>TdvimCloseSomething
    "elseif has("mac") || has("macunix")
    "" For Mac OS X
    "nmap <silent> <C-F4> <Plug>TdvimCloseSomething
    "imap <silent> <C-F4> <Plug>TdvimCloseSomething
    "vmap <silent> <C-F4> <Plug>TdvimCloseSomething
    "elseif (has("unix") || has("win32unix")) && has("gui_running")
    "" For Unix with GUI running (gvim)
    "nmap <silent> <C-F4> <Plug>TdvimCloseSomething
    "imap <silent> <C-F4> <Plug>TdvimCloseSomething
    "vmap <silent> <C-F4> <Plug>TdvimCloseSomething
    ""elseif (has("unix") || has("win32unix")) && (has("mouse_gpm") || has("mouse_sysmouse") || has("mouse_xterm") || has("mouse"))
    "" For Unix running with mouse support(Terminals and GUI)

    ""elseif has("unix") || has("win32unix")
        "" For Unix 

        ""else
        "" Default
    "endif
    "}}}


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
    nnoremap <unique> <silent> <Plug>TdvimMoveToRightWindow <C-W><Right>
    nnoremap <unique> <silent> <Plug>TdvimMoveToLeftWindow  <C-W><Left>
    nnoremap <unique> <silent> <Plug>TdvimMoveToUpWindow    <C-W><Up>
    nnoremap <unique> <silent> <Plug>TdvimMoveToDownWindow  <C-W><Down>
    nnoremap <unique> <silent> <Plug>TdvimSwitchWindow      <C-W>p
    vnoremap <unique> <silent> <Plug>TdvimSwitchWindow      <C-W>p
    inoremap <unique> <silent> <Plug>TdvimSwitchWindow      <C-O><C-W>p
    vnoremap <unique> <silent> <Plug>TdvimMoveToRightWindow <C-W><Right>
    vnoremap <unique> <silent> <Plug>TdvimMoveToLeftWindow  <C-W><Left>
    vnoremap <unique> <silent> <Plug>TdvimMoveToUpWindow    <C-W><Up>
    vnoremap <unique> <silent> <Plug>TdvimMoveToDownWindow  <C-W><Down>
    inoremap <unique> <silent> <Plug>TdvimMoveToRightWindow <C-O><C-W><Right>
    inoremap <unique> <silent> <Plug>TdvimMoveToLeftWindow  <C-O><C-W><Left>
    inoremap <unique> <silent> <Plug>TdvimMoveToUpWindow    <C-O><C-W><Up>
    inoremap <unique> <silent> <Plug>TdvimMoveToDownWindow  <C-O><C-W><Down>

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
    "nnoremap <unique> <silent> <Plug>TdvimExplorer :NERDTreeToggle<CR>
    "inoremap <unique> <silent> <Plug>TdvimExplorer :NERDTreeToggle<CR>i
    "vnoremap <unique> <silent> <Plug>TdvimExplorer :NERDTreeToggle<CR>v
    nnoremap <unique> <silent> <Plug>TdvimExplorer :call utils#ToggleVExplorer()<CR>
    inoremap <unique> <silent> <Plug>TdvimExplorer :call utils#ToggleVExplorer()<CR>i
    vnoremap <unique> <silent> <Plug>TdvimExplorer :call utils#ToggleVExplorer()<CR>v

    nmap     <silent> <F8>     <Plug>TdvimExplorer
    imap     <silent> <F8>     <Plug>TdvimExplorer
    vmap     <silent> <F8>     <Plug>TdvimExplorer
    " }}}

    " In Window Explorer -> - {{{2
    " Open explorer in current window
    " By default mapped to -
    "nnoremap <unique> <silent> <Plug>TdvimOpenFileInBuffer :e .<CR>
    nnoremap <unique> <Plug>TdvimOpenFileInBuffer :Explore<CR>

    nmap     <unique> <silent>                    -         <Plug>TdvimOpenFileInBuffer
    nmap     <unique> <silent>                    <leader>e <Plug>TdvimOpenFileInBuffer
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
    nnoremap <unique>   <Plug>TdvimBuffers :buffer 
    inoremap <unique>   <Plug>TdvimBuffers <Esc>:buffer 
    vnoremap <unique>   <Plug>TdvimBuffers <Esc>:buffer 

    nmap      <F3>      <Plug>TdvimBuffers
    imap      <F3>      <Plug>TdvimBuffers
    vmap      <F3>      <Plug>TdvimBuffers
    nmap      <leader>b <Plug>TdvimBuffers
    vmap      <leader>b <Plug>TdvimBuffers
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
    nnoremap <unique> <silent> <Plug>TdvimCloseHelpWindow :HelpAllClose<CR>
    vnoremap <unique> <silent> <Plug>TdvimCloseHelpWindow <Esc>:HelpAllClose<CR>
    inoremap <unique> <silent> <Plug>TdvimCloseHelpWindow <Esc>:HelpAllClose<CR>

    nmap <silent> <leader>qh <Plug>TdvimCloseHelpWindow
    vmap <silent> <leader>qh <Plug>TdvimCloseHelpWindow
    " }}}

    " Close Previous Window {{{2
    nnoremap <unique> <silent> <Plug>TdvimClosePreviousWindow :call utils#ClosePreviousWindow()<CR>
    vnoremap <unique> <silent> <Plug>TdvimClosePreviousWindow <Esc>:call utils#ClosePreviousWindow()<CR>
    inoremap <unique> <silent> <Plug>TdvimClosePreviousWindow <Esc>:call utils#ClosePreviousWindow()<CR>

    nmap <silent> <leader>qw <Plug>TdvimClosePreviousWindow
    vmap <silent> <leader>qw <Plug>TdvimClosePreviousWindow
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
    nnoremap  <unique>      <Plug>TdvimJumpCmdPalette   :CtrlPCmdPalette<CR>
    vnoremap  <unique>      <Plug>TdvimJumpCmdPalette   :CtrlPCmdPalette<CR>
    inoremap  <unique>      <Plug>TdvimJumpCmdPalette   <Esc>:CtrlPCmdPalette<CR>

    " Default mapping:
    " F2 : Jump to command line
    " S-F2 : Jump to visual block
    " C-F2 : Command Palette
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
    map <silent>   /           <Plug>(incsearch-forward)
    map <silent>   ?           <Plug>(incsearch-backward)
    map <silent>   g/          <Plug>(incsearch-stay)
    map <silent>   n           <Plug>(incsearch-nohl)<Plug>(anzu-n-with-echo)
    map <silent>   N           <Plug>(incsearch-nohl)<Plug>(anzu-N-with-echo)
    map <silent>   *           <Plug>(incsearch-nohl-*)
    map <silent>   #           <Plug>(incsearch-nohl-#)
    map <silent>   g*          <Plug>(incsearch-nohl-g*)
    map <silent>   g#          <Plug>(incsearch-nohl-g#)


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
    " Default map to F7
    nnoremap  <unique> <silent>    <Plug>TdvimHistory  :GundoToggle<CR>
    vnoremap  <unique> <silent>    <Plug>TdvimHistory  <Esc>:GundoToggle<CR>
    inoremap  <unique> <silent>    <Plug>TdvimHistory  <Esc>:GundoToggle<CR>


    nmap <silent>    <F7>  <Plug>TdvimHistory
    vmap <silent>    <F7>  <Plug>TdvimHistory
    imap <silent>    <F7>  <Plug>TdvimHistory

    " }}}

endfunction
" }}}

" TextNavigation {{{
function! keymaps#TextNavigation()

    " Search - F6{{{2
    " Search word under cursor or selection
    " Default mapped to F6
    nnoremap <unique>  <Plug>TdvimSearch :TdvimSearch <C-R><C-W>
    inoremap <unique>  <Plug>TdvimSearch <Esc>:TdvimSearch  <C-R><C-W>
    vnoremap <unique>  <Plug>TdvimSearch :TdvimSearch <C-R><C-W>

    nmap     <F6>      <Plug>TdvimSearch
    nmap     <leader>f <Plug>TdvimSearch
    imap     <F6>      <Plug>TdvimSearch
    vmap     <F6>      <Plug>TdvimSearch
    vmap     <leader>f <Plug>TdvimSearch
    " }}}

    " Grep - S-F6{{{2
    " Grep word under cursor or selection
    " Default mapped to S-F6
    nnoremap <unique>  <Plug>TdvimGrep :Ack <C-R><C-W>
    inoremap <unique>  <Plug>TdvimGrep <Esc>:Ack <C-R><C-W>
    vnoremap <unique>  <Plug>TdvimGrep :Ack <C-R><C-W>

    nmap <S-F6>      <Plug>TdvimGrep
    nmap <leader>ff <Plug>TdvimGrep
    imap <S-F6>      <Plug>TdvimGrep
    vmap <S-F6>      <Plug>TdvimGrep
    vmap <leader>ff <Plug>TdvimGrep
    " }}}

    " Navigate Changes {{{2
    " Default mapped to C-F6
    nnoremap <unique> <silent>          <Plug>TdvimPrevChange   <C-O>
    inoremap <unique> <silent>          <Plug>TdvimPrevChange   <Esc>g;
    vnoremap <unique> <silent>          <Plug>TdvimPrevChange   g;
    nnoremap <unique> <silent>          <Plug>TdvimNextChange   <C-I>
    inoremap <unique> <silent>          <Plug>TdvimNextChange   <Esc>g,
    vnoremap <unique> <silent>          <Plug>TdvimNextChange   g,

    nmap <silent> <C-F6>            <Plug>TdvimPrevChange
    imap <silent> <C-F6>            <Plug>TdvimPrevChange
    vmap <silent> <C-F6>            <Plug>TdvimPrevChange
    nmap <silent> <C-S-F6>            <Plug>TdvimNextChange
    imap <silent> <C-S-F6>            <Plug>TdvimNextChange
    vmap <silent> <C-S-F6>            <Plug>TdvimNextChange
    " }}}

endfunction
" }}}

" Development {{{
" Operations usaully used when programing
function! keymaps#Development()

    " Build Next/Previous Error from error list (Quickfix) - F11 {{{2
    " Using F11
    nnoremap <unique> <Plug>TdvimBuild       :make!<CR>
    vnoremap <unique> <Plug>TdvimBuild       <Esc>:make!<CR>
    inoremap <unique> <Plug>TdvimBuild       <Esc>:make!<CR>
    nnoremap <unique> <Plug>TdvimNextError   :cnext<CR>
    vnoremap <unique> <Plug>TdvimNextError   <Esc>:cnext<CR>
    inoremap <unique> <Plug>TdvimNextError   <Esc>:cnext<CR>
    nnoremap <unique> <Plug>TdvimPrevError   :cprevious<CR>
    vnoremap <unique> <Plug>TdvimPrevError   <Esc>:cprevious<CR>
    inoremap <unique> <Plug>TdvimPrevError   <Esc>:cprevious<CR>
    nnoremap <unique> <Plug>TdvimBuildErrors :QToggle<CR>
    vnoremap <unique> <Plug>TdvimBuildErrors <Esc>:QToggle<CR>A

    nmap     <silent> <F11>                  <Plug>TdvimBuild
    vmap     <silent> <F11>                  <Plug>TdvimBuild
    imap     <silent> <F11>                  <Plug>TdvimBuild
    nmap     <silent> <C-F11>                <Plug>TdvimNextError
    nmap     <silent> <S-F11>                <Plug>TdvimPrevError
    vmap     <silent> <C-F11>                <Plug>TdvimNextError
    vmap     <silent> <S-F11>                <Plug>TdvimPrevError
    imap     <silent> <C-F11>                <Plug>TdvimNextError
    imap     <silent> <S-F11>                <Plug>TdvimPrevError
    nmap     <silent> <C-S-F11>              <Plug>TdvimBuildErrors
    vmap     <silent> <C-S-F11>              <Plug>TdvimBuildErrors
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
    " Default mapped to F4
    "nnoremap <unique> <silent>         <Plug>TdvimTagFinder    :CtrlPBufTag<CR>
    "inoremap <unique> <silent>         <Plug>TdvimTagFinder    <Esc>:CtrlPBufTag<CR>
    "vnoremap <unique> <silent>         <Plug>TdvimTagFinder    :CtrlPBufTag<CR>
    nnoremap <unique> <silent> <Plug>TdvimTagFinder :tags
    inoremap <unique> <silent> <Plug>TdvimTagFinder <Esc>:tags
    vnoremap <unique> <silent> <Plug>TdvimTagFinder :tags

    nmap     <silent> <F4>     <Plug>TdvimTagFinder
    imap     <silent> <F4>     <Plug>TdvimTagFinder
    vmap     <silent> <F4>     <Plug>TdvimTagFinder
    " }}}

    " Tags Explorer - S-F8 {{{2
    nnoremap <unique> <silent> <Plug>TdvimTagExplorer :TagbarToggle<CR>
    inoremap <unique> <silent> <Plug>TdvimTagExplorer <Esc>:TagbarToggle<CR>
    vnoremap <unique> <silent> <Plug>TdvimTagExplorer :TagbarToggle<CR>

    nmap     <silent> <S-F8>     <Plug>TdvimTagExplorer
    imap     <silent> <S-F8>     <Plug>TdvimTagExplorer
    vmap     <silent> <S-F8>     <Plug>TdvimTagExplorer
    " }}}

    " Show available snippets DEPRECATED {{{2
    " Default mapped to C-S-F5
    " XXX: not used
    nnoremap <unique> <silent>          <Plug>TdvimShowSnippets :call UltiSnips_ListSnippets()<CR>
    inoremap <unique> <silent>          <Plug>TdvimShowSnippets <Esc>:call UltiSnips_ListSnippets()<CR>
    vnoremap <unique> <silent>          <Plug>TdvimShowSnippets :call UltiSnips_ListSnippets()<CR>

    "if has("win32") || has("win64") 
        "" For windows
        "nmap <silent> <C-S-F5>         <Plug>TdvimShowSnippets
        "imap <silent> <C-S-F5>                 <Plug>TdvimShowSnippets
        "vmap <silent> <C-S-F5>         <Plug>TdvimShowSnippets
    "elseif $TERM_PROGRAM =~ 'Apple_Terminal'
        "" For Mac OS X terminal
        "nmap <silent> <C-S-F5>         <Plug>TdvimShowSnippets
        "imap <silent> <C-S-F5>                 <Plug>TdvimShowSnippets
        "vmap <silent> <C-S-F5>         <Plug>TdvimShowSnippets
    "elseif has("gui_macvim")
        "" Mac OS X macvim
        "nmap <silent> <C-S-F5>         <Plug>TdvimShowSnippets
        "imap <silent> <C-S-F5>                 <Plug>TdvimShowSnippets
        "vmap <silent> <C-S-F5>         <Plug>TdvimShowSnippets
    "elseif has("mac") || has("macunix")
        "" For Mac OS X
        "nmap <silent> <C-S-F5>         <Plug>TdvimShowSnippets
        "imap <silent> <C-S-F5>                 <Plug>TdvimShowSnippets
        "vmap <silent> <C-S-F5>         <Plug>TdvimShowSnippets
    "elseif (has("unix") || has("win32unix")) && has("gui_running")
        "nmap <silent> <C-S-F5>         <Plug>TdvimShowSnippets
        "imap <silent> <C-S-F5>                 <Plug>TdvimShowSnippets
        "vmap <silent> <C-S-F5>         <Plug>TdvimShowSnippets
        "" For Unix with GUI running (gvim)
    "elseif (has("unix") || has("win32unix")) && (has("mouse_gpm") || has("mouse_sysmouse") || has("mouse_xterm") || has("mouse"))
        "" For Unix running with mouse support(Terminals and GUI)
        "nmap <silent> <C-S-F5>         <Plug>TdvimShowSnippets
        "imap <silent> <C-S-F5>                 <Plug>TdvimShowSnippets
        "vmap <silent> <C-S-F5>         <Plug>TdvimShowSnippets
    "elseif has("unix") || has("win32unix")
        "" For Unix 
        "nmap <silent> <C-S-F5>         <Plug>TdvimShowSnippets
        "imap <silent> <C-S-F5>                 <Plug>TdvimShowSnippets
        "vmap <silent> <C-S-F5>         <Plug>TdvimShowSnippets

        ""else
        "" Default
    "endif
    " }}}

    " Current function scope C-F4 {{{2
    " Default mapped to C-F4
    nnoremap <unique> <silent> <Plug>TdvimCurrentFunction :TagbarCurrentTag<CR>
    inoremap <unique> <silent> <Plug>TdvimCurrentFunction <Esc>:TagbarCurrentTag<CR>
    vnoremap <unique> <silent> <Plug>TdvimCurrentFunction :TagbarCurrentTagt<CR>

    nmap     <silent> <C-F4>   <Plug>TdvimCurrentFunction
    imap     <silent> <C-F4>   <Plug>TdvimCurrentFunction
    vmap     <silent> <C-F4>   <Plug>TdvimCurrentFunction
    " }}}

    " Update Tags - F12 {{{2
    " Default mapped to F12
    nnoremap <unique> <silent> <Plug>TdvimUpdateTags :!ctags      -R --sort=1 --c++-kinds=+p --fields=+iaS --extras=+q --exclude='.git' --exclude='.svn' --exclude='*.so'<CR>
    inoremap <unique> <silent> <Plug>TdvimUpdateTags <Esc>:!ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extras=+q --exclude='.git' --exclude='.svn' --exclude='*.so'<CR>
    vnoremap <unique> <silent> <Plug>TdvimUpdateTags :!ctags      -R --sort=1 --c++-kinds=+p --fields=+iaS --extras=+q --exclude='.git' --exclude='.svn' --exclude='*.so'<CR>

    nmap     <silent> <F12>    <Plug>TdvimUpdateTags
    imap     <silent> <F12>    <Plug>TdvimUpdateTags
    vmap     <silent> <F12>    <Plug>TdvimUpdateTags
    " }}}

    " Autocompletion DEPRECATED {{{2
    " http://vim.wikia.com/wiki/VimTip1386
    " Make autocompletion menu to behave more like in any other IDE
    " FIXME: these maps are causing all the problems with cursors in terminal
    if has('gui_running')
        inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
        inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
        inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
        inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
        "inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
        "inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
    endif


    " }}}

    " Omnicompletion {{{2
    "inoremap <C-space> <c-x><c-o>
    "inoremap <M-space> <c-x><c-]>
    "TODO: probar TabAutocomplete wrapper function
    inoremap <unique> <silent>  <Plug>TdvimOmnicompletion <C-x><C-o>
    imap     <silent> <C-space> <Plug>TdvimOmnicompletion
    "inoremap <unique> <silent>  <Plug>TdvimCompletion <C-p>
    "imap     <silent> <tab> <Plug>TdvimCompletion
    inoremap <silent> <tab> <c-r>=utils#TabAutocompleteWrapper("forward")<cr>
    inoremap <silent> <s-tab> <c-r>=utils#TabAutocompleteWrapper("backward")<cr>

    "}}}

    " Tasks  list - C-S-F8 {{{2
    nnoremap <unique> <silent>  <Plug>TdvimTODO :TaskList<CR>
    vnoremap <unique> <silent>  <Plug>TdvimTODO <Esc>:TaskList<CR>
    inoremap <unique> <silent>  <Plug>TdvimTODO <Esc>:TaskList<CR>

    nnoremap <silent> <C-S-F8>  :TaskList<CR>
    vnoremap <silent> <C-S-F8>  <Esc>:TaskList<CR>
    inoremap <silent> <C-S-F8>  <Esc>:TaskList<CR>
    map      <unique> <Leader>t <Plug>TaskList
    "nnoremap <silent> <leader>t   :TaskList<CR>
    "vnoremap <silent> <leader>t   <Esc>:TaskList<CR>
    " }}}

    " File Diff with saved version {{{2
    " Default map to S-F7
    nnoremap  <unique> <silent>    <Plug>TdvimFileDiff  :DiffChangesDiffToggle <CR>
    vnoremap  <unique> <silent>    <Plug>TdvimFileDiff  <Esc>:DiffChangesDiffToggle <CR>
    inoremap  <unique> <silent>    <Plug>TdvimFileDiff  <Esc>:DiffChangesDiffToggle <CR>


    nmap <silent>    <S-F7>  <Plug>TdvimFileDiff
    vmap <silent>    <S-F7>  <Plug>TdvimFileDiff
    imap <silent>    <S-F7>  <Plug>TdvimFileDiff

    " }}}

    " Git Diff  {{{2
    " Default map to C-F7
    nnoremap  <unique>     <Plug>TdvimGitDiff  :call utils#GitDiffToggle()<CR>
    vnoremap  <unique>     <Plug>TdvimGitDiff  <Esc>:call utils#GitDiffToggle()<CR>
    inoremap  <unique>     <Plug>TdvimGitDiff  <Esc>:call utils#GitDiffToggle()<CR>


    nmap     <C-F7>  <Plug>TdvimGitDiff
    vmap     <C-F7>  <Plug>TdvimGitDiff
    imap     <C-F7>  <Plug>TdvimGitDiff

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

    " }}}

    " Git log  {{{2
    " Default map to S-F9
    "nnoremap  <unique>     <Plug>TdvimGitLog  :Glog --<CR>
    "vnoremap  <unique>     <Plug>TdvimGitLog  <Esc>:Glog --<CR>
    "inoremap  <unique>     <Plug>TdvimGitLog  <Esc>:Glog --<CR>
    nnoremap  <unique>     <Plug>TdvimGitFileLog  :call utils#GitFileLogToggle()<CR>
    vnoremap  <unique>     <Plug>TdvimGitFileLog  <Esc>:call utils#GitFileLogToggle()<CR>
    inoremap  <unique>     <Plug>TdvimGitFileLog  <Esc>:call utils#GitFileLogToggle()<CR>

    nmap     <S-F9>  <Plug>TdvimGitFileLog
    vmap     <S-F9>  <Plug>TdvimGitFileLog
    imap     <S-F9>  <Plug>TdvimGitFileLog

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

    " }}}

    " Git Grep - N/A{{{2
    " Grep word under cursor or selection in all files tracked by Git
    " Default mapped to S-F6
    nnoremap <unique>   <Plug>TdvimGitGrep :Grep      <C-R><C-W>
    inoremap <unique>   <Plug>TdvimGitGrep <Esc>:Grep <C-R><C-W>
    vnoremap <unique>   <Plug>TdvimGitGrep :Grep      <C-R><C-W>

    "nmap     <C-S-F6>   <Plug>TdvimGitGrep
    "nmap     <leader>fg <Plug>TdvimGitGrep
    "imap     <C-S-F6>   <Plug>TdvimGitGrep
    "vmap     <C-S-F6>   <Plug>TdvimGitGrep
    "vmap     <leader>fg <Plug>TdvimGitGrep
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
    nnoremap <silent> [T   g]
    vnoremap <silent> [T   g]
    "inoremap <silent> <C-[>   <ESC>:pop

    " Jump to previous point in tag stack - [t
    nnoremap <silent> [t   <C-T>
    vnoremap <silent> [t   <C-T>
    "nnoremap <silent> [T   :tags<CR>
    "vnoremap <silent> [T   <ESC>:tags<CR>
    "inoremap <silent> <C-[>   <ESC>:pop
    " }}}
    
    " Preview tag S-F4 {{{2
    " Default mapped to S-F4
    nnoremap <unique> <silent> <Plug>TdvimPreviewTag <C-W>}
    inoremap <unique> <silent> <Plug>TdvimPreviewTag <C-O><C-W>}
    vnoremap <unique> <silent> <Plug>TdvimPreviewTag <C-W>}

    nmap     <silent> <S-F4>   <Plug>TdvimPreviewTag
    imap     <silent> <S-F4>   <Plug>TdvimPreviewTag
    vmap     <silent> <S-F4>   <Plug>TdvimPreviewTag
    nmap     <silent> ]T   <Plug>TdvimPreviewTag
    imap     <silent> ]T   <Plug>TdvimPreviewTag
    vmap     <silent> ]T   <Plug>TdvimPreviewTag
    "}}}

    " MuComplete, completion method C-M, S-M {{{2
    "inoremap <silent> <Plug>(MUcompleteFwdKey) <c-m>
    "imap     <unique> <c-m> <Plug>(MUcompleteCycFwd)
    "inoremap <silent> <plug>(MUcompleteBwdKey) <s-m>
    "imap     <unique> <s-m> <plug>(MUcompleteCycBwd)
    " }}}

endfunction
" }}}

" Help {{{
" Help commands
function! keymaps#Help()

    " Help F1 {{{2
    " Default mapped to F1
    nnoremap <unique>  <Plug>TdvimMainHelp :h 
    inoremap <unique>  <Plug>TdvimMainHelp <Esc>:h 
    vnoremap <unique>  <Plug>TdvimMainHelp <Esc>:h 

    nmap      <F1>   <Plug>TdvimMainHelp
    imap      <F1>   <Plug>TdvimMainHelp
    vmap      <F1>   <Plug>TdvimMainHelp
    " }}}

    " Help Finder S-F1 {{{2
    " Default mapped to S-F1
    nnoremap <unique> <silent> <Plug>TdvimHelpFinder :h      <C-R><C-W><CR>
    inoremap <unique> <silent> <Plug>TdvimHelpFinder <Esc>:h <C-R><C-W><CR>
    vnoremap <unique> <silent> <Plug>TdvimHelpFinder :h      <C-R><C-W><CR>

    nmap     <silent> <S-F1>   <Plug>TdvimHelpFinder
    imap     <silent> <S-F1>   <Plug>TdvimHelpFinder
    vmap     <silent> <S-F1>   <Plug>TdvimHelpFinder
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
    unmap ]t
    unmap [t

endfunction
" }}}

"
" Load all Keymaps
" Needed when script is called as plugin
"call keymaps#LoadKeymaps()

" vim: ts=8 ft=vim nowrap fdm=marker 
" 
