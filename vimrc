"
" Main Vim setup file
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

" Vim Plug - Load plugins {{{
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
if utils#GetOS() == 3
    "Windows
    call plug#begin('~/vimfiles/plugged')
else
    " Anything other OS, assumed UNIX
    call plug#begin('~/.vim/plugged')
endif

" Misc
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'tomtom/tlib_vim'
Plug 'tomtom/ttodo_vim'
"Plug 'vim-scripts/HelpClose', { 'on': 'HelpClose' }
Plug 'vim-scripts/HelpClose'

" UI
" NERD Tree will be loaded on the first invocation of NERDTreeToggle command
"Plug 'scrooloose/nerdtree',              { 'on': 'NERDTreeToggle' }
" CtrlP
"Plug 'kien/ctrlp.vim',                   { 'on': ['CtrlP', 'CtrlPBuffer', 'CtrlPMRU', 'CtrlPTag', 'CtrlPBufTag'] }
"Plug 'fisadev/vim-ctrlp-cmdpalette',     { 'on': ['CtrlP', 'CtrlPBuffer', 'CtrlPMRU', 'CtrlPTag', 'CtrlPBufTag'] }
"Plug 'd11wtq/ctrlp_bdelete.vim'
" Lightline
Plug 'itchyny/lightline.vim'
" Tagbar
Plug 'majutsushi/tagbar',                { 'on':  ['TagbarToggle', 'TagbarCurrentTag']}
" Mini Buf Explorer
"Plug 'fholgado/minibufexpl.vim'
" Tabline buffers
Plug 'taohex/lightline-buffer'
" Gundo
Plug 'sjl/gundo.vim',                    { 'on': 'GundoToggle' }
" Maximizer
Plug 'szw/vim-maximizer',                { 'on': 'MaximizerToggle' }

" Development
" Autocomplete
"Plug 'ajh17/VimCompletesMe'
"Plug 'lifepillar/vim-mucomplete'
" OmniCppComplete
Plug 'vim-scripts/OmniCppComplete',      { 'for': ['cpp', 'c'] }
" FSwitch
Plug 'derekwyatt/vim-fswitch'
" Snipmate
Plug 'SirVer/ultisnips',                 { 'for': ['cpp', 'c', 'python', 'vim'] }
Plug 'honza/vim-snippets',               { 'for': ['cpp', 'c', 'python', 'vim'] }
" Task List
Plug 'vim-scripts/TaskList.vim',         { 'for': ['cpp', 'c', 'python', 'vim'] }
" Cpp Enhanced Syntax
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['cpp', 'c'] }
" Guten Tags
Plug 'ludovicchabant/vim-gutentags',     { 'for': ['cpp', 'c', 'vim'] }
" Autodate
Plug 'vim-scripts/autodate.vim'
" Diffchanges
Plug 'vim-scripts/diffchanges.vim'
" Fugitive (GIT)
"Plug 'tpope/vim-fugitive',               { 'on':  ['Gstatus', 'Glog', 'Gdiff', 'Gcommit', 'Ggrep', 'Gedit']}
Plug 'tpope/vim-fugitive',               { 'for': ['cpp', 'c', 'vim', 'python'], 'on':  ['Gstatus', 'Glog', 'Gdiff', 'Gcommit', 'Ggrep', 'Gedit'] }
Plug 'itchyny/vim-gitbranch' 


" Editing
" Nerd Commenter
Plug 'scrooloose/nerdcommenter'
" Easy Align
Plug 'junegunn/vim-easy-align',          { 'on': 'LiveEasyAlign' }
"Plug 'junegunn/vim-easy-align'
" Surround
Plug 'tpope/vim-surround'
" Incsearch
Plug 'haya14busa/incsearch.vim'
" Anzu
Plug 'osyo-manga/vim-anzu'
" Ack
Plug 'mileszs/ack.vim',                  { 'on': 'Ack' }
" Delimit Mate
Plug 'Raimondi/delimitMate'

" Colors
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/seoul256.vim'
Plug 'reedes/vim-colors-pencil'
Plug 'rakr/vim-one'


" Initialize plugin system
call plug#end()

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

" Do not keep a backup file, use versions instead
if has("vms")
    set nobackup		
endif

set backup                               " keep a backup file
set history=50                           " keep 50 lines of command line history
set ruler                                " show the cursor position all the time
set showcmd                              " display incomplete commands
set wildmode=full                        " Complete the next full match
" Ignores patterns in autocomplete
if utils#GetOS() == 1
    "Linux
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.swp,*.bak
elseif utils#GetOS() == 2
    "Mac
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.swp,*.bak
elseif utils#GetOS() == 3
    "Windows
    set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*,*.swp,*.bak
endif

" Check terminals colors, if is not a 256 color terminal make a warning
if !has('gui_running') && &t_Co < 256
    echomsg "Current terminal doesn't support 256 colors. Some colors and the status line won't look correctly"
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

" }}}

" Sessions {{{
" Options for what to save in the sessions file:
let &sessionoptions='buffers,curdir,folds,tabpages,winsize'
" View, restore file state options:
let &viewoptions='cursor,folds,slash,unix'
" Backup and swap files
let tmpdir = "$TMPDIR/vim"
let &backupdir = tmpdir . "//" . ",."
let &directory = tmpdir . "//" . ",."

" }}}

" Auto change directory {{{
set autochdir
" }}}

" Terminal settings {{{
set ttyfast

" }}}

" Edit options and Language specific options {{{
"
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
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
set shortmess+=c
set noinfercase
set belloff+=ctrlg " If Vim beeps during completion
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
" Disable show mode, not needed when using lighline or any other status line
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

"""""""""""""""""""""""""""
""""""""""""""""""""""""""" }}}

