" Set utf8 as standard encoding and en_US as the standard language
let $LANG='en' 
set encoding=utf8
set ffs=unix,dos,mac

set autoread
set history=500
set langmenu=en
set so=7
set ruler
set cmdheight=1
set hid

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line

set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set mouse=a
set clipboard=unnamedplus
set number
set relativenumber
set cursorline

" Search
hi Search cterm=none ctermfg=grey ctermbg=blue
set ignorecase
set smartcase
set hlsearch
set incsearch 

set lazyredraw 
set magic
set showmatch 
set mat=2

" Looks 
set foldcolumn=1
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" Menu
set wildmenu
set wildignore=*.o,*~,*.pyc

" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Linebreak on 500 characters
set lbr
set tw=500
set wrap "Wrap lines

" Colors
syntax enable 

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif


" Enable filetype plugins
filetype plugin on
filetype indent on

au FocusGained,BufEnter * checktime
" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

