-- User config overrides.
-- User config override must be in $HOME/myinit.lua in UNIX
-- or in %USERPROFILE%\myinit.lua in Windows
local env = vim.env
local cmd = vim.cmd
local fn = vim.fn

-- Set my color scheme
-- local colorscheme = "darkplus"
-- local colorscheme = "gruvbox"
local colorscheme = "tokyonight-night"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("Colorscheme " .. colorscheme .. " not found!. Revert to default")
end
