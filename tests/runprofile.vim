" Runs some profiling
"
" Current directory must be runtime/tests.

if 1 " Only do this with the +eval feature

set nocp
filetype indent on
syn on
set report=9999
let &runtimepath = '..,' . &runtimepath
echo "&runtimepath=>" . &runtimepath . '<'

au! SwapExists * call HandleSwapExists()
func HandleSwapExists()
  " Ignore finding a swap file for the test input and output, the user might be
  " editing them and that's OK.
  if expand('<afile>') =~ '.*\.\(in\|out\|fail\|ok\)'
    let v:swapchoice = 'e'
  endif
endfunc

echo "profiling started..."


" folding
filetype plugin indent on
syntax off
profile start testdir/resource_Profiling/profile_folding_today.txt
profile! file *krl.vim
split testdir/resource_Profiling/fahrwege_big.src
normal O; fold
normal jo; endfold
normal zx
bwipe!
profile stop


" syntax
filetype plugin indent off
syntax on
let g:krlFoldLevel=0
profile start testdir/resource_Profiling/profile_syntax_today.txt
profile! file *krl.vim
split testdir/resource_Profiling/fahrwege_big.src
normal gg
syntime on
for i in range(1, line("$"))
  normal j
  if i%10 == 0
    redraw
  endif
endfor
redir! > testdir/resource_Profiling/syntime_syntax_today.txt
set nomore
syntime report
redir END
set more<
set lines<
bwipe!
profile stop
unlet g:krlFoldLevel


" indent
filetype plugin indent on
syntax off
profile start testdir/resource_Profiling/profile_indent_today.txt
profile! file *krl.vim
split testdir/resource_Profiling/fahrwege_big.src
normal gg=G
redraw
bwipe!
profile stop


endif " Matching "if 1" at the start.

" vim:sw=2 sts=2 et fdm=marker
