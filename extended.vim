"" plugins
call plug#begin('~/.vim/plugged')

" js/ts  extensions
plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': './install.sh'}
plug 'leafgarland/typescript-vim'
plug 'peitalin/vim-jsx-typescript'
plug 'posva/vim-vue'
plug 'mxw/vim-jsx'
plug 'suy/vim-context-commentstring'
plug 'sillybun/vim-repl'

plug 'shougo/vimproc.vim', { 'do': 'make'}

plug 'tpope/vim-vinegar'
plug 'tpope/vim-fugitive'
plug 'tpope/vim-commentary'
plug 'tpope/vim-apathy'
plug 'doums/darcula'



"" theme
plug 'dunstontc/vim-vscode-theme'
plug 'tomasiser/vim-code-dark'
plug 'tomasiser/vim-code-dark'
plug 'nlknguyen/papercolor-theme'
plug 'dracula/vim', { 'as': 'dracula' }

" searching
plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
plug 'junegunn/fzf.vim'
plug 'vim-airline/vim-airline'


" sessions
plug 'xolox/vim-misc'
plug 'xolox/vim-session'

call plug#end()

let mapleader = ","

let g:airline_theme = 'codedark'

" netrw overrides
"
" let g:netrw_localrmdir='rm -r'
let g:netrw_localrmdir='mv path_to_your/trash'
let g:netrw_localrmdir_cmd='mv path_to_your/trash'


"theme
set background=light
set termguicolors

set t_co=256
colorscheme papercolor 
set guifont=menlo:h13

set mouse=a

set number
set relativenumber
set cursorline
hi search cterm=none ctermfg=grey ctermbg=blue

" quick save
noremap <s-s> :w!<cr>

"basic mappings
noremap k gk
noremap j gj

nnoremap e $
nnoremap b 0
nnoremap $ <nop>
nnoremap y y$ 
nnoremap d d$

"folding
set foldmethod=syntax
set foldcolumn=1
set foldlevelstart=99
let javascript_fold=1

nnoremap zz  

function! tooglefold()
     if &foldlevel >= 20
         "normal! zm<cr> (folds all)
         set foldlevel=0
     else
         "normal! zr<cr> (unfolds everything)
         set foldlevel=20
     endif
 endfunction

" indent
set tabstop=2
set softtabstop=2
set shiftwidth=2

" use ctrl + hjkl in insert and command mode
inoremap <c-h> <left>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>


if has("mac")
  set nocursorline

  if exists("+relativenumber")
    set norelativenumber
  endif

  set foldlevel=0
  set foldmethod=manual
endif


" move a line of text using alt+[jk], indent with alt+[hl]
nnoremap <m-j> :m+<cr>==
nnoremap <m-k> :m-2<cr>==
nnoremap <m-h> <<
nnoremap <m-l> >>
inoremap <m-j> <esc>:m+<cr>==gi
inoremap <m-k> <esc>:m-2<cr>==gi
inoremap <m-h> <esc><<`]a
inoremap <m-l> <esc>>>`]a
vnoremap <m-j> :m'>+<cr>gv=gv
vnoremap <m-k> :m-2<cr>gv=gv
vnoremap <m-h> <gv
vnoremap <m-l> >gv"kmove lines with ctrl shift j/k in v/i/n modes

"mnemonic: copy file path
nor <leader>cf :let @*=expand("%:p")<cr>    

"mnemonic: yank file path
nnor <leader>yf :let @"=expand("%:p")<cr>   

"mnemonic: yank file name
nnor <leader>fn :let @"=expand("%")<cr>     

" tabs killer features
"
map <leader>tt :tabnext<cr><cr>
map <leader>tp :tabprevious<cr><cr>

" map <leader>o :let @"=expand("%")<cr>:tabnew | args <c-r>@ | vertical all | @=''<c-r>

" map <leader>o :"ay<c-r>:tabnew | args <c-r>a | vertical all | @a=''<c-r>

" map <leader><c-o> :tabnew | args %:p:h/* | vertical all


" fun! opendirectory()
"     call cmdline('tabnew', 'args %:p:h/*', 'vertical all') 
" endfun



" in visual mode next selection with f 
vnoremap <silent> <c-f> :<c-u>call visualselection('', '')<cr>/<c-r>=@/<cr><cr>
vnoremap <silent> <c-f> :<c-u>call visualselection('', '')<cr>?<c-r>=@/<cr><cr>l

