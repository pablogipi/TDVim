--Main NeoVim setup file

--Mantainer:	Pablo Gimenez <pablogipi@gmail.com>
--Last change:	2009 Dec 9
--

local set = vim.opt
local cmd = vim.cmd


-- --------------------
-- The very basics:
local options = {
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 1000,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = false,                  -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  scrolloff = 8,                           -- is one of my fav
  sidescrolloff = 8,
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
-- --------------------


-- Init settings {{{
--
-- Neovim sets some options by default: filetype plugin indent on
-- Neovim has nocompatible by default, it is ignored
--Allow backspacing over everything in insert mode
set.backspace={ 'indent','eol','start' }

-- Backup and swapfiles
set.backup   = false                          -- creates a backup file
set.history  = 50                           -- keep 50 lines of command line history
set.ruler    = true                                -- show the cursor position all the time
set.showcmd  = true                              -- display incomplete commands
set.wildmode = 'full'                        -- Complete the next full match


-- Ignores patterns in autocomplete
if vim.fn.has('windows') then
    set.wildignore:append('*\\.git\\*,*\\.hg\\*,*\\.svn\\*,*.swp,*.bak,*~')
else
    set.wildignore:append('*/.git/*,*/.hg/*,*/.svn/*,*.swp,*.bak,*~')
end

--Set viminfo. Mainly set history limits
--File history: 25
--Maximum lines per registry: 100
--Maximum sze of a register: 10KB
--Disable hlsearch
-- FIXME: viminfo doesn't work
--set.viminfo='25,<100,s10,h'
--if vim.fn.has('windows') then
    --set.viminfo:append('rA')
    --set.viminfo:append('rB')
--end

--Always run mswin at the end
--Load more conventional editors options, MSWin mode:
cmd "source $VIMRUNTIME/mswin.vim"
--Fix mswin, it enters in select mode rather than visual.
set.selectmode=""

--Auto change directory
set.autochdir=true

--Use OS clipboard:
set.clipboard:prepend('unnamed,unnamedplus')

-- }}}

--Sessions {{{
--Options for what to save in the sessions file:
set.sessionoptions='buffers,curdir,folds,resize,winsize'
--View, restore file state options:
set.viewoptions='cursor,folds,slash,unix'

--}}}

--Edit options and Language specific options {{{

--Set buffers to be hidden for easy switching
set.hidden=true

--Activate showmatch
set.showmatch=true

--Consider windows in other tabs when opening a buffer
set.switchbuf='usetab'

--Default editing setup:
--Settings common for all file types:

--Tabs width
set.shiftwidth  = 2
set.softtabstop = 2
set.shiftwidth  = 2
--Size for the TAB
set.tabstop=2
set.expandtab=true

--Always round indent to shiftwidth
set.shiftround=true

--Line numbering for all file formats:
set.number=true

--Better folding:
-- TODO: investigate how to enable this one
--set.foldtext=utils#NeatFoldText()

--Search settings {{{

--Do incremental searching
set.incsearch=true

--Switch on search pattern highlighting.
set.hlsearch=true

--Search case mode:
set.ignorecase=true
set.smartcase=true

--Global search by default
set.gdefault=true

--Better grep
--"if executable("rg")
    --"set grepprg=rg\ --vimgrep\ --no-heading\ -g\ '!*~'\ -g\ '!*.swp'\ -g\ '!*.diff'\ -g\ '!tags'\ -g\ '!*.tags'
    --"set grepformat=%f:%l:%c:%m,%f:%l:%m
--"endif
if vim.fn.executable("ag") then
    set.grepprg="ag --vimgrep --ignore *~ --ignore *.swp --ignore *.diff --ignore tags --ignore *.tags"
    set.grepformat='%f:%l:%c:%m,%f:%l:%m'
end

--}}}

--}}}

-- Interface settings {{{

-- In many terminal emulators the mouse works just fine, thus enable it.
set.mouse="a"

-- Color Theme
-- Leave this for the user settings, use desert as default
vim.cmd "colorscheme desert"

-- Command line height
set.cmdheight=2
-- Preview Window Height
set.previewheight=8

--Folding options: {{{2
--Default folding method id indent
set.foldmethod="indent"
--Folds margin width
set.foldcolumn="auto:5"
-- Minimum lines in a  fold to consider it a a proper fold
set.foldminlines=3
-- Fold starting level, set to 1 to have only level 1 folds ready
set.foldlevelstart=-1
-- Max nested level
set.foldnestmax = 3
-- }}}

-- Tabs label format:
-- set guitablabel=%{utils#GuiTabLabel()}

-- Completion {{{
-- Completion options
set.showmode=false
set.shortmess="aTt"
set.infercase=false
set.belloff:append('ctrlg') -- If Vim beeps during completion
set.belloff:append('cursor') -- If Vim beeps during scrolling
set.belloff:append('all') -- If Vim beeps during scrolling
set.completeopt:remove('preview')
set.completeopt:append('menuone')
set.completeopt:append('noinsert')
-- set completeopt+=noselect
-- Protect certain keymaps
-- inoremap <expr> <c-e> mucomplete#popup_exit("\<c-e>")
-- inoremap <expr> <c-y> mucomplete#popup_exit("\<c-y>")
-- inoremap <expr>  <cr> mucomplete#popup_exit("\<cr>")

-- Sources for searching in completion mode
-- Only include current buffer and buffer in other windows only
set.complete=".,w,b"

-- Set window splits to be at bottom by default, used by preview window and
-- quickfix
set.splitbelow=true
-- }}}

-- Status Line {{{2
-- Always show status line:
set.laststatus=2
-- Defaul status line
set.statusline="%-f%m%r%h%w%q %y %=[POS=%l,%v][%p%%]"
-- Disable show mode, not needed when using lightline or any other status line
-- plugin
set.showmode=false


-- }}}

-- Preview window {{{2
set.pvh=5
-- }}}

-- Invisible character {{{2
--set listchars=tab:▸\ ,eol:¬
set.listchars="tab:>-,eol:¬,space:.,trail:."
-- }}}

-- Lines wraping and formatting {{{2
set.wrap=true
set.textwidth=79
set.formatoptions="qrn1"
-- }}}


-- FoldDigest {{{2
--if exists("$FOLDDIGEST_POS")
    --let g:FoldDigest_Pos=$FOLDDIGEST_POS
--else
    --let g:FoldDigest_Pos="right"
--endif

-- }}}

-- Netrw {{{2
--let g:netrw_banner        = 0
--let g:netrw_sort_sequence = '[\/]$,*'
--let g:netrw_browse_split  = 4
-- }}}

-- window title {{{2
set.title=true
set.titlestring='TDVim'
-- }}}

---------------------------
--------------------------- }}}


-- TDVim version
vim.env.TDVIMVERSION="0.4dev"


-- vim: ts=2 ft=lua nowrap fdm=marker 
