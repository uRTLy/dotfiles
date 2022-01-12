call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', { 'branch': 'release'}

" " LSP
" Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/nvim-compe'
" Plug 'hrsh7th/vim-vsnip'
" Plug 'hrsh7th/vim-vsnip-integ'

" CRYPTO
Plug 'tomlion/vim-solidity'

" Test
Plug 'vim-test/vim-test'
Plug 'Shougo/vimproc.vim', { 'do': 'make'}
Plug 'kassio/neoterm'

" Debug Plug
Plug 'puremourning/vimspector'
" Plug 'mfussenegger/nvim-dap'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'theHamsta/nvim-dap-virtual-text'
" Plug 'nvim-telescope/telescope-dap.nvim' 

" TS / JS 
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
Plug 'peitalin/vim-jsx-typescript'
Plug 'suy/vim-context-commentstring'
Plug 'kevinoid/vim-jsonc'


" elixir
Plug 'elixir-editors/vim-elixir'

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
" Plug 'nvim-telescope/telescope.nvim'

" Tabs
Plug 'christoomey/vim-tmux-navigator'
" Plug ""


call plug#end()

""""""""NERDTree"""""""""
let g:NERDTreeWinSize=67
let g:NERDTreeMapJumpNextSibling = '<Nop>'
let g:NERDTreeMapJumpPrevSibling = '<Nop>'

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

""""""""VIM-TEST"""""""""
" let test#strategy = "neovim"
" let test#neovim#term_position = "vertical"

""""""""TMUX"""""""""
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

"""""""""TELESCOPE"""""""""
":lua require('telescope').setup()
":lua require('telescope').load_extension('dap')

