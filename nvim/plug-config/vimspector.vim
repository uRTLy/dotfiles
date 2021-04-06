" janko/vim-test and puremourning/vimspector
"
nnoremap <silent> tt :TestNearest<CR>
nnoremap <silent> ts :TestSuite<CR>
nnoremap <silent> t_ :TestLast<CR>
nnoremap <leader>df :TestFile --strategy=jest<CR>
nnoremap <leader>dd :TestNearest -strategy=jest<CR>

let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_sidebar_width = 10
" let g:vimspector_sidebar_width = 20 
" let g:vimspector_code_minwidth = 85
" let test#preserve_screen = 1 
" let g:vimspector_code_width = 25
" let test#strategy = "neovim"
" let test#neovim#term_position = "vert botleft"
" Set the basic sizes
" let g:vimspector_terminal_minwidth = 75
" let test#neovim#term_position = "botleft 30"
" let test#neovim#term_position = "topleft"
" let test#neovim#term_position = "vert"

" puremourning/vimspector
 fun! GotoWindow(id)
   :call win_gotoid(a:id)
 endfun

 func! AddToWatch()
   let word = expand("<cexpr>")
   call vimspector#AddWatch(word)
 endfunction

let g:vimspector_base_dir = expand('$HOME/.config/vimspector-config')

nnoremap <leader>dx :call vimspector#Reset()<CR>
nmap <S-i> <Plug>VimspectorBalloonEval
xmap <S-i> <Plug>VimspectorBalloonEval

sign define vimspectorBP text=🟥         texthl=WarningMsg
sign define vimspectorBPCond text=o?     texthl=WarningMsg
sign define vimspectorBPDisabled text=o! texthl=LineNr
sign define vimspectorPC text=🟢         texthl=MatchParen
sign define vimspectorPCBP text=🟢       texthl=MatchParen


 let g:vimspector_sign_priority = {
   \    'vimspectorBP':         998,
   \    'vimspectorBPCond':     997,
   \    'vimspectorBPDisabled': 996,
   \    'vimspectorPC':         999,
   \ }


function! JestStrategy(cmd)
  let testName = matchlist(a:cmd, '\v -t ''(.*)''')[1]
  call vimspector#LaunchWithSettings( #{ configuration: 'jest', TestName: testName } )
endfunction      

let g:test#custom_strategies = {'jest': function('JestStrategy')}

function! s:CustomiseUI()
  let wins = g:vimspector_session_windows

  " Close the Variables window
  if has( 'nvim' )
    " No win_execute in neovim
    call win_gotoid( wins.stack_trace )
    quit
    call win_gotoid( wins.watches )
    quit
    call win_gotoid( wins.output )
    quit
  else
    " call win_execute( wins.variables, 'q' )
    call win_execute( wins.stack_trace, 'q' )
    call win_execute( wins.watches, 'q' )
    call win_execute( wins.output, 'q' )
  endif

  " Put the variables at the top of the "left bar" (rotate)
  call win_gotoid( wins.variables )
  " Make the left column at least 37 chars
  10wincmd _
  wincmd K 

  " Make the code window at least 80 chars
  call win_gotoid( wins.code )
  80wincmd _
  wincmd L 

  " " Make the output window 10 lines high and right at the top of the screen
endfunction

function s:SetUpTerminal()
  " if !has_key( g:vimspector_session_windows, 'terminal' )
  "   " There's a neovim bug which means that this doesn't work in neovim
  "   return
  " endif
   " let terminal_win = g:vimspector_session_windows.terminal

  " " Make the terminal window at most 80 columns wide, ensuring there is enough
  " " sapce for our code window (80 columns) and the left bar (70 columns)

  " " Padding is 2 for the 2 vertical split markers and 2 for the sign column in
  " " the code window.
  set norelativenumber nonumber
  let left_bar = 37
  let code = 80
  let padding = 4
  let cols = max( [ min( [ &columns - left_bar - code - padding, 80 ] ), 10 ] )
   call win_gotoid( terminal_win )
   execute cols . 'wincmd _'
   wincmd K
  
endfunction

" function! s:CustomiseUI()
"   " Customise the basic UI...

"   " Close the output window
"   call win_gotoid( g:vimspector_session_windows.output )
"   q
"   call win_gotoid( g:vimspector_session_windows.stack_trace) 
"   q
"   call win_gotoid( g:vimspector_session_windows.watches) 
"   q
"   call win_gotoid( g:vimspector_session_windows.variables) 

"   " call win_gotoid( g:vimspector_session_windows.code )
" endfunction

" function s:SetUpTerminal()
"   " Customise the terminal window size/position
"   " For some reasons terminal buffers in Neovim have line numbers
" endfunction

augroup MyVimspectorUICustomistaion
  autocmd!
  autocmd User VimspectorUICreated call s:CustomiseUI()
  " autocmd User VimspectorTerminalOpened call s:SetUpTerminal()
augroup END
