-- vim-rooter setup

vim.g.rooter_patterns = {'.git', '.svn', 'package.json', '!node_modules'} -- Patterns1 to1 detect1 repos
vim.g.rooter_cd_cmd = "lcd" -- Use local cwd
vim.g.rooter_targets = "/,*.yml,*.yaml,*.json,*.py,*.lua,*.c,*.C,*.cpp,*.h,*.vfl,*.sh,*.bat,*.cmd,*.vim"
-- " Directories and YAML files
-- let g:rooter_targets = '/,*.yml,*.yaml'
