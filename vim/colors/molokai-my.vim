" Vim color file
"
" Author: Tomas Restrepo <tomas@winterdom.com>
" https://github.com/tomasr/molokai
" Modified by: Mikhail Koksharov <Annigilat0r@yandex.ru>
"
" Note: Based on the Monokai theme for TextMate
" by Wimer Hazenberg and its darker variant
" by Hamish Stuart Macpherson
"

hi clear

if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="molokai"

" <{[ Gui
hi Boolean         guifg=#AE81FF
hi Character       guifg=#E6DB74
hi Number          guifg=#AE81FF
hi String          guifg=#E6DB74
hi Conditional     guifg=#F92672               gui=bold
hi Constant        guifg=#AE81FF               gui=bold
hi Cursor          guifg=#000000 guibg=#F8F8F0
hi iCursor         guifg=#000000 guibg=#F8F8F0
hi Debug           guifg=#BCA3A3               gui=bold
hi Define          guifg=#66D9EF
hi Delimiter       guifg=#8F8F8F
hi DiffAdd                       guibg=#13354A
hi DiffChange      guifg=#89807D guibg=#4C4745
hi DiffDelete      guifg=#960050 guibg=#1E0010
hi DiffText                      guibg=#4C4745 gui=italic,bold

hi Directory       guifg=#A6E22E               gui=bold
hi Error           guifg=#E6DB74 guibg=#1E0010
hi ErrorMsg        guifg=#F92672 guibg=#232526 gui=bold
hi Exception       guifg=#A6E22E               gui=bold
hi Float           guifg=#AE81FF
hi FoldColumn      guifg=#465457 guibg=#000000
hi Folded          guifg=#465457 guibg=#000000
hi Function        guifg=#A6E22E
hi Identifier      guifg=#FD971F
hi Ignore          guifg=#808080 guibg=bg
hi IncSearch       guifg=#C4BE89 guibg=#000000

hi Keyword         guifg=#F92672               gui=bold
hi Label           guifg=#E6DB74               gui=none
hi Macro           guifg=#C4BE89               gui=italic
hi SpecialKey      guifg=#66D9EF               gui=italic

hi MatchParen      guifg=#000000 guibg=#FD971F gui=bold
hi ModeMsg         guifg=#E6DB74
hi MoreMsg         guifg=#E6DB74
hi Operator        guifg=#F92672

" complete menu
hi Pmenu           guifg=#66D9EF guibg=#000000
hi PmenuSel                      guibg=#808080
hi PmenuSbar                     guibg=#080808
hi PmenuThumb      guifg=#66D9EF

hi PreCondit       guifg=#A6E22E               gui=bold
hi PreProc         guifg=#A6E22E
hi Question        guifg=#66D9EF
hi Repeat          guifg=#F92672               gui=bold
hi Search          guifg=#000000 guibg=#FFE792
" marks
hi SignColumn      guifg=#A6E22E guibg=#232526
hi SpecialChar     guifg=#F92672               gui=bold
hi SpecialComment  guifg=#7E8E91               gui=bold
hi Special         guifg=#66D9EF guibg=bg      gui=italic
if has("spell")
    hi SpellBad    guisp=#FF0000 gui=undercurl
    hi SpellCap    guisp=#7070F0 gui=undercurl
    hi SpellLocal  guisp=#70F0F0 gui=undercurl
    hi SpellRare   guisp=#FFFFFF gui=undercurl
endif
hi Statement       guifg=#F92672               gui=bold
hi StatusLine      guifg=#455354 guibg=fg
hi StatusLineNC    guifg=#808080 guibg=#080808
hi StorageClass    guifg=#FD971F               gui=italic
hi Structure       guifg=#66D9EF
hi Tag             guifg=#F92672               gui=italic
hi Title           guifg=#ef5939
hi Todo            guifg=#FFFFFF guibg=bg      gui=bold

hi Typedef         guifg=#66D9EF
hi Type            guifg=#66D9EF               gui=none
hi Underlined      guifg=#808080               gui=underline

hi VertSplit       guifg=#808080 guibg=#080808 gui=bold
hi VisualNOS                     guibg=#403D3D
hi Visual                        guibg=#403D3D
hi WarningMsg      guifg=#FFFFFF guibg=#333333 gui=bold
hi WildMenu        guifg=#66D9EF guibg=#000000

