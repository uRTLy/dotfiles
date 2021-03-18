call plug#begin('~/.vim/plugged')
" Plug 'neoclide/coc.nvim', { 'branch': 'release'}

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" Test
Plug 'vim-test/vim-test'
Plug 'Shougo/vimproc.vim', { 'do': 'make'}
Plug 'puremourning/vimspector'
Plug 'kassio/neoterm'

" Debug Plug
Plug 'mfussenegger/nvim-dap'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'nvim-telescope/telescope-dap.nvim' 

" TS / JS 
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
Plug 'peitalin/vim-jsx-typescript'
Plug 'suy/vim-context-commentstring'
Plug 'kevinoid/vim-jsonc'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-apathy'

" File Tree 
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

" Git
Plug 'tpope/vim-fugitive'

" THEME
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'

" Searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

""""""""NERDTree"""""""""
let g:NERDTreeWinSize=67

nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> -  :NERDTreeToggle<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

""""""""fzf"""""""""
let $FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

nnoremap <silent> <c-f> :Rg<cr>
nnoremap <silent> <c-g> :GFiles<cr>
nnoremap <silent> <c-d> :Lines<cr>
nnoremap <silent> <c-a> :Files<cr>
nnoremap <silent> <c-p> :Commands<cr> 


