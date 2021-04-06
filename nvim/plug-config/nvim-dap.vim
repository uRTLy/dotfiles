luafile ~/dotfiles/nvim/lua/debugHelper.lua


nnoremap <leader>b :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <S-k> :lua require'dap'.step_out()<CR>
nnoremap <S-l> :lua require'dap'.step_into()<CR>
nnoremap <S-j> :lua require'dap'.step_over()<CR>
nnoremap <leader>dn :lua require'dap'.continue()<CR>
nnoremap <leader>d_ :lua require'dap'.run_last()<CR>
nnoremap <leader>dr :lua require'dap'.repl.open({}, 'vsplit')<CR><C-w>l
nnoremap <leader>di :lua require'dap.ui.variables'.hover(function () return vim.fn.expand("<cexpr>") end)<CR>
vnoremap <leader>di :lua require'dap.ui.variables'.visual_hover()<CR>
nnoremap <leader>d? :lua require'dap.ui.variables'.scopes()<CR>
nnoremap <leader>de :lua require'dap'.set_exception_breakpoints({"all"})<CR>


nnoremap <F4> :TestNearest -strategy=jest<CR>
nnoremap <F5> :lua require'debugHelper'.debugNodeApp()<CR>
nnoremap <F6> :lua require'debugHelper'.debugJest()<CR>
nnoremap <F7> :lua require'debugHelper'.debugNX()<CR>
" nnoremap <F6><CR>

let g:dap_virtual_text = v:true

function! JestStrategy(cmd)
  let testName = matchlist(a:cmd, '\v -t ''(.*)''')[1]
  let fileName = matchlist(a:cmd, '\v'' -- (.*)$')[1]
  call luaeval("require'debugHelper'.debugJest([[" . testName . "]], [[" . fileName . "]])")
endfunction      


let g:test#custom_strategies = {'jest': function('JestStrategy')}
