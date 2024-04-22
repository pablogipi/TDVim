-- Setup Autocomplete
local set = vim.opt
local cmd = vim.cmd
local fn = vim.fn

vim.cmd [[
  let g:NERDTreeHijackNetrw = 1 " Use NERD Tree instead of netrw
  " let g:NERDTreeFileExtensionHighlightFullName = 1
  " let g:NERDTreeExactMatchHighlightFullName = 1
  " let g:NERDTreePatternMatchHighlightFullName = 1
  " let g:NERDTreeLimitedSyntax = 1
  let NERDTreeIgnore=['\.swo$', '\.swp$','\.pyc$', '\.o$','\~$']
  let NERDTreeAutoDeleteBuffer = 1
  " NERDTree Git
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
]]
