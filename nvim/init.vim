" Author: Pavel 'LotharKAtt' Cizinsky
" Repository: github.com/LotharKAtt/DotFiles
" Based on github.com/fpytloun config, thanks mate
"
""Common behavior
" Theme and colors
set background=dark

" Disable stupid backup and swap files - they trigger too many events for file
" system watchers
set nobackup
set nowritebackup
set noswapfile
" automatically change window's cwd to file's dir
set autochdir

" Clipboard
set clipboard=unnamedplus

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
set relativenumber  " show relativeline numbers
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

"Core
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'

" Formatting
Plug 'Raimondi/YAIFA'
Plug 'godlygeek/tabular'
Plug 'bronson/vim-trailing-whitespace'

" Syntax
Plug 'saltstack/salt-vim'
Plug 'stephpy/vim-yaml'
Plug 'Rykka/riv.vim'
Plug 'plasticboy/vim-markdown'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'fatih/vim-go'

" Syntax and productivity
Plug 'freitass/todo.txt-vim'
Plug 'fpytloun/vim-notes'
Plug 'xolox/vim-misc'

" Git
Plug 'airblade/vim-gitgutter'

" Misc
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Theme
Plug 'NLKNguyen/papercolor-theme'

call plug#end()

colorscheme PaperColor


""" Nerd Tree
" Hotkey for Nerd Tree
map <c-e> :NERDTreeToggle<CR>
" Open Nerd Tree if no file is opened
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Allow closing Vim if only Nerd Tree is opened
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" Return to the same line when you reopen a file
if has("autocmd")
 au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

""diable arrow keys
"normal mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
"insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>


""eddit shits bellow
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
let g:airline_theme='PaperColor'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#checks = []
let g:airline_powerline_fonts = 1
