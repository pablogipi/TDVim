-- Setup Autocomplete
local set = vim.opt
local cmd = vim.cmd
local fn = vim.fn

--[[ -- Get current script dir
local curpath = debug.getinfo(1).short_src
if fn.has('windows') then
  curpath = string.gsub(curpath, "/", "\\") 
  curpath = string.gsub(curpath, "^(.+\\)[^\\]+$", "%1")
else
  curpath = string.gsub(curpath, "\\", "/") 
  curpath = string.gsub(curpath, "^(.+/)[^/]+$", "%1")
end
local utilspath = curpath .. "startify.vim"
--print(string.gsub(debug.getinfo(1).short_src, "^(.+\\)[^\\]+$", "%1"))
--fn.source("utils.vim")
cmd ("source " .. utilspath) ]]

vim.cmd [[
  if has('win32')
      "Windows
      let g:startify_session_dir = '~/vimfiles/sessions'
  else
      " Anything other OS, assumed UNIX
      let g:startify_session_dir = '~/.vim/sessions'
  endif


  " Header
  let g:startify_custom_header = [
  \ ' ______  ____    __  __                     ',
  \ '/\__  _\/\  _`\ /\ \/\ \  __                ',
  \ '\/_/\ \/\ \ \/\ \ \ \ \ \/\_\    ___ ___    ',
  \ '   \ \ \ \ \ \ \ \ \ \ \ \/\ \ /` __  __ \  ',
  \ '    \ \ \ \ \ \_\ \ \ \_/ \ \ \/\ \/\ \/\ \ ',
  \ '     \ \_\ \ \____/\ `\___/\ \_\ \_\ \_\ \_\',
  \ '      \/_/  \/___/  `\/__/  \/_/\/_/\/_/\/_/',
  \ '                                            ',
  \ '                                            ',
  \ "                 Version " . $TDVIMVERSION . "  ",
  \ ]
  "let s:startifyTdvimVer = "Version " . $TDVIMVERSION
  "call add( g:startify_custom_header, s:startifyTdvimVer )

  " Enable devicons
  " let g:Get_dev_icon = luaeval('require("nvim-web-devicons").get_icon')
  function! StartifyEntryFormat()
      return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
      " let s:icon = Get_dev_icon(absolute_path)
      " return 'Get_dev_icon(absolute_path) ." ". entry_path'
      " return 'lua require'nvim-web-devicons'.get_icon(absolute_path, "", "") . " " . entry_path'
      " return "luaeval('require(\"nvim-web-devicons\").get_icon(absolute_path, \"\", \"\")') . \" \" . entry_path"
      " return "luaeval('require(\"nvim-web-devicons\").get_icon(absolute_path)') . \" \" . entry_path"
  endfunction

  " Empty status line for start window
  autocmd User StartifyReady let &l:stl = "TDVim Version " . $TDVIMVERSION

  " Items in startify window
  let g:startify_lists = [
              \ { 'type': 'files',     'header': ['   MRU']            },
              \ { 'type': 'sessions',  'header': ['   Sessions']       },
              \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
              \ { 'type': 'commands',  'header': ['   Commands']       },
              \ ]

  let g:startify_commands = [
              \ {'f': ['Explorer', 'NvimTreeOpen']},
              \ {'t': ['Terminal', 'ToggleTerm']},
              \ ]

  if has('win32') 
      "Windows
      "let g:startify_bookmarks = [ {'c': ['TDVim user Config', '~/_myvimrc']} ]
      let g:startify_bookmarks = [ {'c': '~/_myinit.lua'} ]
  else
      " Anything other OS, assumed UNIX
      let g:startify_bookmarks = [ {'c': '~/.myinit.lua'} ]
  endif

  let g:startify_files_number = 5

  " Sessions
  let g:startify_change_to_dir = 1
  let g:startify_change_to_vcs_root = 1
  let g:startify_session_sort = 1
  let g:startify_session_number = 10
  let g:startify_session_persistence = 1
  " let g:startify_session_before_save = [
              " \ 'echo "Cleaning up before saving.."',
              " \ 'silent! NERDTreeTabsClose',
              " \ 'silent! cclose',
              " \ 'silent! call utils#CloseAllWindowsByType( "quickfix" )',
              " \ 'silent! call utils#CloseAllWindowsByType( "preview" )',
              " \ 'silent! call utils#CloseAllWindowsByType( "help" )'
              " \ ]
  let g:startify_session_before_save = [
              \ 'echo "Cleaning up before saving.."',
              \ 'silent! NvimTreeClose',
              \ 'silent! cclose'
              \ ]
]]
