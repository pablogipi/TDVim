-- Setup EasyAlign
local set = vim.opt
local cmd = vim.cmd
local fn = vim.fn


vim.cmd [[
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Enter interactive EasyAlign using Enter on selection"
xmap <silent> <Enter>   :LiveEasyAlign<CR>
xmap <silent> <leader>a :LiveEasyAlign<CR>
]]
