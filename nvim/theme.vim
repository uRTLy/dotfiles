set background=light
set termguicolors

highlight Normal ctermfg=0 ctermbg=None
set cursorline

autocmd WinEnter,BufEnter,BufWinEnter * set cursorline

autocmd WinLeave,BufLeave,BufWinLeave * set nocursorline

highlight CursorLine cterm=None ctermbg=11

highlight VertSplit cterm=None ctermfg=8 ctermbg=None

highlight StatusLine cterm=underline ctermfg=8 ctermbg=None

highlight StatusLineNC cterm=underline ctermfg=8 ctermbg=None

highlight LineNr ctermfg=8 ctermbg=None
highlight LineNrAbove ctermfg=8 ctermbg=None
highlight LineNrBelow ctermfg=8 ctermbg=None
highlight CursorLineNr ctermfg=8 ctermbg=None
highlight FoldColumn ctermfg=8 ctermbg=None
highlight SignColumn ctermfg=8 ctermbg=None

highlight Folded cterm=bold ctermfg=2 ctermbg=None

set t_Co=256
colorscheme PaperColor 
set guifont=JetBrains\ Mono\ 13

