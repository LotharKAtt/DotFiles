"""Common behavior
" Theme and colors
let base16colorspace=256
set background=dark

" Disable stupid backup and swap files - they trigger too many events for file
" system watchers
set nobackup
set nowritebackup
set noswapfile
" automatically change window's cwd to file's dir
set autochdir

" Clipboard
set clipboard+=unnamedplus

" Use <leader>l to toggle display of whitespace
nmap <leader>l :set list!<CR>

" provide hjkl movements in Insert mode via the <Alt> modifier key
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l
inoremap <A-e> <C-o>e
inoremap <A-b> <C-o>b

""" Searching
" Make search case insensitive
set incsearch		" do incremental searching
set hlsearch
set ignorecase
set smartcase

""" Tabs and spaces
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set shiftround

set modeline
set modelines=5

""" Line numbers and width
set number  " show line numbers, goggle with \n
nnoremap <Leader>n :set number!<CR>
set tw=78   " width of document (used by gd)
"set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
"set colorcolumn=80		" highlight 80 column
"highlight ColorColumn ctermbg=233

" Show cursor line, toggle with \c
" Cursor line is slow, don't enable it by default
set cursorline
nnoremap <Leader>c :set cursorline!<CR>

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

""" Splits configuration
" Navigate thru splits
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" More natural creation of splits
set splitbelow
set splitright

""" Folding
set nofoldenable
nnoremap <space> za
vnoremap <space> zf

""" Filetypes
" Don't automatically fold python files
autocmd FileType python set nofoldenable
autocmd FileType python map <buffer> <F5> :PymodeLint<CR>
autocmd FileType python map <buffer> <F6> :PymodeLintAuto<CR>

" Two-spaces for Yaml files
autocmd FileType yaml set shiftwidth=2
autocmd FileType yaml set softtabstop=2
autocmd FileType yaml set tabstop=2

" Syntax for various file types
autocmd BufRead,BufNewFile *.avdl set filetype=avro-idl
autocmd BufNewFile,BufRead *.upstart set filetype=upstart
autocmd BufNewFile,BufRead *.make set filetype=make
autocmd BufNewFile,BufRead *.dockerfile set filetype=dockerfile
autocmd BufNewFile,BufRead *.muttrc set filetype=muttrc
autocmd BufNewFile,BufRead *.env set filetype=yaml
autocmd BufNewFile,BufRead *.hot set filetype=yaml
autocmd BufNewFile,BufRead *.env.example set filetype=yaml

""" --- PLUGINS ---

call plug#begin('~/.config/nvim/plugins')

" Essentials
Plug 'scrooloose/nerdtree'
Plug 'sjl/gundo.vim'

" Formatting
Plug 'Raimondi/YAIFA'
Plug 'godlygeek/tabular'
Plug 'bronson/vim-trailing-whitespace'

" Syntax
Plug 'saltstack/salt-vim'
Plug 'rodjek/vim-puppet'
Plug 'kchmck/vim-coffee-script'
Plug 'stephpy/vim-yaml'
Plug 'Rykka/riv.vim'
Plug 'plasticboy/vim-markdown'
Plug 'Glench/Vim-Jinja2-Syntax'

" Syntax and productivity
Plug 'freitass/todo.txt-vim'
"Plug 'xolox/vim-notes'
Plug 'fpytloun/vim-notes'
Plug 'xolox/vim-misc'

" IDE
Plug 'klen/python-mode'

" Misc
Plug 'airblade/vim-gitgutter'
Plug 'jamessan/vim-gnupg'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Theme
Plug 'michalbachowski/vim-wombat256mod'

call plug#end()

colorscheme wombat256mod

""" Nerd Tree
" Hotkey for Nerd Tree
map <c-e> :NERDTreeToggle<CR>
" Open Nerd Tree if no file is opened
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Allow closing Vim if only Nerd Tree is opened
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

""" Git Gutter
" let g:gitgutter_sign_added = '++'
let g:gitgutter_sign_modified = 'M'
" let g:gitgutter_sign_removed = '--'
let g:gitgutter_sign_modified_removed = 'M-'
highlight SignColumn ctermbg=none
highlight GitGutterAdd ctermfg=darkgreen
highlight GitGutterChange ctermfg=darkyellow
highlight GitGutterDelete ctermfg=darkred

""" python-mode
"let g:pymode = 0
" No max line length
"let g:pymode_options_max_line_length = 0
let g:pymode_options_colorcolumn = 0

" Automatic virtualenv selection
let g:pymode_virtualenv = 1

" Syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Check code, disable with \l
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_on_fly = 0
" Show message on current line
let g:pymode_lint_message = 1
" Don't show list of errors by default
let g:pymode_lint_cwindow = 0

let g:pymode_lint_ignore = "C901,E501,W391,E266,E128"

" Disable rope that is not compatible with jedi-vim
"let g:pymode_rope = 0

" Python autocompletion with rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
"
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_completion_bind = '<C-r>'

" Disable annoying doc window when autocompleting
let g:pymode_doc = 0
set completeopt=menu

" Try to fix slow rope
let g:pymode_rope_lookup_project = 0

""" Gundo
nnoremap <C-u> :GundoToggle<CR>
let g:gundo_right = 1
let g:gundo_preview_bottom = 1
let g:gundo_width = 35

""" Riv
let g:riv_fold_level = -1
let g:riv_fold_auto_update = 0
let g:riv_ignored_imaps = "<Del>"

""" todo.txt
autocmd BufNewFile,BufRead *_[Tt]odo.txt set filetype=todo
autocmd BufNewFile,BufRead [Tt]odo_*.txt set filetype=todo
autocmd BufNewFile,BufRead TODO.txt set filetype=todo

""" trailing-whitespace
let g:extra_whitespace_ignored_filetypes = ['mail']

""" Airline
let g:airline_theme = 'distinguished'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#checks = []
"let g:airline_powerline_fonts = 1

if !exists('g:airline_powerline_fonts')
    " Use the default set of separators with a few customizations
    let g:airline_left_sep='›'  " Slightly fancier than '>'
    let g:airline_right_sep='‹' " Slightly fancier than '<'
endif

