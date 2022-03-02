"""""""coc"""""""""
let g:coc_global_extensions = [
  \ 'coc-flutter',
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
  \ 'coc-elixir',
  \ 'coc-snippets',
  \ 'coc-tslint-plugin',
  \ 'coc-eslint',
  \ 'coc-vetur',
  \ 'coc-prisma',
  \ ]

" Navigate snippet placeholders using tab
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'


inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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

" nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> K :call CocAction('doHover')<CR>

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()
command! -nargs=0 Format :call CocAction('format')


function! ShowDocIfNoDiagnostic(timer_id)
  " if (coc#util#has_float() == 0)
    silent call CocActionAsync('doHover')
  " endif
endfunction

function! s:show_hover_doc()
  call timer_start(370, 'ShowDocIfNoDiagnostic')
endfunction

" Use tab for trigger completion with characters ahead and navigate.
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

