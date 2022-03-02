luafile ~/dotfiles/nvim/lua/debug-helper.lua

let g:dap_virtual_text = v:true

nnoremap <leader>d_ :lua require'dap'.run_last()<CR>
nnoremap <leader>dr :lua require'dap'.repl.open({}, 'vsplit')<CR><C-w>l
nnoremap <leader>d? :lua require'dap.ui.variables'.scopes()<CR>
nnoremap <leader>de :lua require'dap'.set_exception_breakpoints({"all"})<CR>


nnoremap <F3> :lua require("dapui").toggle()<CR>
nnoremap <F4> :lua require'jester'.debug()<CR>

nnoremap <F6> :lua require'dap.ui.widgets'.centered_float(require'dap.ui.widgets'.scopes)<CR>

nnoremap <leader>b :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <F5> :lua require'dap'.continue()<CR>
nnoremap <F10> :lua require'dap'.step_over()<CR>
nnoremap <F11> :lua require'dap'.step_into()<CR>
nnoremap <F12> :lua require'dap'.step_out()<CR>

" nnoremap <F4> :TestNearest -strategy=jest<CR>
" nnoremap <F6> :lua require'debugHelper'.debugJest()<CR>
" nnoremap <F7> :lua require'debugHelper'.debugNX()<CR>
" nnoremap <F6><CR>
