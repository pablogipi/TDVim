"
" Main NeoVim setup file
"
" Mantainer:	Pablo Gimenez <pablogipi@gmail.com>
" Last change:	2009 Dec 9
"
"

" Sections:
" - Plugins
" - Init settings
" - Terminal Settings
" - Search settings
" - Keyboard mappings
" - Interface settings
" - Edit options and Language specific options
" - Applications
" - Platform specific settings
" - Diff mode specific options
" - Autocommands
" - Custom commands
" - Global variables
"

" Custom setup needed for initialization
let g:tdvim_before_start = 1
call utils#SourceUserSettings()
let g:tdvim_before_start = 0

" Vim Plug - Load plugins {{{
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
if utils#GetOS() == 3
    "Windows
    silent! call plug#begin('~/vimfiles/plugged')
else
    " Anything other OS, assumed UNIX
    silent! call plug#begin('~/.vim/plugged')
endif

" Misc {{{2
"
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'xolox/vim-misc'
Plug 'tomtom/tlib_vim'
Plug 'vim-scripts/HelpClose'
Plug 'rkitover/vimpager'
" }}}

" Fuzzy Search Pluging {{{2
" CtrlP
"ctrlpvim/ctrlp.vim
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'ctrlpvim/ctrlp.vim',           { 'on': ['CtrlP', 'CtrlPBuffer', 'CtrlPMRU', 'CtrlPTag', 'CtrlPBufTag'] }
"Plug 'fisadev/vim-ctrlp-cmdpalette'
"Plug 'fisadev/vim-ctrlp-cmdpalette', { 'on': ['CtrlP', 'CtrlPBuffer', 'CtrlPMRU', 'CtrlPTag', 'CtrlPBufTag'] }
"Plug 'd11wtq/ctrlp_bdelete.vim'
" FzF
"Plug 'junegunn/fzf.vim'
" LeaderF
Plug 'Yggdroot/LeaderF'
"}}}

" UI {{{2
"
" NERD Tree will be loaded on the first invocation of NERDTreeToggle command
"Plug 'scrooloose/nerdtree',              { 'on': ['NERDTreeToggle','NERDTreeFocus','NERDTreeOpen','NERDTreeFind'] }
"Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'


" Lightline
Plug 'itchyny/lightline.vim'
" Tagbar
Plug 'majutsushi/tagbar',                { 'on':  ['TagbarToggle', 'TagbarCurrentTag'], 'for': ['cpp', 'c', 'python', 'vim'] }
" Mini Buf Explorer
"Plug 'fholgado/minibufexpl.vim'
" Tabline buffers
"Plug 'taohexxx/lightline-buffer'
Plug 'mengelbrecht/lightline-bufferline'
" Gundo
Plug 'sjl/gundo.vim',                    { 'on': 'GundoToggle' }
" Maximizer
Plug 'szw/vim-maximizer',                { 'on': 'MaximizerToggle' }
" Startify
" Only use startify in gvim sessions
"Plug 'mhinz/vim-startify'
"
" FIXME: Apparently NeoVim doesn't set this variable until the Gui is loaded after
" sourcing this script, which is too late.
" At the moment we will just force it
echomsg "GUI Loaded " . exists("g:GuiLoaded")
let g:GuiLoaded=1
if exists('g:GuiLoaded')
     Plug 'mhinz/vim-startify'
endif

" Devicons
if  exists('g:GuiLoaded')
     Plug 'ryanoasis/vim-devicons'
endif

" Vimade
"Plug 'TaDaa/vimade'

" Nuake
Plug 'Lenovsky/nuake'



" }}}

" Development {{{2
"
" Autocomplete
"Plug 'ajh17/VimCompletesMe'
"Plug 'lifepillar/vim-mucomplete'
" FSwitch
Plug 'derekwyatt/vim-fswitch'
" Guten Tags
Plug 'ludovicchabant/vim-gutentags',     { 'for': ['cpp', 'c', 'vim', 'python'] }
" Autodate
Plug 'vim-scripts/autodate.vim'
" Diffchanges
Plug 'vim-scripts/diffchanges.vim'
" Ultisnips
" DEPRECATED:
"Plug 'SirVer/ultisnips',                 { 'for': ['cpp', 'c', 'python', 'vim'] }
"Plug 'honza/vim-snippets',               { 'for': ['cpp', 'c', 'python', 'vim'] }
" Snipmate
"Plug 'msanders/snipmate.vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

" TTodo
"Plug 'tomtom/ttodo_vim'
" Task List
"Plug 'vim-scripts/TaskList.vim',         { 'for': ['cpp', 'c', 'python', 'vim'] }
" Tagma Tasks
Plug 'JessicaKMcIntosh/TagmaTasks',         { 'for': ['cpp', 'c', 'python', 'vim'] }
" Speed Folds
Plug 'Konfekt/FastFold',     { 'for': ['cpp', 'c', 'vim', 'python'] }

" C/C++ {{{3
" Cpp Enhanced Syntax
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['cpp', 'c'] }
" OmniCppComplete
Plug 'vim-scripts/OmniCppComplete',      { 'for': ['cpp', 'c'] }
" }}}

