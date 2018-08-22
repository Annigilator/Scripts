" Highlight function names
if !exists('g:cpp_no_function_highlight')
    syn match cCustomParen transparent "(" contains=cParen contains=cCppParen
    syn match cCustomFunc "\w\+(\@=" contains=cCustomParen
endif

" Default highlighting
hi def link cCustomFunc    Function
hi def link cFunction      Function