hi TabLineFill     guifg=#1B1D1E guibg=#1B1D1E
hi TabLine         guibg=#1B1D1E guifg=#808080 gui=none
hi Normal          guifg=#F8F8F2 guibg=#1B1D1E
hi Comment         guifg=#7E8E91
hi CursorLine                    guibg=#293739
hi CursorLineNr    guifg=#FD971F               gui=none
hi CursorColumn                  guibg=#293739
hi ColorColumn                   guibg=#232526
hi LineNr          guifg=#465457 guibg=#232526
hi NonText         guifg=#465457
hi SpecialKey      guifg=#465457
" ]}>

" <{[ 256-color terminal
if &t_Co > 255
   hi Normal          ctermfg=252 ctermbg=233
   hi CursorLine                  ctermbg=234   cterm=none
   hi CursorLineNr    ctermfg=208               cterm=none
   hi Boolean         ctermfg=140
   hi Character       ctermfg=143
   hi Number          ctermfg=140
   hi String          ctermfg=185
   hi Conditional     ctermfg=125               cterm=bold
   hi Constant        ctermfg=185
   hi Cursor          ctermfg=16  ctermbg=253
   hi Debug           ctermfg=13                cterm=none
   hi Define          ctermfg=72
   hi Delimiter       ctermfg=125

   hi DiffAdd                     ctermbg=24
   hi DiffChange      ctermfg=181 ctermbg=239
   hi DiffDelete      ctermfg=162 ctermbg=53
   hi DiffText                    ctermbg=102   cterm=bold

   hi Directory       ctermfg=106               cterm=bold
   hi Error           ctermfg=250 ctermbg=88
   hi ErrorMsg        ctermfg=15  ctermbg=124   cterm=bold
   hi Exception       ctermfg=125               cterm=bold
   hi Float           ctermfg=140
   hi FoldColumn      ctermfg=12  ctermbg=235
   hi Folded          ctermfg=12  ctermbg=235
   hi Function        ctermfg=110               cterm=bold
   hi Identifier      ctermfg=208               cterm=none
   hi Ignore          ctermfg=244 ctermbg=232
   hi IncSearch       ctermfg=16  ctermbg=74    cterm=none

   hi keyword         ctermfg=125               cterm=bold
   hi Label           ctermfg=229               cterm=none
   hi Macro           ctermfg=193
   hi SpecialKey      ctermfg=35

   hi MatchParen      ctermfg=15  ctermbg=202   cterm=bold
   hi ModeMsg         ctermfg=4
   hi MoreMsg         ctermfg=255
   hi Operator        ctermfg=125

   " complete menu
   hi Pmenu           ctermfg=16  ctermbg=250
   hi PmenuSel        ctermfg=255 ctermbg=240
   hi PmenuSbar                   ctermbg=232
   hi PmenuThumb      ctermfg=74

   hi PreCondit       ctermfg=106               cterm=bold
   hi PreProc         ctermfg=106
   hi Include         ctermfg=106                cterm=bold
   hi Question        ctermfg=72
   hi Repeat          ctermfg=125               cterm=bold
   hi Search          ctermfg=16  ctermbg=250   cterm=none

   " marks column
   hi SignColumn      ctermfg=106 ctermbg=235
   hi SpecialChar     ctermfg=125               cterm=bold
   hi SpecialComment  ctermfg=245               cterm=bold
   hi Special         ctermfg=174
   if has("spell")
       hi SpellBad                ctermbg=52
       hi SpellCap                ctermbg=17
       hi SpellLocal              ctermbg=17
       hi SpellRare  ctermfg=none ctermbg=none  cterm=reverse
   endif
   hi Statement       ctermfg=125               cterm=bold
   hi StatusLine      ctermfg=238 ctermbg=253
   hi StatusLineNC    ctermfg=244 ctermbg=232
   hi StorageClass    ctermfg=208
   hi Structure       ctermfg=72
   hi Tag             ctermfg=125
   hi Title           ctermfg=166
   hi Todo            ctermfg=16  ctermbg=185   cterm=bold

   hi Typedef         ctermfg=72
   hi Type            ctermfg=72                cterm=none
   hi Underlined      ctermfg=244               cterm=underline

   hi VertSplit       ctermfg=244 ctermbg=232   cterm=bold
   hi VisualNOS                   ctermbg=238
   hi Visual                      ctermbg=237
   hi WarningMsg      ctermfg=15  ctermbg=233    cterm=none
   hi WildMenu        ctermfg=74  ctermbg=232    cterm=bold

   hi Comment         ctermfg=244
   hi CursorColumn                ctermbg=236
   hi ColorColumn                 ctermbg=234
   hi LineNr          ctermfg=250 ctermbg=234
   hi NonText         ctermfg=59
end
" ]}>

" Must be at the end, because of ctermbg=234 bug.
" https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
set background=dark