" GIT {{{3
if executable('git')
    if  exists('g:GuiLoaded')
        " Fugitive (GIT)
        "Plug 'tpope/vim-fugitive',               { 'on':  ['Gstatus', 'Glog', 'Gdiff', 'Gcommit', 'Ggrep', 'Gedit']}
        Plug 'tpope/vim-fugitive',               { 'for': ['cpp', 'c', 'vim', 'python'], 'on':  ['Gstatus', 'Glog', 'Gdiff', 'Gcommit', 'Ggrep', 'Gedit'] }
        Plug 'itchyny/vim-gitbranch'
    endif
    " NERDTree Git
    Plug 'Xuyuanp/nerdtree-git-plugin'
    " Git Gutter
    Plug 'airblade/vim-gitgutter'
endif
"}}}
"
" Python {{{3
" SimplyFold
Plug 'tmhedberg/SimpylFold', { 'for': ['python'] }
" Indent Python
Plug 'vim-scripts/indentpython.vim', { 'for': ['python'] }
" Jedi
 if  exists('g:GuiLoaded')
     Plug 'davidhalter/jedi-vim', { 'for': ['python'] }
 endif
" DEPRECATED:
" PyLint
"Plug 'congma/pylint.vim', { 'for': ['python'] }
" Flake8
" Plug 'nvie/vim-flake8', { 'for': ['python'] }
" Pymotions
Plug 'jeetsukumaran/vim-pythonsense', { 'for': ['python'] }

" }}}

" }}}

" Editing {{{2
"
" Nerd Commenter
Plug 'scrooloose/nerdcommenter'
" Easy Align
"Plug 'junegunn/vim-easy-align',          { 'on': [ 'LiveEasyAlign', 'EasyAlign' ] }
Plug 'junegunn/vim-easy-align'
"Plug 'junegunn/vim-easy-align'
" Surround
Plug 'tpope/vim-surround'
" Incsearch
Plug 'haya14busa/incsearch.vim'
" FIXME: anzu keymap to / is causing a crash in gvim. Disable it at the moment
" Anzu
" Plug 'osyo-manga/vim-anzu'
" Ack
"Plug 'mileszs/ack.vim',                  { 'on': 'Ack' }
" DEPRECATED:
" Grepper
"Plug 'mhinz/vim-grepper',                  { 'on': 'Grepper' }
" Delimit Mate
Plug 'Raimondi/delimitMate'
" Rainbow parentheses
Plug 'luochen1990/rainbow'
" Show Indent Lines
Plug 'Yggdroot/indentLine'

" }}}

" Colors {{{2
"
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/seoul256.vim'
" Only load pencil in terminal mode if it supports 256 colors, otherwise it
" will report errors
if !exists('g:GuiLoaded') && &t_Co < 256
    Plug 'reedes/vim-colors-pencil'
    Plug 'yami-beta/lightline-pencil.vim'
endif
Plug 'joshdick/onedark.vim'
Plug 'NovaDev94/lightline-onedark'
Plug 'Rigellute/rigel'
Plug 'itchyny/landscape.vim'
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'crusoexia/vim-monokai'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'kyoz/purify', { 'rtp': 'vim' }

" }}}

" Initialize plugin system
call plug#end()

" }}}

" Global variables {{{

" TDVim version
let $TDVIMVERSION="0.3"

" }}}

" Init settings {{{
"
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
    finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Do not keep a backup file for VMS
if has("vms")
    set nobackup
else
    set backup                               " keep a backup file
endif
" Backup and swap files
let vimbackuppath = $HOME . '/.vim/tmp'
if utils#GetOS() == 3
    "Windows
    let vimbackuppath = $HOME . '/vimfiles/tmp'
endif
let &backupdir = vimbackuppath . '//,.'
let &directory = vimbackuppath . '//,.'
silent call mkdir (vimbackuppath , 'p')

set history=50                           " keep 50 lines of command line history
set ruler                                " show the cursor position all the time
set showcmd                              " display incomplete commands
set wildmode=full                        " Complete the next full match
" Ignores patterns in autocomplete
if utils#GetOS() == 1
    "Linux
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.swp,*.bak,*~
elseif utils#GetOS() == 2
    "Mac
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.swp,*.bak,*~
elseif utils#GetOS() == 3
    "Windows
    set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*,*.swp,*.bak,*~
endif

" Check terminals colors, if is not a 256 color terminal make a warning
if !exists('g:GuiLoaded') && &t_Co < 256
    silent echomsg "Current terminal doesn't support 256 colors. Some colors and the status line won't look correctly"
endif

" Set viminfo. Mainly set history limits
" File history: 25
" Maximum lines per registry: 100
" Maximum sze of a register: 10KB
" Disable hlsearch
set viminfo='25,<100,s10,h
if utils#GetOS() == 3
    "Windows
    set viminfo+=rA:
    set viminfo+=rB:
endif

" Always run mswin at the end
" Load more conventional editors options, MSWin mode:
source $VIMRUNTIME/mswin.vim
" Fix mswin, it enters in select mode rather than visual.
set selectmode=""

" Auto change directory
set autochdir

" Use OS clipboard:
set clipboard^=unnamed,unnamedplus

" }}}

" Sessions {{{
" Options for what to save in the sessions file:
let &sessionoptions='buffers,curdir,folds,resize,winsize'
"let &sessionoptions-='help'
"let &sessionoptions+='resize'
" View, restore file state options:
let &viewoptions='cursor,folds,slash,unix'

