 " PLUGINS
call plug#begin('~/.vim/plugged')


" JS/TS  extensions
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'puremourning/vimspector'

Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': './install.sh'}
Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}
Plug 'elixir-editors/vim-elixir'

" Test
Plug 'puremourning/vimspector'
Plug 'Shougo/vimproc.vim', { 'do': 'make'}
Plug 'vim-test/vim-test'
Plug 'kassio/neoterm'
Plug 'mfussenegger/nvim-dap'
Plug 'theHamsta/nvim-dap-virtual-text'


Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'mxw/vim-jsx'
Plug 'kevinoid/vim-jsonc'
Plug 'suy/vim-context-commentstring'
Plug 'sillybun/vim-repl'
Plug 'dylanaraps/wal'
Plug 'jparise/vim-graphql'



Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-apathy'


""" THEME
Plug 'tomasiser/vim-code-dark'
Plug 'dunstontc/vim-vscode-theme'

"" Searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'NLKNguyen/papercolor-theme'

call plug#end()


let g:test#strategy = "neoterm"
let g:neoterm_default_mod = 'vert'
let g:neoterm_autoscroll = 1      " autoscroll to the bottom when entering insert mode
let g:neoterm_size = 80
let g:neoterm_fixedsize = 1       " fixed size. The autosizing was wonky for me
" let g:neoterm_keep_term_open = 0  
"
" let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
let g:vimspector_enable_mappings = 'HUMAN'

" let test#strategy = "make"
" let g:test#preserve_screen = 1


let mapleader = ","

let g:airline_theme = 'codedark'

" NETRW overrides
"
" let g:netrw_localrmdir='rm -r'
let g:netrw_localrmdir='mv ~/.Trash' 
" let g:netrw_localrmdir_cmd='mv PATH_TO_YOUR/Trash'

set mouse=a
set clipboard=unnamedplus
set number
set relativenumber
set cursorline
hi Search cterm=none ctermfg=grey ctermbg=blue

" quick save
noremap <S-s> :w!<cr>

inoremap <C-c> <Esc><Esc>
inoremap <C-c> <ESC>


"basic mappings
noremap k gk
noremap j gj

nnoremap E $
nnoremap B 0
nnoremap $ <nop>
nnoremap Y y$ 
nnoremap D d$

"folding
set foldmethod=syntax
set foldcolumn=1
set foldlevelstart=99
let javaScript_fold=1

nnoremap zz  

function! ToogleFold()
     if &foldlevel >= 20
         "normal! zM<CR> (folds all)
         set foldlevel=0
     else
         "normal! zR<CR> (unfolds everything)
         set foldlevel=20
     endif
 endfunction

" INDENT
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Use CTRL + hjkl in insert and command mode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>


if has("mac")
  set nocursorline

  if exists("+relativenumber")
    set norelativenumber
  endif

  set foldlevel=0
  set foldmethod=manual
endif


" move a line of text using ALT+[jk], indent with ALT+[hl]
nnoremap <M-j> :m+<CR>==
nnoremap <M-k> :m-2<CR>==
nnoremap <M-h> <<
nnoremap <M-l> >>
inoremap <M-j> <Esc>:m+<CR>==gi
inoremap <M-k> <Esc>:m-2<CR>==gi
inoremap <M-h> <Esc><<`]a
inoremap <M-l> <Esc>>>`]a
vnoremap <M-j> :m'>+<CR>gv=gv
vnoremap <M-k> :m-2<CR>gv=gv
"kMove lnes with CTRL SHIFT J/K in v/i/n modes
vnoremap <M-l> >gv
vnoremap <M-h> <gv

"Mnemonic: Copy File path
nor <leader>cf :let @*=expand("%:p")<CR>    

"Mnemonic: Yank File path
nnor <leader>yf :let @"=expand("%:p")<CR>   

"Mnemonic: yank File Name
nnor <leader>fn :let @"=expand("%")<CR>     

" TABS KILLER FEATURES
"
map <leader>tt :tabnext<CR><CR>
map <leader>tp :tabprevious<CR><CR>

" map <leader>O :let @"=expand("%")<CR>:tabnew | args <C-r>@ | vertical all | @=''<C-r>

" map <leader>O :"ay<C-r>:tabnew | args <C-r>a | vertical all | @a=''<C-r>

" map <leader><C-o> :tabnew | args %:p:h/* | vertical all


" fun! OpenDirectory()
"     call CmdLine('tabnew', 'args %:p:h/*', 'vertical all') 
" endfun



" in visual mode next selection with f 
vnoremap <silent> <C-f> :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> <C-F> :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>l

map <leader>cd :cd %:p:h<cr>:pwd<cr>

" use leader X to select all occurences and replace 
nmap <Leader>x *``cgn
nmap <Leader>X #``cgN

" visual mode maps

vnoremap '1 <esc>`>a)<esc>`<i(<esc>
vnoremap '2 <esc>`>a'<esc>`<i'<esc>
vnoremap '3 <esc>`>a}<esc>`<i{<esc>
vnoremap '4 <esc>`>a"<esc>`<i"<esc>
vnoremap '5 <esc>`>a]<esc>`<i[<esc>
vnoremap '6 <esc>`>a><esc>`<i<<esc>

" insert mode maps
inoremap '1 ()<esc>i
inoremap '2 ''<esc>i
inoremap '3 {}<esc>i
inoremap '4 ""<esc>i
inoremap '5 []<esc>i
inoremap '6 {<esc>o}<esc>o
inoremap '7 <><esc>i

inoremap jk <esc>

" Search improvements
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
noremap g* g*zz
nnoremap g# g#zz

" select all
nnoremap vA ggVG

" add new line below without entering insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "yes"
let g:session_command_aliases = 1


""""""""fzf"""""""""

