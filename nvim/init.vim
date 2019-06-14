" _             _    _                   _   __  ___   _    _
"| |           | |  | |                 | | / / / _ \ | |  | |
"| |      ___  | |_ | |__    __ _  _ __ | |/ / / /_\ \| |_ | |_
"| |     / _ \ | __|| '_ \  / _` || '__||    \ |  _  || __|| __|
"| |____| (_) || |_ | | | || (_| || |   | |\  \| | | || |_ | |_
"\_____/ \___/  \__||_| |_| \__,_||_|   \_| \_/\_| |_/ \__| \__|
"
" Author: Pavel 'LotharKAtt' Cizinsky
" Repository: github.com/LotharKAtt/DotFiles
" Based on github.com/fpytloun config, thanks mate
"
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
set fo-=t   " don't automatically wrap text when typing

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

" Two-spaces for Yaml files
autocmd FileType yaml set shiftwidth=2
autocmd FileType yaml set softtabstop=2
autocmd FileType yaml set tabstop=2

" Syntax for various file types
autocmd BufNewFile,BufRead *.upstart set filetype=upstart
autocmd BufNewFile,BufRead *.make set filetype=make
autocmd BufNewFile,BufRead *.dockerfile set filetype=dockerfile
autocmd BufNewFile,BufRead *.env set filetype=yaml
autocmd BufNewFile,BufRead *.hot set filetype=yaml
autocmd BufNewFile,BufRead *.env.example set filetype=yaml

""" Plugins
call plug#begin('~/.config/nvim/plugins')

" Core
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/SearchComplete'
Plug 'tpope/vim-surround'
Plug 'will133/vim-dirdiff'

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
Plug 'luochen1990/rainbow'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'hashivim/vim-terraform'

" Git
Plug 'airblade/vim-gitgutter'

" Go
Plug 'fatih/vim-go'

" IDE
Plug 'scrooloose/nerdcommenter'

" Misc
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Theme
Plug 'mhartington/oceanic-next'

call plug#end()

set t_Co=256
syntax on
colorscheme OceanicNext

" Disable tilde on end of files
hi EndOfBuffer ctermfg=bg

""" Nerd Tree
" Hotkey for Nerd Tree
map <c-e> :NERDTreeToggle<CR>

" Return to the same line when you reopen a file
if has("autocmd")
 au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

""" Hard Mode (diable arrow keys)
" normal mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

""" Airline
let g:airline_theme = 'distinguished'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#checks = []

""" Rainbow
let g:rainbow_active = 1

""" Terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1
