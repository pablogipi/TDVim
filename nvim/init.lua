local opt = vim.opt
local env = vim.env
local cmd = vim.cmd
local fn = vim.fn

-- Disable netrw. Can affect other explorer plugins
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Load modules/plugins {{{
require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.gitsigns"
require "user.nvim-tree"
require "user.lualine"
require "user.toggleterm"
require "user.impatient"
require "user.indentline"
require "user.startify"
require "user.whichkey"
require "user.autocommands"
-- }}}

-- DEPRECATED: {{{
--require "user.colorscheme"
-- require "user.bufferline"
-- require "user.project"
-- require "user.alpha"
-- }}}

-- Setup cmdheight to support several lines of messages but not force to do
-- a press ENTER
local cmdheight = opt.cmdheight
opt.cmdheight=5
-- Load user config overrides if available
-- User config override will be in $HOME/myinit.lua in UNIX
-- User config override will be in $HOME/myinit.lua in UNIX
-- or in %USERPROFILE%\myinit.lua in Windows
if fn.has('windows') then
	package.path = env.USERPROFILE .. "\\?.lua;" .. package.path
else
	package.path = env.HOME .. "/?.lua;" .. package.path
end
local res, packer = pcall(require, "myinit")
local overridemsg = ""
if res then
  -- TODO: This is missing getting the path to the loaded myinit.lua script and
  -- print it.
  --vim.notify("Loaded user config overrides")
  overridemsg = " (Loaded user config overrides)"
end

-- End with TDVim version
-- vim.notify("TDVim " .. env.TDVIMVERSION .. " loaded" .. overridemsg)

-- Restore cmdheight
opt.cmdheight=cmdheight

-- vim: ts=2 ft=lua nowrap fdm=marker 
