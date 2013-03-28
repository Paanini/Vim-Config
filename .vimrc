colorscheme jellybeans
filetype off

"Load all plugins installed via Pathogen
execute pathogen#infect()
execute pathogen#helptags()

"Recognize the filetype based on extension/file contents, load appropriate
"plugins and indent methods
filetype plugin indent on

"Syntax Highlighting
syntax on

"Enable Line Numbers
set number

"Automatically follow the current indentation level on <CR>
set autoindent

"Modify backspace behaviour        
set backspace=indent,eol,start

"Search without pressing <CR>
set incsearch

"Highlight matching braces
set showmatch

"Set Vim to fold according to hte indent level (Python specific)
set foldmethod=indent
"set foldnestmax=5
set foldlevel=99
set ignorecase
set hlsearch

"***********Key Mappings****************

"Map the default leader key (\) to ,
let mapleader = ','

"Navigating in Split Windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"Toggle Line Numbers with F2
nmap <F2> :set number!<CR>

"*********Python-Mode*****************
"Following are Python-mode settings
let g:pymode_run_key = '<F5>'

"Disable Python-Mode's default Syntax Highlighting
let g:pymode_syntax = 0
let g:pymode_lint_checker = "pyflakes,mccabe"
let g:pymode_rope = 0
"**********Vim-Powerline**************
let g:Powerline_symbols = 'fancy'
let laststatus=2
set t_Co=256

"*********NERDtree plugin*************
"autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <leader>n :NERDTreeToggle<CR>

"*********SuperTab*******************
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabClosePreviewOnPopupClose = 1

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