" }}}

" Terminal settings {{{
set ttyfast

" }}}

" Edit options and Language specific options {{{
"
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 ||  exists('g:GuiLoaded')
    syntax on
    set hlsearch
endif

" Set buffers to be hidden for easy switching
set hidden

" Activate showmatch
set showmatch

" Consider windows in other tabs when opening a buffer
set switchbuf=usetab

" Default editing setup:
" Settings common for all file types:

" Tabs width
let &shiftwidth  = 4
let &softtabstop = 4
let &shiftwidth  = 4
" Size for the TAB
let &tabstop=&shiftwidth
set expandtab

" Always round indent to shiftwidth
set shiftround

" Line numbering for all file formats:
set nonumber

" Better folding:
set foldtext=utils#NeatFoldText()

" Search settings {{{

" Do incremental searching
set incsearch

" Switch on search pattern highlighting.
set hlsearch

" Search case mode:
set ignorecase
set smartcase

" Global search by default
set gdefault

" Better grep
if executable("ag")
    "set grepprg=ag\ --nogroup\ --nocolor\ --vimgrep
    set grepprg=ag\ --vimgrep\ --ignore\ *~\ --ignore\ *.swp\ --ignore\ *.diff\ --ignore\ tags\ --ignore\ *.tags
endif

" }}}

" }}}

" Interface settings {{{
"
"Encoding {{{2
" UTF-8 encoding has been disabled due to several compatibility problems
" Spacially with terminals.
if has("multi_byte")
    if &termencoding == ""
        let &termencoding = &encoding
    endif
    set encoding=utf-8
    "setglobal fileencoding=utf-8 bomb
    setglobal fileencoding=utf-8
    set fileencodings=ucs-bom,utf-8,latin1
endif
"}}}

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a

" Color Theme
" Leave this for the user settings, use default

" Command line height
set cmdheight=2
" Preview Window Height
set previewheight=8

" Folding options: {{{2
" Default folding method id indent
set foldmethod=indent
" Folds margin width
set foldcolumn=2
" Minimum lines in a  fold to consider it a a proper fold
set foldminlines=3
" Fold starting level, set to 1 to have only level 1 folds ready
set foldlevelstart=-1
" Max nested level
let &foldnestmax = 3
" }}}

" Tabs label format:
"set guitablabel=%{utils#GuiTabLabel()}

" Completion {{{
" Completion options
set noshowmode
"set shortmess+=c
set shortmess=aTt
set noinfercase
set belloff+=ctrlg " If Vim beeps during completion
set belloff+=cursor " If Vim beeps during scrolling
set belloff+=all " If Vim beeps during scrolling
set completeopt-=preview
set completeopt+=menuone
set completeopt+=noinsert
"set completeopt+=noselect
" Protect certain keymaps
"inoremap <expr> <c-e> mucomplete#popup_exit("\<c-e>")
"inoremap <expr> <c-y> mucomplete#popup_exit("\<c-y>")
"inoremap <expr>  <cr> mucomplete#popup_exit("\<cr>")

" Sources for searching in completion mode
" Only include current buffer and buffer in other windows only
set complete=.,w,b

" Set window splits to be at bottom by default, used by preview window and
" quckfix
set splitbelow
" }}}

" Status Line {{{2
" Always show status line:
set laststatus=2
" Defaul status line
set statusline=%-f%m%r%h%w%q\ %y\ %=[POS=%l,%v][%p%%]
" Disable show mode, not needed when using lightline or any other status line
" plugin
set noshowmode


" }}}

" Preview window {{{2
set pvh=5
" }}}

" Invisible character {{{2
"set listchars=tab:▸\ ,eol:¬
set listchars=tab:>-,eol:¬,space:.,trail:.
" }}}

" Lines wraping and formatting {{{2
set wrap
set textwidth=79
set formatoptions=qrn1
" }}}


" FoldDigest {{{2
if exists("$FOLDDIGEST_POS")
    let g:FoldDigest_Pos=$FOLDDIGEST_POS
else
    let g:FoldDigest_Pos="right"
endif

" }}}

" Netrw {{{2
let g:netrw_banner        = 0
let g:netrw_sort_sequence = '[\/]$,*'
"let g:netrw_browse_split  = 4
" }}}

" window title {{{2
set title
let &titlestring='TDVim'
" }}}

"""""""""""""""""""""""""""
""""""""""""""""""""""""""" }}}

" GUI {{{
if  exists('g:GuiLoaded')
    set mousehide		" Hide the mouse when typing text
    set mousemodel=popup	" Enable popup menu using mouse

    " Set GUI font and general options
    if has('gui_gtk2') || has('gui_gtk3')
        set gfn=DejaVu\ Sans\ Mono\ 10
        "set guioptions = "agimrLtT"
        set guioptions += "aAgimrLt"
    elseif has('gui_photon')
        set gfn=DejaVu\ Sans\ Mono:s10
    elseif has('gui_kde')
        " the obsolete kvim
        " just make sure it works correctly if it hits our vimrc
        set gfn=DejaVu\ Sans\ Mono/10/-1/5/50/0/0/0/1/0
    elseif has('x11')
        " I'm guessing the following (other-X11 including GTK1)
        " please check, and correct if necessary.
        " On GTK1 (and maybe some others) you can use :set gfn=*
        " Replace by asterisks like here
        " to make it a little more general:
        set gfn=-*-dejavu-medium-r-normal-*-*-10-*-*-m-*-*
        " add another elseif here
        " if you want DejaVu on mac-without-x11
    elseif has("gui_macvim") || has("gui_mac")
        set gfn=DejaVu\ Sans\ Mono:h13
    elseif has("win32")
        set guioptions+="gmrLtT"
        set guifont=Consolas:h11:cANSI:qDRAFT
    else
        " system not detected
    endif

    " Better updatetime for GUI
    set updatetime=1000


