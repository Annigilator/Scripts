" Highlight function names
if !exists('g:cpp_no_function_highlight')
    syntax match cCustomParen transparent "(" contains=cParen contains=cCppParen
    syntax match cCustomFunc  "\w\+(\@="
endif

" raw string literals
syntax region cppRawString matchgroup=cppRawDelimiter start=@\%(u8\|[uLU]\)\=R"\z([[:alnum:]_{}[\]#<>%:;.?*\+\-/\^&|~!=,"']\{,16}\)(@ end=/)\z1"/ contains=@Spell

" Default highlighting
hi def link cCustomFunc        Function
hi def link cppRawString       String
hi def link cppRawDelimiter    Delimiter
