-- Utility functions for TDVim on neovim
local opt = vim.opt
local env = vim.env
local cmd = vim.cmd
local fn = vim.fn

function tdvim_source_user_settings()
	-- Setup cmdheight to support several lines of messages but not force to do
	-- a press ENTER
	local cmdheight = opt.cmdheight
	opt.cmdheight = 5
	-- Load user config overrides if available
	-- User config override will be in $HOME/myinit.lua in UNIX
	-- User config override will be in $HOME/myinit.lua in UNIX
	-- or in %USERPROFILE%\myinit.lua in Windows
	if fn.has("windows") then
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
	opt.cmdheight = cmdheight
end