endif
" }}}

" Keyboard mappings {{{
" Load keymaps mapings for TDVim
" Leader key
"let mapleader = ","
"let mapleader = "`"
let mapleader = "\<Space>"
let maplocalleader = ","
" This is done at VimEnter event.
" It is setup using autocommands, look at: tdvimInit#AfterStart

" }}}

" Applications {{{
" Setup to integrate TDVim with different applications
" Houdini
"call tdvimInit#initHoudini()
" }}}

" Platform specific settings {{{
"
" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")
if has('unix')
    " unix-like platform (including Cygwin)
    "Setup for MacVim
    if has('gui_macvim')
        "set macmeta
    endif

    " No platforms detected so probably is Windows
else
    " probably Windows
    " General options for windows

endif

" }}}

" Diff mode specific options {{{
set diffopt=filler,vertical

if &diff
    "	setup for diff mode
endif

" }}}

" Autocommands and Events {{{
"
" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Enable file type detection.
    filetype plugin indent on

    " Setup events autocommands
    " Misc
    augroup tdvimMisc
        " Update status line colors when color scheme chages
        autocmd ColorScheme * call utils#updateStatusLineColors()
        " Highlight type for extra white spaces at the end of a line
        autocmd ColorScheme * highlight ExtraWhitespace ctermbg=lightred guibg=lightred
        autocmd Syntax python,cpp,c,sh,csh,vim highlight ExtraWhitespace ctermbg=lightred guibg=lightred
    augroup END
    " Checks for first start
    augroup tdvimFirstStartUp
        autocmd VimEnter * call utils#SetupFirstStartup()
    augroup END
    " After Startup
    augroup tdvimAfterStartUp
	autocmd VimEnter * call keymaps#CleanUpKeymaps()
	autocmd VimEnter * call keymaps#LoadKeymaps()
	autocmd VimEnter * call utils#SourceUserSettings()
        autocmd VimEnter * call utils#updateStatusLineColors()
        autocmd VimEnter * echomsg "TDVim " . $TDVIMVERSION . " loaded"
    augroup END
    " AfterBufferRead
    augroup tdvimAftertBufferRead
        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        autocmd BufRead *
                    \ if line("'\"") > 0 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif
        " Change local path to the folder containing the current buffer:
        autocmd BufRead * call utils#SetLocalPath()
        autocmd BufRead quickfix call utils#SetupAuxBuffer()
        " Show bad spaces at the end of code lines:
        au BufRead,BufNewFile *.py,*.pyw,*.c,*.cpp,*.vim,*.h match ExtraWhitespace  /\s\+$/
    augroup END
    " BufEnter
    augroup tdvimBufEnter
        " Set local path to path of current file
        autocmd BufEnter * call utils#SetLocalPath()
        " Set window title
        if exists('v:this_session') && len('v:this_session')
            "autocmd BufEnter * let &titlestring = "TDVim " . $TDVIMVERSION . " - " . fnamemodify(v:this_session, ':t') . " - " . expand("%:p")
            autocmd BufEnter * let &titlestring = expand("%:t") . " (" . expand("%:p:h") . ")" . "  |> " . fnamemodify(v:this_session, ':t') . " <|   " . "TDVim " . $TDVIMVERSION 
        else
            "autocmd BufEnter * let &titlestring = "TDVim " . $TDVIMVERSION . " - " . expand("%:p")
            autocmd BufEnter * let &titlestring = expand("%:t") . " (" . expand("%:p:h") . ")" . " |   TDVim " . $TDVIMVERSION 
        endif
        " Set preview window syntax
        "autocmd BufEnter *
            "\if &previewwindow |
            "\   set filetype=passwd |
            "\   endif
        "autocmd BufEnter *
            "\if &previewwindow |
            "\   call utils#PreviewWindowSetup() |
            "\   endif
        " Call TDVim Project
        autocmd BufEnter * call utils#ProjectSettings(expand("<afile>:p:h"), 0)
    augroup END
    " BufLeave
    "augroup tdvimBufLeave
    "augroup END
    " BufWinEnter
    augroup tdvimWinNew
        autocmd WinNew * call utils#PreviewWindowSetup()
    augroup END
    augroup tdvimWinEnter
        autocmd WinEnter * call utils#PreviewWindowSetup()
    augroup END
    " BufWinLeave
    augroup tdvimWinLeave
        autocmd WinLeave * call utils#LeavePreviewWindowSetup()
    augroup END
    " BufAdd
    "augroup tdvimBufAdd
        " Setup quickfix and preview windows keymaps
        "autocmd BufAdd  * if &buftype == 'quickfix' | echo 'winenter' | endif
        "autocmd BufAdd  * echomsg "Adding buffer " . &buftype
        "autocmd BufAdd qf call utils#SetupAuxBuffer()
    "augroup END
     "FileTypes
     "
    augroup tdvimFileTypes
	autocmd Filetype *
		    \	if &omnifunc == "" |
		    \		setlocal omnifunc=syntaxcomplete#Complete |
		    \	endif
        autocmd FileType nerdtree call utils#SetupNERDTreeBuffer()
    augroup END
    " SessionLoadPost
    "augroup tdvimSessionLoadPost
    "augroup END
    " Gutentags
    augroup GutentagsStatusLineRefresher
        autocmd!
        autocmd User GutentagsUpdating call lightline#update()
        autocmd User GutentagsUpdated call lightline#update()
    augroup END

    " CursorHold
    augroup tdvimCursorHold
        autocmd! CursorHold * ++nested call utils#UpdateDevIconFileType()
        autocmd! CursorHold leaderf ++nested normal <C-I>
    augroup END

else
    set autoindent		" always set autoindenting on
endif " has("autocmd")

" }}}

" Custom commands {{{
call commands#InitCommands()
" }}}

" Setup Plugins {{{

" Colors Plugins {{{2
" One Color Scheme
let g:one_allow_italics = 1 " I love italic for comments
" Pencil Color Scheme
let g:pencil_higher_contrast_ui = 0 " 0=low (def), 1=high
let g:pencil_neutral_headings = 1   " 0=blue (def), 1=normal
let g:pencil_gutter_color = 1       " 0=mono (def), 1=color
let g:pencil_spell_undercurl = 1    " 0=underline, 1=undercurl (def)
" Solarized Color Scheme
let g:solarized_termcolors=256 " Terminal colors, 16 (def) or 256.
" Seoul Color Scheme
let g:seoul256_srgb = 1
"}}}

" Devicons:
let g:webdevicons_enable_ctrlp = 1

" Maximize:
let g:maximizer_set_default_mapping = 0

" NERD Tree: {{{2
let g:NERDTreeHijackNetrw = 1 " Use NERD Tree instead of netrw
"let g:NERDTreeDisableFileExtensionHighlight = 1
"let g:NERDTreeDisableExactMatchHighlight = 1
"let g:NERDTreeDisablePatternMatchHighlight = 1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeLimitedSyntax = 1
let NERDTreeIgnore=['\.swo$', '\.swp$','\.pyc$', '\.o$','\~$']
let NERDTreeAutoDeleteBuffer = 1
" NERDTree Git
"let g:NERDTreeIndicatorMapCustom = {
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

"let g:gitgutter_sign_added              = '⇒'
"let g:gitgutter_sign_modified           = '»'
let g:gitgutter_sign_added              = '✚'
let g:gitgutter_sign_modified           = '✹'
let g:gitgutter_sign_removed            = '✗'
let g:gitgutter_sign_removed_first_line = '‾'
let g:gitgutter_sign_modified_removed   = '≃'
"}}}

" NERD Commenter:
let g:NERDMenuMode = 0 " Disable menu

" Ack: {{{2
if executable('ag')
  "let g:ackprg = 'ag --vimgrep --ignore={"*~", "*.swp", "*.diff"}'
  "let g:ackprg = 'ag --vimgrep --ignore *~ --ignore *.swp --ignore *.diff'
  "echomsg "Set ag as executable"
  let g:ackprg = 'ag --vimgrep --ignore *~ --ignore *.swp --ignore *.diff --ignore tags  --ignore *.tags '
endif
let g:ackhighlight = 1
let g:ack_autofold_results = 1
"let g:ack_use_dispatch = 1
let g:ackpreview = 1
" }}}

" Session:
let g:session_command_aliases = 1 " Enable vim-session commands aliases
let g:session_menu            = 0 " Disable vim-session menu
let g:session_autoload        = 0 " Disable load session on startup

" Lightline: {{{2
" use lightline-buffer in lightline
"let g:lightline = {
        "\ 'tabline': {
                "\ 'left': [ [ 'sessioninfo' ], [ 'bufferinfo' ], [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
                "\ 'right': [ [ 'close' ], ],
                "\ },
        "\ 'component_expand': {
                "\ 'buffercurrent': 'lightline#buffer#buffercurrent2',
                "\ },
        "\ 'component_type': {
                "\ 'buffercurrent': 'tabsel',
                "\ },
        "\ 'component_function': {
                "\ 'sessioninfo': 'utils#SessionName',
                "\ 'bufferbefore': 'lightline#buffer#bufferbefore',
                "\ 'bufferafter': 'lightline#buffer#bufferafter',
                "\ 'bufferinfo': 'lightline#buffer#bufferinfo',
                "\ 'filetypeicon': 'utils#LightlineDeviconsFiletype',
                "\ 'fileformat': 'utils#LightlineDeviconsFileformat',
                "\ 'modifiedicon': 'utils#LightlineModified',
                "\ 'readonly': 'utils#LightlineReadonly',
                "\ 'extrainfo': 'utils#LightlineExtraInfo',
                "\ 'tagsgen': 'utils#LightlineGutentags',
                "\ },
        "\ 'component': {
                "\ 'filename': '%{utils#LightlineFilename()}',
                "\ 'mode': '%{utils#LightlineMode()}',
                "\ 'inactivemode': '%{utils#LightlineInactiveMode()}',
        "\       },
        "\ }

                "\ 'lineinfo': '%{utils#LightlineLineInfo()}',
let g:lightline = {
        \ 'tabline': {
                \ 'left': [ [ 'sessioninfo' ], [ 'buffers' ] ],
                \ 'right': [ [ 'close' ], ],
                \ },
        \ 'component_expand': {
                \ 'buffers': 'lightline#bufferline#buffers',
                \ },
        \ 'component_type': {
                \ 'buffers': 'tabsel',
                \ },
        \ 'component_function': {
                \ 'sessioninfo': 'utils#SessionName',
                \ 'bufferbefore': 'lightline#buffer#bufferbefore',
                \ 'bufferafter': 'lightline#buffer#bufferafter',
                \ 'bufferinfo': 'lightline#buffer#bufferinfo',
                \ 'filetypeicon': 'utils#LightlineDeviconsFiletype',
                \ 'fileformat': 'utils#LightlineDeviconsFileformat',
                \ 'modifiedicon': 'utils#LightlineModified',
                \ 'readonly': 'utils#LightlineReadonly',
                \ 'extrainfo': 'utils#LightlineExtraInfo',
                \ 'tagsgen': 'utils#LightlineGutentags',
                \ },
        \ 'component': {
                \ 'filename': '%{utils#LightlineFilename()}',
                \ 'mode': '%{utils#LightlineMode()}',
                \ 'inactivemode': '%{utils#LightlineInactiveMode()}',
        \       },
        \ }

if  exists('g:GuiLoaded')
    let g:lightline.active = {
                \ 'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filetypeicon', 'filename', 'modifiedicon' ], [ 'extrainfo', 'tagsgen' ] ],
                \ 'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'git' ] ]
                \   }
else
    let g:lightline.active = {
                \ 'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modifiedicon' ], [ 'extrainfo', 'tagsgen' ] ],
                \ 'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'git', 'filetype' ] ]
                \   }
endif

let g:lightline.inactive = {
            \ 'left': [ [ 'inactivemode', 'filename', 'modifiedicon' ] ],
            \ 'right': [ [ 'lineinfo' ],
            \            [ 'git', 'percent' ] ] }
" lightline-buffer
" Always enable tabline, needed by lightline-bufferline
set showtabline=2
" Dont use GUI tabs in GUI mode, instead use text tabline. Needed by
" tabline buffers plugins
set guioptions-=e
" lightline-buffer function settings
let g:lightline_buffer_show_bufnr = 1
let g:lightline_buffer_rotate     = 0
let g:lightline_buffer_fname_mod  = ':t'
let g:lightline_buffer_excludes   = ['vimfiler', 'nerdtree', 'tagbar', 'help', 'quickfix']
let g:lightline_buffer_maxflen    = 30
let g:lightline_buffer_maxfextlen = 3
let g:lightline_buffer_minflen    = 16
let g:lightline_buffer_minfextlen = 3
let g:lightline_buffer_reservelen = 20
let g:lightline#bufferline#enable_devicons = 1

"}}}

" delimitMate:
" We need this here to avoid problems with delimitMate
let delimitMate_balance_matchpairs = 1
let delimitMate_expand_space       = 1
let delimitMate_expand_cr          = 1

" OmniCppComplete: {{{2
let OmniCpp_DefaultNamespaces   = ["std"]
let OmniCpp_MayCompleteDot      = 0
let OmniCpp_MayCompleteArrow    = 0
let OmniCpp_SelectFirstItem     = 1
let OmniCpp_ShowScopeInAbbr     = 1
let OmniCpp_ShowPrototypeInAbbr = 0

"}}}

" MuComplete: {{{2
let g:mucomplete#chains = {
      \ 'default': ['file', 'c-p', 'uspl'],
      \ 'cpp':     ['file', 'ulti', 'omni', 'c-p'],
      \ 'c':       ['file', 'omni', 'c-p'],
      \ 'python':  ['file', 'omni', 'c-p'],
      \ 'vim':     ['file', 'cmd', 'c-p']
      \ }
let g:mucomplete#popup_direction = { 'c-p': 1 }
let g:mucomplete#buffer_relative_paths = 1

"}}}

" CtrlP: {{{2
let g:ctrlp_working_path_mode = 'rwa'
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_reuse_window = 'startify\|netrw'
let g:ctrlp_max_files = 1000
let g:ctrlp_max_depth = 5
let g:ctrlp_follow_symlinks = 0
let g:ctrlp_mruf_max = 100
let g:ctrlp_mruf_case_sensitive = 1
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll|o|swp|swo|lib|~)$',
            \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
            \ }

let g:ctrlp_brief_promp = 1
let g:ctrlp_match_window = 'min:4,max:15,results:50'
let g:ctrlp_line_prefix = '⇒ '
" Cache
if utils#GetOS() == 3
    "Windows
    let g:ctrlp_cache_dir = $HOME . '/vimfiles/cache/ctrlp'
    let g:ctrlp_funky_cache_dir = $HOME . '/vimfiles/cache/ctrlp_funky'
else
    " Anything other OS, assumed UNIX
    let g:ctrlp_cache_dir = $HOME . '/.vim/cache/ctrlp'
    let g:ctrlp_funky_cache_dir = $HOME . '/vimfiles/cache/ctrlp_funky'
endif
" Custom file seacher
if executable('ag')
    if utils#GetOS() == 3
        "Windows
        let g:ctrlp_user_command = 'ag -l --nocolor -g "" %s'
    else
        " Anything other OS, assumed UNIX
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    endif
endif
" Activate buffer delete extension
if ( exists('g:loaded_ctrlp') && g:loaded_ctrlp )
    call ctrlp_bdelete#init()
endif
" CtrlPFunky
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_funky_nerdtree_include_files = 1
"}}}

" LeaderF:
" Move up in normal mode for File
let g:Lf_NormalMap = { "File":   [["u", ':LeaderfFile ..<CR>']] }
let g:Lf_GtagsSkipUnreadable = 1
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WildIgnore = {'dir': ['.svn','.git','.hg'],'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]','*.dll']}

" UltiSnips: {{{ 2
let g:UltiSnipsExpandTrigger="<C-T>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<C-B>"
let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:mucomplete#ultisnips#match_at_start = 0

"}}}

" SnipMate: {{{2
let g:snips_author = $USER
let g:snipMate={}
let g:snipMate.snippet_version=1
" }}}

" Gutentags: {{{2
if executable( 'gtags-cscope' )
    let g:gutentags_modules = [ 'ctags', 'gtags_cscope' ]
else
    let g:gutentags_modules = [ 'ctags' ]
endif

let g:gutentags_define_advanced_commands=1
let g:gutentags_ctags_extra_args = [ '-R', '--sort=1', '--c++-kinds=+dplAU', '--python-kinds=-iz', '--tag-relative=yes', '--fields=+aimnSZ', '--extras=+q']
"let g:gutentags_trace = 1
" }}}
"
" Gtags:
let g:Gtags_No_Auto_Jump = 1
let g:Gtags_Close_When_Single = 0
let g:Gtags_UseQuickfixWindow = 0

" Tagbar: {{{2
let g:tagbar_map_showproto = "<Tab>"
let g:tagbar_sort = 1
if  exists('g:GuiLoaded')
    let g:tagbar_iconchars = ['▶', '∇']
endif
let g:tagbar_previewwin_pos = "botright"
" }}}

" Netrw: {{{ 2
let g:Netrw_UserMaps= [["u","utils#UserNetrwBrowseUpDir"],
            \["U","utils#UserNetrwBrowseBackRecentDir"],
            \["B","utils#UserNetrwBrowseForwardRecentDir"],
            \["-","utils#UserNetrwRexplore"]
            \]

" Autodate
"let g:autodate_format = '%d-%3m-%Y'
let g:autodate_format = '%B %d, %Y - %H:%M %p'
"let g:autodate_keyword_pre = '\s\cLast Change:'
let g:autodate_keyword_pre = 'Last Change:'

"}}}

" Startify: {{{2

if utils#GetOS() == 3
    "Windows
    let g:startify_session_dir = '~/vimfiles/sessions'
else
    " Anything other OS, assumed UNIX
    let g:startify_session_dir = '~/.vim/sessions'
endif


" Header
let g:startify_custom_header = [
\ ' ______  ____    __  __                     ',
\ '/\__  _\/\  _`\ /\ \/\ \  __                ',
\ '\/_/\ \/\ \ \/\ \ \ \ \ \/\_\    ___ ___    ',
\ '   \ \ \ \ \ \ \ \ \ \ \ \/\ \ /` __  __ \  ',
\ '    \ \ \ \ \ \_\ \ \ \_/ \ \ \/\ \/\ \/\ \ ',
\ '     \ \_\ \ \____/\ `\___/\ \_\ \_\ \_\ \_\',
\ '      \/_/  \/___/  `\/__/  \/_/\/_/\/_/\/_/',
\ '                                            ',
\ '                                            ',
\ "                 Version " . $TDVIMVERSION . "  ",
\ ]
"let s:startifyTdvimVer = "Version " . $TDVIMVERSION
"call add( g:startify_custom_header, s:startifyTdvimVer )

