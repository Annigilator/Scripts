" =============================================================================
" =========================== Bundle Settings =================================
" =============================================================================
set nocompatible  " Use Vim defaults instead of 100% vi compatibility
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" Let Vundle manage itself
Plugin 'gmarik/Vundle.vim'

" Code autocomplete
Plugin 'Valloric/YouCompleteMe'
" Code errors checking
Plugin 'scrooloose/syntastic'
" Fast fs tree navigation
Plugin 'scrooloose/nerdtree'
" Features for python
Plugin 'klen/python-mode'
" Lean & mean status line
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Snippets support
Plugin 'SirVer/ultisnips'
" Git features
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

call vundle#end()
filetype plugin indent on " required by Vundle

" =============================================================================
" =========================== Plugins Settings ================================
" =============================================================================
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_goto_buffer_command = 'vertical-split'
let g:ycm_show_diagnostics_ui = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_use_ultisnips_completer = 0

let g:syntastic_auto_jump = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_mode_map = {
            \'mode': 'active',
            \'passive_filetypes': ['python']}
let g:syntastic_python_checkers = ['pylint', 'pep8']

let g:pymode_folding = 0          " It annoys
let g:pymode_rope = 0             " YouCompleteMe better for it
let g:pymode_lint_unmodified = 1  " Check unmodified saves
let g:pymode_lint_checkers = ['pylint', 'pep8']
let g:pymode_lint_sort = ['E', 'W', 'C', 'I']
let g:pymode_lint_ignore = 'E501,E731,W0142,W0212,W0401,W0614,W0703,C0111,C0301,R0201,R09'

let g:UltiSnipsExpandTrigger = '<TAB>'
let g:UltiSnipsJumpForwardTrigger = '<TAB>'
let g:UltiSnipsJumpBackwardTrigger = '<S-TAB>'

let g:airline_theme = 'lucius'
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols = {}
let g:airline_symbols.linenr = '␤ '
let g:airline_symbols.branch = '⎇ '
let g:airline_symbols.readonly = 'RO'
let g:airline_symbols.whitespace = '☢ '

" =============================================================================
" ============================= Global Settings ===============================
" =============================================================================
syntax on
set t_Co=256 " Force 256 colors
colorscheme xoria256-my

set encoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r

set viminfo='20,\"50  " read/write file .viminfo, store<=50 lines of registers
set history=50        " keep 50 lines of command line history
" Suffixes that get lower priority when doing tab completion for filenames.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,
            \.ind,.idx,.ilg,.inx,.out,.toc

set ruler                 " Show the cursor position all the time
set number                " Show line numbers
set laststatus=2          " Always show the statusline
set colorcolumn=80        " Color 80 characters in line
hi ColorColumn ctermbg=5
"set textwidth=80         " 80 characters in line
"set cursorline           " Highlight current line

set listchars=tab:▸·,trail:·,extends:$,eol:↲

set hidden      " More native buffer behavior
set showcmd     " Show (partial) command in status line.
set showmatch   " Show matching brackets.
set ignorecase  " Do case insensitive matching
set incsearch   " Incremental search
"set autowrite  " Automatically save before commands like :next and :make

set wildignore=*/.git/*,*/.svn/*
set wildignore+=*.o,*.so,*.pyc
set wildmode=longest:full
set wildmenu

set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set expandtab
set smartindent

set hlsearch    " Highlight search
set nowrapscan  " Don't wrap around EOF or BOF while searching
set suffixesadd=.pl,.pm,.yml,.yaml,.tyaml  " for `gf' (open file under cursor)

set backspace=indent,eol,start  " More powerful backspacing
set backupcopy=yes              " Keep a backup file
set backupdir=~/.vim/backup     " Backup file directory
if has("persistent_undo")
    set undofile                " Persistent undo
    set undodir=~/.vim/undo
endif

" =============================================================================
" ============================ KeyMap Settings ================================
" =============================================================================
map <F2> :YcmComplete GoToDefinition<CR>
map <F3> :YcmComplete GoToDeclaration<CR>

map <F5> :SyntasticCheck<CR>
map <F6> :SyntasticInfo<CR>
map <F7> :SyntasticReset<CR>

nmap > :lnext<CR>
nmap < :lprev<CR>

noremap <Leader>pc :pclose<CR>
noremap <Leader>lc :lclose<CR>
noremap <Leader>n :set number<CR>
noremap <Leader>nn :set nonumber<CR>
noremap <Leader>l :set list<CR>
noremap <Leader>nl :set nolist<CR>
