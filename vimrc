set nocompatible

"Add Vundle to the run time path
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'shirk/vim-gas'
Plugin 'tpope/vim-fugitive'
call vundle#end()

"Enable Syntax highlighting
syntax on

filetype plugin indent on

"Highlight the current line
set cursorline

"Enable line numbers
set number 

"make tab insert spaces instead of tabs at the beginning of a line
set expandtab

"Prevent the creation of .swp files
set noswapfile

"Set a line for 80 coloumns
set colorcolumn=80

"size of a hard tabstop
set tabstop=4

"size of an indent"
set shiftwidth=4

"Statusbar
set laststatus=2
set noshowmode
set noshowcmd
set encoding=utf-8
scriptencoding utf-8

"Show line and coloumn number
set ruler

"Automatically follow the current indentation level on <CR>
set autoindent

"Modify backspace behaviour        
set backspace=indent,eol,start

"Search without pressing <CR>
set incsearch

"Highlight matching braces
set showmatch

"SmartCase makes Vim searches case sensitive ONLY if the search string
"contains an Uppercase character
set smartcase
set ignorecase

"Highlight search matches
set hlsearch

"Autoload CSCOPE.OUT databases recursively
function! LoadCscope()
    let db = findfile("cscope.out", ".;")
    if (!empty(db))
        let path = strpart(db, 0, match(db, "/cscope.out$"))
	set nocscopeverbose " suppress 'duplicate connection' error
	exe "cs add " . db . " " . path
	set cscopeverbose
    endif
endfunction
au BufEnter /* call LoadCscope()

"Use CTags - first look in the pwd, then keep looking up till a tags is found
set tags=./tags,tags;

"Map the default leader key (\) to ,
let mapleader = ','

"Navigating in Split Windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"SToggle where split windows are opened
set splitbelow
set splitright

"Enable mouse support
set mouse=a

"Keymapping for Taglist plugin
"nnoremap <silent> <leader>m :TlistToggle<CR>
"let Tlist_Exit_OnlyWindow = 1
"let Tlist_GainFocus_On_ToggleOpen = 1
"let Tlist_Use_SingleClick = 1
"let Tlist_WinWidth = 40
"
"
"" YouCompleteMe Mappings
"let g:ycm_collect_identifiers_from_tags_files = 1
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_complete_in_comments = 1
"let g:ycm_seed_identifiers_with_syntax = 1
"let g:ycm_auto_start_csharp_server = 0
"let g:ycm_show_diagnostics_ui = 0
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'  
"let g:ycm_filetype_whitelist = { 'python': 1, 'c': 1, 'java': 1, 'javascript': 1 }
"set t_Co=256

"Ctrl-P Mappings
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.dep,*.o
let g:ctrlp_extensions = ['tag', 'buffertag']
nnoremap <silent> <c-o> :CtrlPTag <cr>

"let g:load_doxygen_syntax=1
let g:doxygen_my_rendering=1
"let c_cpp_comments = 0

"**********************************************************************
"uComplete settings
set completeopt+=menuone
set shortmess+=c
" For automatic completion, you most likely want one of:
set completeopt+=noinsert " or
"set completeopt+=noinsert,noselect

"Disable automatic completion by default
"let g:mucomplete#enable_auto_at_startup = 1

"Close the preview window after completion
autocmd CompleteDone * pclose
"**********************************************************************

"Lightline configuration
let g:lightline = {
      \ 'colorscheme': 'seoul256',
	  \ 'active': {
 	  \   'left': [ [ 'mode', 'paste' ],
  	  \             [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ ['lineinfo'], ['percent', 'fugitive'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
	  \ },
      \ 'component': {
      \       'readonly': '%{&filetype=="help"?"":&readonly?"\ue0a2":""}',
      \       'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \              },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \  },
	  \ 'component_visible_condition': {
	  \   'readonly': '(&filetype!="help"&& &readonly)',
	  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
	  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
	  \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }


function! LightlineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? "\ue0a0 ".branch : ''
  endif
  return ''
endfunction

"**********************************************************************

colorscheme Tomorrow-Night

nnoremap <S-h> :call ToggleHiddenAll()<CR>