" Enable devicons
function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

" Empty status line for start window
autocmd User StartifyReady let &l:stl = "TDVim Version " . $TDVIMVERSION

" Items in startify window
let g:startify_lists = [
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ ]

let g:startify_commands = [
            \ {'f': ['Explorer', 'NERDTreeToggle']},
            \ {'t': ['Terminal', 'terminal']},
            \ ]

if utils#GetOS() == 3
    "Windows
    "let g:startify_bookmarks = [ {'c': ['TDVim user Config', '~/_myvimrc']} ]
    let g:startify_bookmarks = [ {'c': '~/_myvimrc'} ]
else
    " Anything other OS, assumed UNIX
    let g:startify_bookmarks = [ {'c': '~/.myvimrc'} ]
endif

let g:startify_files_number = 5

" Sessions
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
let g:startify_session_sort = 1
let g:startify_session_number = 10
let g:startify_session_persistence = 1
let g:startify_session_before_save = [
            \ 'echo "Cleaning up before saving.."',
            \ 'silent! NERDTreeTabsClose',
            \ 'silent! cclose',
            \ 'silent! call utils#CloseAllWindowsByType( "quickfix" )',
            \ 'silent! call utils#CloseAllWindowsByType( "preview" )',
            \ 'silent! call utils#CloseAllWindowsByType( "help" )'
            \ ]

