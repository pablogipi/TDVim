-- Setup Autocomplete
local set = vim.opt
local cmd = vim.cmd
local fn = vim.fn

-- Get current script dir
local curpath = debug.getinfo(1).short_src
if fn.has('windows') then
  curpath = string.gsub(curpath, "/", "\\") 
  curpath = string.gsub(curpath, "^(.+\\)[^\\]+$", "%1")
else
  curpath = string.gsub(curpath, "\\", "/") 
  curpath = string.gsub(curpath, "^(.+/)[^/]+$", "%1")
end
local utilspath = curpath .. "utils.vim"
--print(string.gsub(debug.getinfo(1).short_src, "^(.+\\)[^\\]+$", "%1"))
--fn.source("utils.vim")
cmd ("source " .. utilspath)


