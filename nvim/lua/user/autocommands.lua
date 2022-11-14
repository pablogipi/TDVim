-- autocmd! remove all autocommands, if entered under a group it will clear that group
vim.cmd [[
  augroup tdvim_general_settings
    autocmd!
    " autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd FileType qf,help,man,lspinfo call utils#SetupAuxBuffer()  " Set up Auxiliary windows/buffers
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Search', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted " Not include Quickfix windows in buffer list
    autocmd Syntax python,cpp,c,sh,csh,vim highlight ExtraWhitespace ctermbg=lightred guibg=lightred "Extra white spaces highlight group as Red
  augroup end

  augroup tdvimAfterStartUp
    " Loaded message
    autocmd VimEnter * echomsg "TDVim " . $TDVIMVERSION . " loaded"
    autocmd VimEnter  * let &titlestring = "TDVim " . $TDVIMVERSION 
  augroup end

  augroup tdvimAfterSessionLoad
    autocmd SessionLoadPost * silent !title "DEV"
    " Set window title
    autocmd SessionLoadPost  * let &titlestring = "❰" . fnamemodify(v:this_session, ':t') . "❱" . "TDVim " . $TDVIMVERSION
  augroup end

  augroup tdvim_AftertBufferRead
    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufRead *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
    " Change local path to the folder containing the current buffer:
    autocmd BufRead * call utils#SetLocalPath()
    au BufRead,BufNewFile *.py,*.pyw,*.c,*.cpp,*.vim,*.h match ExtraWhitespace  /\s\+$/
  augroup end

  augroup tdvim_BufEnter
    " Set local path to path of current file
    autocmd BufEnter * call utils#SetLocalPath()
  augroup end

  " BufWinEnter
  augroup tdvimWinNew
    autocmd WinNew * call utils#PreviewWindowSetup()
  augroup END
  augroup tdvimWinEnter
    autocmd WinEnter * call utils#PreviewWindowSetup()
  augroup END
  " BufWinLeave
  augroup tdvimWinLeave
    autocmd WinLeave * call utils#LeavePreviewWindowSetup()
  augroup END

  augroup tdvimFileTypes
    autocmd FileType nerdtree call utils#SetupNERDTreeBuffer()
    autocmd! BufRead,BufNewFile *.usd set filetype=usd
    autocmd! BufRead,BufNewFile *.usda set filetype=usda
  augroup END

  augroup tdvim_git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup tdvim_markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup tdvim_auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup tdvim_start_screen
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
    autocmd User StartifyReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

]]