let $FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

nnoremap <silent> <c-f> :Rg<cr>
nnoremap <silent> <c-g> :GFiles<cr>
nnoremap <silent> <c-d> :Lines<cr>
nnoremap <silent> <c-a> :Files<cr>
nnoremap <silent> <c-p> :Commands<cr> 

""""""""GIT FLOW (fugitive)"""""""""
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>g- :Silent Git stash<CR>:e<CR>
nnoremap <Leader>g+ :Silent Git stash pop<CR>:e<CR>

"""""""coc"""""""""

let g:coc_global_extensions = [
  \ 'coc-angular',
  \ 'coc-tailwindcss',
  \ 'coc-json',
  \ 'coc-python',
  \ 'coc-docker',
  \ 'coc-yaml',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-tsserver',
  \ 'coc-stylelint',
  \ 'coc-prettier',
  \ 'coc-highlight',
  \ 'coc-emmet',
  \ 'coc-snippets',
  \ 'coc-tslint-plugin',
  \ 'coc-eslint',
  \ 'coc-vetur'
  \ ]


" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Navigate snippet placeholders using tab
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

" Use enter to accept snippet expansion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)

" pasting
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Tabd
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


let g:NERDTreeWinSize=67

nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> -  :NERDTreeToggle<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

" nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> K :call CocAction('doHover')<CR>


function! ShowDocIfNoDiagnostic(timer_id)
  " if (coc#util#has_float() == 0)
    silent call CocActionAsync('doHover')
  " endif
endfunction

function! s:show_hover_doc()
  call timer_start(370, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

" function! s:show_documentation()
"   if &filetype == 'vim'
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction


"e <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
	  let col = col('.') - 1
	    return !col || getline('.')[col - 1]  =~ '\s'
    endfunction

inoremap <silent><expr> <tab>
          \ pumvisible() ? "\<c-n>" :
          \ <sid>check_back_space() ? "\<tab>" :
          \ coc#refresh()

    "close preview window when completion is done.
    autocmd! completedone * if pumvisible() == 0 | pclose | endif

" aus
au bufreadpost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


command! -nargs=0 Format :call CocAction('format')

" commenting 
let g:context#commentstring#table['javascript.jsx'] = {
			\ 'jsComment' : '// %s',
			\ 'jsImport' : '// %s',
			\ 'jsxStatment' : '// %s',
			\ 'jsxRegion' : '{/*%s*/}',
			\ 'jsxTag' : '{/*%s*/}',
			\}

let g:context#commentstring#table['typescript.jsx'] = {
			\ 'jsComment' : '// %s',
			\ 'jsImport' : '// %s',
			\ 'jsxStatment' : '// %s',
			\ 'jsxRegion' : '{/*%s*/}',
			\ 'jsxTag' : '{/*%s*/}',
			\}


let g:context#commentstring#table['vue'] = {
			\ 'jsComment' : '// %s',
			\ 'jsImport' : '// %s',
			\ 'jsxStatment' : '// %s',
			\ 'jsxRegion' : '{/*%s*/}',
			\ 'jsxTag' : '{/*%s*/}',
			\}


function! MakeSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  exe "mksession! " . b:filename
endfunction


function! LoadSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  let b:sessionfile = b:sessiondir . "/session.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction

" Adding automatons for when entering or leaving Vim
au VimEnter * nested :call LoadSession()
au VimLeave * :call MakeSession()

" " test
" nmap <silent> t<C-n> :TestNearest<CR>
" nmap <silent> t<C-f> :TestFile<CR>
" nmap <silent> t<C-s> :TestSuite<CR>
" nmap <silent> t<C-l> :TestLast<CR>
" nmap <silent> t<C-g> :TestVisit<CR>

" theHamsta/nvim-dap-virtual-text and mfussenegger/nvim-dap
let g:dap_virtual_text = v:true

function! RunTestVerbose()
  let g:test#javascript#jest#options = '' 
  :TestNearest -strategy=neovim 
  let g:test#javascript#jest#options = '--reporters jest-vim-reporter'
endfunction

" jank/vim-test and mfussenegger/nvim-dap
nnoremap <leader>t :TestNearest -strategy=jest<CR>
nnoremap <leader>tm :exec RunTestVerbose()<CR>

function! JestStrategy(cmd)
  let testName = matchlist(a:cmd, '\v -t ''(.*)''')[1]
  let fileName = matchlist(a:cmd, '\v'' -- (.*)$')[1]
  call luaeval("require'debugHelper'.debugJest([[" . testName . "]], [[" . fileName . "]])")
endfunction      

let g:test#custom_strategies = {'jest': function('JestStrategy')}