"}}}

" FZF: {{{2
"let g:fzf_colors =
            "\ { 'fg':      ['fg', 'Normal'],
            "\ 'bg':      ['bg', 'Normal'],
            "\ 'hl':      ['fg', 'Comment'],
            "\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            "\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            "\ 'hl+':     ['fg', 'Statement'],
            "\ 'info':    ['fg', 'PreProc'],
            "\ 'border':  ['fg', 'Ignore'],
            "\ 'prompt':  ['fg', 'Conditional'],
            "\ 'pointer': ['fg', 'Exception'],
            "\ 'marker':  ['fg', 'Keyword'],
            "\ 'spinner': ['fg', 'Label'],
            "\ 'header':  ['fg', 'Comment'] }

"let g:fzf_tags_command = 'ctags -R --sort=1 --c++-kinds=+plAU --python-kinds=+iz --tag-relative=yes --fields=+ailmnS --extras=+q'

"}}}

" Rainbow Parentheses:
let g:rainbow_active=1

" Gitutter: {{{2
"let g:gitgutter_sign_added              = '¤'
"let g:gitgutter_sign_added              = '⇒'
let g:gitgutter_sign_added              = ''
let g:gitgutter_sign_modified           = '»'
let g:gitgutter_sign_removed            = '✗'
let g:gitgutter_sign_removed_first_line = ''
let g:gitgutter_sign_modified_removed   = ''
" }}}