map <leader>cd :cd %:p:h<cr>:pwd<cr>

" use leader x to select all occurences and replace 
nmap <leader>x *``cgn
nmap <leader>x #``cgn

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

" search improvements
nnoremap n nzz
nnoremap n nzz
nnoremap * *zz
nnoremap # #zz
noremap g* g*zz
nnoremap g# g#zz

" select all
nnoremap va ggvg

" add new line below without entering insert mode
nmap <s-enter> o<esc>
nmap <cr> o<esc>

" plugins settings

" """"""sessions"""""""""
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'
let g:session_autosave_to = 'default'
let g:session_autosave_periodic = 1 
let g:session_default_to_last = 1
let g:session_verbose_messages = 0
:let g:session_persist_colors = 0
let g:session_default_to_last = 1
set sessionoptions-=options


""""""""fzf"""""""""
let $fzf_default_command = 'rg --files --hidden'

nnoremap <silent> <c-f> :rg<cr>
nnoremap <silent> <c-g> :gfiles<cr>
nnoremap <silent> <c-d> :lines<cr>
nnoremap <silent> <c-a> :files<cr>
nnoremap <silent> <c-p> :commands<cr> 



""""""""git flow (fugitive)"""""""""
nnoremap <leader>gs :gstatus<cr>
nnoremap <leader>gd :gdiff<cr>
nnoremap <leader>gb :gblame<cr>
nnoremap <leader>gr :gread<cr>
nnoremap <leader>gw :gwrite<cr>
nnoremap <leader>gp :git push<cr>
nnoremap <leader>g- :silent git stash<cr>:e<cr>
nnoremap <leader>g+ :silent git stash pop<cr>:e<cr>

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
  \ 'coc-eslint',
  \ 'coc-vetur'
  \ ]

inoremap <silent><expr> <tab>
      \ pumvisible() ? "\<c-n>" :
      \ <sid>check_back_space() ? "\<tab>" :
      \ coc#refresh()
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<c-h>"

" use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" use <cr> for confirm completion, `<c-g>u` means break undo chain at current position.
" coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"

" use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <plug>(coc-diagnostic-prev)
nmap <silent> ]c <plug>(coc-diagnostic-next)

" remap keys for gotos
nmap <silent> gd <plug>(coc-definition)
nmap <silent> gy <plug>(coc-type-definition)
nmap <silent> gi <plug>(coc-implementation)
nmap <silent> gr <plug>(coc-references)

" pasting
noremap <leader>y "*y
noremap <leader>p "*p
noremap <leader>y "+y
noremap <leader>p "+p


nnoremap <silent> k :call <sid>show_documentation()<cr>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call cocaction('dohover')
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
function! setupcommandabbrs(from, to)
      exec 'cnoreabbrev <expr> '.a:from
              \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
              \ .'? ("'.a:to.'") : ("'.a:from.'"))'
  endfunction

" filetypes 
autocmd bufreadpost,bufnewfile *.vue setlocal filetype=vue
autocmd bufread,bufnewfile *.{jsx} setlocal filetype=javascript.jsx
autocmd bufread,bufnewfile *.{tsx} setlocal filetype=typescript.jsx

" autocmd filetype html setlocal foldmethod=indent
" autocmd filetype html setlocal fdl=3


" commenting 
let g:context#commentstring#table['javascript.jsx'] = {
			\ 'jscomment' : '// %s',
			\ 'jsimport' : '// %s',
			\ 'jsxstatment' : '// %s',
			\ 'jsxregion' : '{/*%s*/}',
			\ 'jsxtag' : '{/*%s*/}',
			\}

let g:context#commentstring#table['typescript.jsx'] = {
			\ 'jscomment' : '// %s',
			\ 'jsimport' : '// %s',
			\ 'jsxstatment' : '// %s',
			\ 'jsxregion' : '{/*%s*/}',
			\ 'jsxtag' : '{/*%s*/}',
			\}


let g:context#commentstring#table['vue'] = {
			\ 'jscomment' : '// %s',
			\ 'jsimport' : '// %s',
			\ 'jsxstatment' : '// %s',
			\ 'jsxregion' : '{/*%s*/}',
			\ 'jsxtag' : '{/*%s*/}',
			\}

