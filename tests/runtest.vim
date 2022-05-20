" Runs all the testdir/test_*.vim 
"
" Current directory must be runtime/tests.

if 1 " Only do this with the +eval feature

set nocp
filetype indent on
syn on
set report=9999
packadd! matchit
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

echo "tests started..."


let failed_count = 0
let v:errors = []


for i in glob('testdir/test_*.vim', 0, 1)
  echo i
  sleep 10m
  execute "source " . i
endfor


let errorfilename = 'errors.txt'
if v:errors != []
  call writefile(v:errors, errorfilename)
elseif filereadable(errorfilename)
  call delete(errorfilename)
endif


endif " Matching "if 1" at the start.

if failed_count > 0
  " have make report an error
  cquit
endif
finish
qall!

" vim:sw=2 sts=2 et fdm=marker
