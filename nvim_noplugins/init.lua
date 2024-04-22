local env = vim.env
local cmd = vim.cmd
local fn = vim.fn

require "user.options"
require "user.keymaps"
require "user.cmp"

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
if res then
  -- TODO: This is missing getting the path to the loaded myinit.lua script and
  -- print it.
  vim.cmd "echomsg \"Loaded user config overrides\""
end

-- End with TDVim version
vim.notify("TDVim " .. env.TDVIMVERSION .. " loaded")