" GUI {{{
if has("gui_running")
    set mousehide		" Hide the mouse when typing text
    set mousemodel=popup	" Enable popup menu using mouse

    " Set GUI font and general options
    if has('gui_gtk2')
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
    augroup END
    " BufEnter
    augroup tdvimBufEnter
        " Set local path to path of current file
        autocmd BufEnter * call utils#SetLocalPath()
        " Set preview window syntax
        "autocmd BufEnter * 
            "\if &previewwindow | 
            "\   set filetype=passwd |
            "\   endif
        "autocmd BufEnter * 
            "\if &previewwindow | 
            "\   call utils#PreviewWindowSetup() |
            "\   endif
        autocmd BufEnter * call utils#PreviewWindowSetup()
        " Call TDVim Project
        autocmd BufEnter * call utils#ProjectSettings(expand("<afile>:p:h"), 0)
    augroup END
    " BufLeave
    "augroup tdvimBufLeave
    "augroup END
    " BufWinEnter
    "augroup tdvimBufWinEnter
    "augroup END
    " BufWinLeave
    "augroup tdvimBufWinLeave
    "augroup END
    " FileTypes
    augroup tdvimFileTypes
	autocmd Filetype *
		    \	if &omnifunc == "" |
		    \		setlocal omnifunc=syntaxcomplete#Complete |
		    \	endif
    augroup END
    " SessionLoadPost
    "augroup tdvimSessionLoadPost
    "augroup END

else
    set autoindent		" always set autoindenting on
endif " has("autocmd")

" }}}

" Custom commands {{{
call commands#InitCommands()
" }}}

" Setup Plugins {{{
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

" Maximize
let g:maximizer_set_default_mapping = 0

" NERD Tree
let g:NERDTreeHijackNetrw = 1 " Use NERD Tree instead of netrw

" NERD Commenter
let g:NERDMenuMode = 0 " Disable menu

" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Session
let g:session_command_aliases = 1 " Enable vim-session commands aliases
let g:session_menu            = 0 " Disable vim-session menu
let g:session_autoload        = 0 " Disable load session on startup

" lightline
" use lightline-buffer in lightline
let g:lightline = {
        \ 'tabline': {
                \ 'left': [ [ 'bufferinfo' ], [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
                \ 'right': [ [ 'close' ], ],
                \ },
        \ 'component_expand': {
                \ 'buffercurrent': 'lightline#buffer#buffercurrent2',
                \ },
        \ 'component_type': {
                \ 'buffercurrent': 'tabsel',
                \ },
        \ 'component_function': {
                \ 'bufferbefore': 'lightline#buffer#bufferbefore',
                \ 'bufferafter': 'lightline#buffer#bufferafter',
                \ 'bufferinfo': 'lightline#buffer#bufferinfo',
                \ },
        \ 'component': {
                \ 'mode': '%{utils#LightlineMode()}',
                \ 'preview': '%{utils#LightlinePreview()}',
        \       }, 
        \ }

"'left': [ [ 'preview', 'filename', 'modified' ], ],
"let g:lightline.active = {
            "\ 'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ],
            "\ 'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype' ], [ 'git' ] ]
            "\   }
let g:lightline.active = {
            \ 'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ],
            \ 'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'git', 'filetype' ] ]
            \   }

let g:lightline.inactive = {
            \ 'left': [ [ 'preview', 'filename', 'modified' ] ],
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
let g:lightline_buffer_excludes   = ['vimfiler']
let g:lightline_buffer_maxflen    = 30
let g:lightline_buffer_maxfextlen = 3
let g:lightline_buffer_minflen    = 16
let g:lightline_buffer_minfextlen = 3
let g:lightline_buffer_reservelen = 20

" delimitMate
" We need this here to avoid problems with delimitMate
let delimitMate_balance_matchpairs = 1
let delimitMate_expand_space       = 1
let delimitMate_expand_cr          = 1

" OmniCppComplete
let OmniCpp_DefaultNamespaces   = ["std"]
let OmniCpp_MayCompleteDot      = 0
let OmniCpp_MayCompleteArrow    = 0
let OmniCpp_SelectFirstItem     = 1
let OmniCpp_ShowScopeInAbbr     = 1
let OmniCpp_ShowPrototypeInAbbr = 0

" VimCompletesMe

" MuComplete
let g:mucomplete#chains = {
      \ 'default': ['file', 'c-p', 'uspl'],
      \ 'cpp':     ['file', 'ulti', 'omni', 'c-p'],
      \ 'c':       ['file', 'omni', 'c-p'],
      \ 'python':  ['file', 'omni', 'c-p'],
      \ 'vim':     ['file', 'cmd', 'c-p']
      \ }
let g:mucomplete#popup_direction = { 'c-p': 1 }
let g:mucomplete#buffer_relative_paths = 1

" CtrlP
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_switch_buffer = 'vht'
let g:ctrlp_reuse_window = 'startify\|netrw'
let g:ctrlp_max_files = 1000
let g:ctrlp_max_depth = 5
let g:ctrlp_follow_symlinks = 0
let g:ctrlp_mruf_max = 100
let g:ctrlp_mruf_case_sensitive = 1
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll|o|swp|swo|lib)$',
            \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
            \ }
" Activate buffer delete extension
if ( exists('g:loaded_ctrlp') && g:loaded_ctrlp ) 
    call ctrlp_bdelete#init()
endif

" UltiSnips
let g:UltiSnipsExpandTrigger="<C-T>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<C-B>"
let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:mucomplete#ultisnips#match_at_start = 0

" Ttodo

" Gutentags
"let g:gutentags_define_advanced_commands=1

" Netrw
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

" }}}
"
" Global variables {{{

" TDVim version
let $TDVIMVERSION="0.2"

" }}}


" vim: ts=8 ft=vim nowrap fdm=marker