" Vimade:
let g:vimade = {}
let g:vimade.basebg = [255,0,0]

"Easy Align {{{2
let g:easy_align_delimiters = {
\  ' ': { 'pattern': ' ',  'left_margin': 0, 'right_margin': 0, 'stick_to_left': 0 },
\  '=': { 'pattern': '===\|<=>\|\(&&\|||\|<<\|>>\)=\|=\~[#?]\?\|=>\|[:+/*!%^=><&|.-]\?=[#?]\?',
\                          'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
\  ':': { 'pattern': ':',  'left_margin': 0, 'right_margin': 1, 'stick_to_left': 1 },
\  ',': { 'pattern': ',',  'left_margin': 0, 'right_margin': 1, 'stick_to_left': 1 },
\  '|': { 'pattern': '|',  'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
\  '.': { 'pattern': '\.', 'left_margin': 0, 'right_margin': 0, 'stick_to_left': 0 },
\  '#': { 'pattern': '#\+', 'delimiter_align': 'l', 'ignore_groups': ['!Comment']  },
\  '&': { 'pattern': '\\\@<!&\|\\\\',
\                          'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
\  '{': { 'pattern': '(\@<!{',
\                          'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
\  '}': { 'pattern': '}',  'left_margin': 1, 'right_margin': 0, 'stick_to_left': 0 }
\ }
"}}}

" Indent Line: {{{2
let g:indentLine_enabled = 1
let g:indentLine_char = '┊'
let g:indentLine_fileType = ['c', 'cpp', 'python', 'vim', 'sh', 'csh', 'tcsh' ]
let g:indentLine_fileTypeExclude = ['qf', 'help', 'startify', 'vim-plug']
let g:indentLine_bufTypeExclude = ['help', 'terminal']
let g:indentLine_leadingSpaceEnabled = 1
" }}}

" Grepper {{{2
let g:grepper            = {}
let g:grepper.tools      = ['git', 'ag', 'grep']
let g:grepper.ag         = {}
let g:grepper.ag.grepprg = 'ag --vimgrep  --ignore *~ --ignore *.swp --ignore *.diff --ignore tags  --ignore *.tags '
let g:grepper.open       = 1
let g:grepper.switch     = 1
let g:grepper.jump       = 0
"let g:grepper.prompt_mapping_tool = '<leader>g'
let g:grepper.searchreg  = 1
let g:grepper.highlight  = 1
let g:grepper.dir        = 'repo,file'
let g:grepper.quickfix   = 0
" }}}

" Simply Fold:
let g:SimpylFold_docstring_preview = 1

" Jedi {{{2
let g:jedi#completions_command = ""
let g:jedi#goto_command = "]t"
let g:jedi#goto_assignments_command = ""
let g:jedi#usages_command = "[T"
let g:jedi#popup_on_dot = 1
let g:jedi#smart_auto_mappings = 1
let g:jedi#goto_stubs_command = ""
" }}}
"
" Flake8 {{{2
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=1
let g:flake8_max_markers=50
let g:flake8_error_marker='✗' "EE
let g:flake8_warning_marker='ω' "WW
" }}}

" Pymode {{{2
let g:pymode_run = 1
let g:pymode_breakpoint = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_completion_bind = ''
let g:pymode_rope_goto_definition_bind = '<]t>'
" }}}

" Nuake {{{2
let g:nuake_position = 'top'
let g:nuake_size = 0.4
" }}}

" }}}


" vim: ts=8 ft=vim nowrap fdm=marker
