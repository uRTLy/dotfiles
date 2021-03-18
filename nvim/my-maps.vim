"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>
map <leader>cd :cd %:p:h<cr>:pwd<cr>

noremap <leader>p "+gP<CR>

" use leader X to select all occurences and replace 
nmap <leader>x *``cgn
nmap <leader>X #``cgN

"Mnemonic: Copy File path
nor <leader>cf :let @*=expand("%:p")<CR>    
"Mnemonic: Yank File path
nnor <leader>yf :let @"=expand("%:p")<CR>   
"Mnemonic: yank File Name
nnor <leader>fn :let @"=expand("%")<CR>

" pasting
noremap <leader>y "*y
noremap <leader>p "*p
noremap <leader>Y "+y
noremap <leader>P "+p

"" Split
noremap <leader>h :<C-u>split<CR>
noremap <leader>v :<C-u>vsplit<CR>

"basic mappings
noremap k gk
noremap j gj
nnoremap E $
nnoremap B 0
nnoremap $ <nop>
nnoremap Y y$ 
nnoremap D d$

" quick save
noremap <C-s> :w!<cr>
inoremap <C-c> <Esc><Esc>
inoremap <C-c> <ESC>

" Use CTRL + hjkl in insert and command mode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

" visual mode maps
vnoremap '1 <esc>`>a)<esc>`<i(<esc>
vnoremap '2 <esc>`>a'<esc>`<i'<esc>
vnoremap '3 <esc>`>a}<esc>`<i{<esc>
vnoremap '4 <esc>`>a"<esc>`<i"<esc>
vnoremap '5 <esc>`>a]<esc>`<i[<esc>
vnoremap '6 <esc>`>a><esc>`<i<<esc>
vnoremap <silent> <C-f> :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> <C-F> :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>l

" insert mode maps
inoremap '1 ()<esc>i
inoremap '2 ''<esc>i
inoremap '3 {}<esc>i
inoremap '4 ""<esc>i
inoremap '5 []<esc>i
inoremap '6 {<esc>o}<esc>o
inoremap '7 <><esc>i

" select all
nnoremap vA ggVG
nnoremap zz  
inoremap jk <esc>

" Search improvements
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
noremap g* g*zz
nnoremap g# g#zz

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

"Move lnes with CTRL SHIFT J/K in v/i/n modes
vnoremap <M-l> >gv
vnoremap <M-h> <gv

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap XX "+x<CR>

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Tabd
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

