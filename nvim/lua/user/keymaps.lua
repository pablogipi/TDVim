local noopts = {}
local opts = { noremap = true, silent = true }
local opts_nosilent = { noremap = true, silent = false }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


-- Modes {{{
-- Operations to change between modes

-- Command Line Mode - F2
keymap("n", "<F2>", ":", opts_nosilent)
keymap("v", "<F2>", ":", opts_nosilent)
keymap("i", "<F2>", "<c-o>:", opts_nosilent)

-- Press jk fast exit Insert and enter Normal mode
keymap("i", "jk", "<ESC>", opts)

-- }}}

-- Help {{{
-- Help commands
-- Get help for word under the cursor - <S-F1>
--keymap("n", "<S-F1>", ":h <C-r><C-w><CR>", opts)
--keymap("v", "<S-F1>", ":h <C-r><C-w><CR>", opts)
--keymap("x", "<S-F1>", ":h <C-r><C-w><CR>", opts)
--keymap("i", "<S-F1>", "<ESC>:h <C-r><C-w><CR>", opts)
keymap("n", "<S-F1>", "<cmd>lua require'telescope.builtin'.help_tags(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("v", "<S-F1>", "<cmd>lua require'telescope.builtin'.help_tags(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("x", "<S-F1>", "<cmd>lua require'telescope.builtin'.help_tags(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("i", "<S-F1>", "<c-o><cmd>lua require'telescope.builtin'.help_tags(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<C-F1>", "<cmd>call utils#ShowTDVimHelp()<CR>", opts)
keymap("v", "<C-F1>", "<cmd>call utils#ShowTDVimHelp()<CR>", opts)
keymap("x", "<C-F1>", "<cmd>call utils#ShowTDVimHelp()<CR>", opts)
keymap("i", "<C-F1>", "<c-o><cmd>call utils#ShowTDVimHelp()<CR>", opts)

-- }}}

-- MainOperations {{{
-- Main operations like open, save, new, quit, etc ...

-- Save - <leader>w
keymap("n", "<leader>w", ":w<CR>", opts_nosilent)
-- Save All - <leader>wa
keymap("n", "<leader>wa", ":wa<CR>", opts_nosilent)
-- Fuzzy Open File - S-F3, <leader>f, C-P
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("v", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<S-F3>", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("v", "<S-F3>", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("i", "<S-F3>", "<c-o><cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<C-P>", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("v", "<C-P>", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("i", "<C-P>", "<c-o><cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
-- Fuzzy Open Old File - C-S-F3, <leader>fo, C-Alt-P
keymap("n", "<leader>fo", "<cmd>lua require'telescope.builtin'.oldfiles(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("v", "<leader>fo", "<cmd>lua require'telescope.builtin'.oldfiles(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<C-S-F3>", "<cmd>lua require'telescope.builtin'.oldfiles(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("v", "<C-S-F3>", "<cmd>lua require'telescope.builtin'.oldfiles(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("i", "<C-S-F3>", "<c-o><cmd>lua require'telescope.builtin'.oldfiles(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<A-C-P>", "<cmd>lua require'telescope.builtin'.oldfiles(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("v", "<A-C-P>", "<cmd>lua require'telescope.builtin'.oldfiles(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("i", "<A-C-P>", "<c-o><cmd>lua require'telescope.builtin'.oldfiles(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)



-- }}}

-- Edit {{{
-- Keymaps for editing operations

-- Stay selection in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Better copy in visual mode. Paste and dont loose clipboard
keymap("v", "p", '"_dP', opts)

-- Move selected text up and down - Alt-[Up|Down]
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-Down>", ":m .+1<CR>==", opts)
keymap("v", "<A-Up>", ":m .-2<CR>==", opts)

-- Visual Block --
-- Move text up and down - Alt-[Up|Down]
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-Down>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-Up>", ":move '<-2<CR>gv-gv", opts)

-- }}}

-- TextNavigation {{{
-- Fuzzy Live Grep - S-F4
keymap("n", "<S-F4>", "<cmd>Telescope grep_string<cr>", opts)
-- Fuzzy Grep word under cursor - F4, C-t
keymap("n", "<F4>", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)


-- }}}

-- WindowManagement {{{
-- Operations to work with windows, tabs, etc ...

-- Close Window - <leader>q
keymap("n", "<leader>q", "<C-w>c", opts)
keymap("v", "<leader>q", "<C-w>c", opts)
-- Close All Help Windows - <leader>qh
keymap("n", "<leader>qh", ":silent HelpAllClose<CR>", opts)
keymap("v", "<leader>qh", ":silent HelpAllClose<CR>", opts)

-- Close Window and Delete Buffer - <leader>x
keymap("n", "<leader>x", ":Bdelete!<CR>", opts_nosilent)
keymap("v", "<leader>x", ":Bdelete!<CR>", opts_nosilent)

-- Vertical Split Window - <leader>s
keymap("n", "<leader>s", "<C-w>v", opts)
keymap("v", "<leader>s", "<C-w>v", opts)
-- Horizontal Split Window - <leader>s
keymap("n", "<leader>sh", "<C-w>s", opts)
keymap("v", "<leader>sh", "<C-w>s", opts)

-- Better window navigation - <leader>[Up|Down|Left|Right]
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<leader><Left>", "<C-w>h", opts)
keymap("n", "<leader><Up>", "<C-w>j", opts)
keymap("n", "<leader><Down>", "<C-w>k", opts)
keymap("n", "<leader><Right>", "<C-w>l", opts)

-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Explorer - F8, <leader>e
-- keymap("n", "<F8>", ":Lex 10<cr>", opts)
-- keymap("n", "<leader>e", ":Lex 10<cr>", opts)
keymap("n", "<F8>", ":NvimTreeToggle<cr>", opts) -- Nvimtree
-- keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
-- In Explorer - -
-- keymap("n", "-", ":Explore<CR>", opts)
-- keymap("n", "-", "<cmd>lua require'user.nvim-tree'.toggle_replace()<CR>", opts)

-- Resize with arrows - Ctrl[Up|Down|Left|Right]
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Reset windows sizes - <leader>=
keymap("n", "<leader>=", "<C-w>=", opts)
keymap("v", "<leader>=", "<C-w>=", opts)

-- Switch to Previous window
keymap("n", "<leader>p", "<C-w>p", opts)
-- Switch to Previous buffer - Ctrl-F3, <leader>TAB
keymap("n", "<C-F3>", ":e #<CR>", opts)
keymap("v", "<C-F3>", ":e #<CR>", opts)
keymap("i", "<C-F3>", "<c-o>:e #<CR>", opts)
keymap("n", "<leader><TAB>", ":e #<CR>", opts)
keymap("v", "<leader><TAB>", ":e #<CR>", opts)

-- Navigate buffers - []b
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<[b>", ":bnext<CR>", opts)
keymap("n", "<]b>", ":bprevious<CR>", opts)

-- Pick buffer = gb
keymap("n", "gb", ":BufferLinePick<CR>", opts)

-- Navigate Buffers - F3, <leader>b
-- keymap("n", "<F3>", ":buffer ", opts_nosilent)
keymap("n", "<F3>", "<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("v", "<F3>", "<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("x", "<F3>", "<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("i", "<F3>", "<c-o><cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)


-- }}}

-- CommandLine {{{
-- Keymaps to work fro mthe command line

-- }}}

-- Development {{{
-- Operations usaully used when programing
--
-- Current file symbols fuzzy search
-- keymap("n", "<F6>", "<cmd>lua require'telescope.builtin'.lsp_document_symbols(require('telescope.themes').get_dropdown({}))<cr>", opts)
keymap("n", "<F6>", "<cmd>lua require'telescope.builtin'.treesitter(require('telescope.themes').get_dropdown({}))<cr>", opts)
-- Current file diagnostics fuzzy search
keymap("n", "<C-F6>", "<cmd>lua require'telescope.builtin'.diagnostics(require('telescope.themes').get_ivy({}))<cr>", opts)

-- Format using LSP
keymap("n", "<leader>f", ":Format<cr>", opts)


-- Comments {{{2
-- Comments - F5, <leader>ct
keymap("n", "<F5>", "gcc", noopts)
keymap("v", "<F5>", "gc", noopts)
keymap("i", "<F5>", "<c-o>gcc", noopts)
keymap("n", "<leader>ct", "gcc", noopts)
keymap("v", "<leader>ct", "gc", noopts)
-- Block Comments - C-F5, <leader>cb
keymap("n", "<C-F5>", "gbc", noopts)
keymap("v", "<C-F5>", "gb", noopts)
keymap("i", "<C-F5>", "<c-o>gbc", noopts)
keymap("n", "<leader>cb", "gbc", noopts)
keymap("v", "<leader>cb", "gb", noopts)
-- Yank & Comments - S-F5, <leader>cy
-- XXX: normal mode version works onlt for one line, visual is designed for
-- block comments
keymap("n", "<S-F5>", "yygcc", noopts)
keymap("v", "<S-F5>", "ygvgb", noopts)
keymap("i", "<S-F5>", "<c-o>gbc", noopts)
keymap("n", "<leader>cy", "yygcc", noopts)
keymap("v", "<leader>cy", "ygvgb", noopts)
-- }}}

-- GIT {{{2
-- Git status fuzzy search
keymap("n", "<F9>", "<cmd>lua require'telescope.builtin'.git_status(require('telescope.themes').get_dropdown({}))<cr>", opts)
-- Implemented in user/gitsigns.lua
-- Diff this - S-F9, <leader>hd
-- Navigate Previous/Next hunk - []c 
-- Preview hunk - <leader>hp
-- Blame line - <leader>hb

-- }}}

-- LSP {{{2
-- LSP keymaps Implemented in user/lsp/handlers.lua 
-- Go to Declaration - gD
-- Go to Definitio - gd
-- Symbol help (hover) - K
-- Show references - gr
-- Show diagnostics - gl
-- Navigate diagnostics = []k
-- Send diagnostics to local list window - <leader>lq
--
-- }}}

-- }}}

-- Terminal {{{
-- Operations usaully used when programing
-- Defined in toggleterm.lua 
-- Toggle Terminal - C-\



-- }}}



-- vim: ts=2 ft=lua nowrap fdm=marker 
