" Vim syntax file
" Language:	nmake
" Maintainer:	Rich Brack
" Last Change:	06/21/2005
" Version:     0.6
" URL:	http://www.bell-labs.com/project/nmake/newsletters/issue020.html

" vim highlighting documentation:
" http://www.vim.org/htmldoc/usr_44.html
" http://www.ph.unimelb.edu.au/~ssk/vim/syntax.html

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case match

" operators
syn match nmkOperator	":"
syn match nmkOperator	"::"
syn match nmkOperator	":[a-zA-Z0-9_.]\+:"
syn match nmkNone	":="

" state variable
syn match nmkVariable	"([a-zA-Z0-9_.]\+)" contains=nmkVariable

" try to handle complex variable nesting and edit operations.
" still doesn't catch everything :-(
syn match nmkVariable	"\(([[:alnum:][:blank:]|,._%:*\\+-]\+)\|()\)" contained contains=nmkVariable

" variables
syn region nmkVariable	matchgroup=nmkVars start=/\$\+(/ end=/)/ contains=nmkVariable oneline

" strings
syn region nmkString	start=/"/ end=/"/ contains=nmkVariable
syn region nmkString	start=/=/ end=/$/ contains=nmkVariable oneline

" commands
syn keyword	nmkKey	elif else end error eval for if include let local print return set while

" special atoms
setlocal iskeyword+=.
syn keyword	nmkAtom	.ACCEPT .ACTIONWRAP .ACTIVE .AFTER .ALARM .ALWAYS .APPEND .ARCHIVE .ARGS .ATTRIBUTE .BATCH .BATCHED .BEFORE .BIND .BOUND .BUILT .CLEAR .COMMAND .COMPDONE .COMPINIT .DONE .DONTCARE .ENTRIES .ERROR .EXISTS .EXPORT .FAILED .FILE .FORCE .FOREGROUND .FUNCTION .FUNCTIONAL .GLOBALFILES .IGNORE .IMMEDIATE .IMPLICIT .INIT .INSERT .INTERNAL .INTERRUPT .JOINT .LOCAL .MAIN .MAKE .MAKEDONE .MAKEFILES .MAKEINIT .MAKING .MEMBER .METARULE .MULTIPLE .NOCROSSPROCUCT .NOTYET .NULL .OPERATOR .OPTIONS .PARAMETER .QUERY .READ .REBIND .REGULAR .REPEAT .REQUIRE .RETAIN .SCAN .SCAN.IGNORE .SCAN.NULL .SCAN.STATE .SCANNED .SEMAPHORE .SOURCE .SPECIAL .STATE .STATERULE .STATEVAR .SYNC .TARGET .TERMINAL .TMPLIST .TRIGGERED .UNBIND .USE .VIEW .VIRTUAL

" highlight .pattern differently (eg .h in .SOURCE.h)
setlocal iskeyword+=%
syn match	nmkPat	"\%[\.%]\.[a-zA-Z0-9%_+-]\+\>" contained
syn match	nmkAtom	"\<\.\(SOURCE\|SCAN\|APPEND\|BIND\|REQUIRE\|ATTRIBUTE\|INSERT\|NOCROSSPRODUCT\)\%[\.%]\.[a-zA-Z0-9%_+-]\+\>" contains=nmkPat

" comments
syn region	nmkComment	start="/\*"	end="\*/" 
syn keyword makeTodo TODO FIXME XXX contained

" flag spaces in first column, should be tabs only
syn match	nmkError	"^ \+"
syn match	nmkError	"^\t\+ \+"

" sync
syn sync minlines=20 maxlines=200

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_nmake_syn_inits")
  if version < 508
    let did_nmake_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink nmkOperator	Operator
  HiLink nmkVariable	Special
  HiLink nmkVars	PreProc
  HiLink nmkString	String
  HiLink nmkKey	Statement
  HiLink nmkAtom	Statement
  HiLink nmkPat	Special
  HiLink nmkComment	Comment
  HiLink nmkError	Error
  hi def link makeTodo		Todo

  delcommand HiLink
endif

let b:current_syntax = "nmake"

" vim:ts=15
