

"" PLUGINS
call plug#begin('~/.vim/plugged')


" JS/TS  extensions
Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': './install.sh'}
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'posva/vim-vue'
Plug 'mxw/vim-jsx'
Plug 'suy/vim-context-commentstring'
Plug 'sillybun/vim-repl'
Plug 'Shougo/vimproc.vim', { 'do': 'make'}

Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-apathy'

"" THEME
Plug 'tomasiser/vim-code-dark'

" Searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'

" Sessions
Plug 'xolox/vim-misc'

Plug 'xolox/vim-session'

call plug#end()

let mapleader = ","

" let g:coc_node_path = '~/.nvm/
"THEME
set background=dark
set notermguicolors
colorscheme codedark

set number
set relativenumber
set cursorline
hi Search cterm=none ctermfg=grey ctermbg=blue

" quick save
noremap <S-s> :w!<cr>

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
vnoremap <M-h> <gv
vnoremap <M-l> >gv"kMove lines with CTRL SHIFT J/K in v/i/n modes

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

" plugins settings

" """"""sessions"""""""""
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'
let g:session_autosave_to = 'default'
let g:session_verbose_messages = 0
let g:session_default_to_last = 1
set sessionoptions-=options

""""""""fzf"""""""""
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

nnoremap <silent> <c-f> :Rg<cr>
nnoremap <silent> <c-g> :GFiles<cr>
nnoremap <silent> <c-d> :Lines<cr>
nnoremap <silent> <c-a> :Files<cr>


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
  \ 'coc-json',
  \ 'coc-python',
  \ 'coc-docker',
  \ 'coc-yaml',
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
  \ 'coc-eslint'
  \ ]

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" pasting
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p


nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


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


" expand on enter
function! SetupCommandAbbrs(from, to)
      exec 'cnoreabbrev <expr> '.a:from
              \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
              \ .'? ("'.a:to.'") : ("'.a:from.'"))'
  endfunction

" VUE 
 autocmd BufReadPost,BufNewFile *.vue setlocal filetype=vue


autocmd BufRead,BufNewFile *.{jsx} setlocal filetype=javascript.jsx
autocmd BufRead,BufNewFile *.{tsx} setlocal filetype=typescript.jsx


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
