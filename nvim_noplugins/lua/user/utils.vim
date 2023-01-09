" Vim setup utilities file
"
" Mantainer:    Pablo Gimenez <pablogipi@gmail.com>
" Last change:  October 06, 2021 - 01:37 AM.
"
"


" TabAutocompleteWrapper {{{
" Function to call to Autocomplete when pressing TAB
" Or insert a TAB if there is nothing in front of the cursor
" From: https://stackoverflow.com/questions/2055417/mapping-tab-to-omicompletion-in-gvim 
" TODO: see if we can integrate SnipMate here
function! utils#TabAutocompleteWrapper( direction)
  " Make TAB working in popup menu
  if pumvisible()
    if "backward" == a:direction
      return "\<C-P>"
    else
      return "\<C-N>"
    endif
  endif
  " Pass a normal TAB if there is no character in front.
  " Use autocomplete if there is something in front of the cursor
  let char_before = col('.') - 1
  if !char_before || getline('.')[char_before - 1] !~ '\k'
    "if "backward" == a:direction
    "return "\<BS>"
    "else
    "return "\<tab>"
    "endif
    return "\<tab>"
  elseif "backward" == a:direction
    return "\<c-p>"
  else
    return "\<c-n>"
  endif
endfunction
" }}}

" vim: ts=2 ft=vim nowrap fdm=marker
