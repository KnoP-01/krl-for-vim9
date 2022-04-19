filetype plugin indent on
syntax on


" test 'iskeyword'
" Make sure with the first line that the filetype is detected
call writefile(['&ACCESS RVO', 'def file()', '$SYSVAR = #ENUM'], 'file.src')
split file.src
normal diw
let failed_count += assert_equal(' RVO', getline('1'), '&ACCESS must have been deleted by diw.')
normal jj0diw
let failed_count += assert_equal(' = #ENUM', getline('3'), '$SYSVAR must have been deleted by diw.')
normal $diw
let failed_count += assert_equal(' = ', getline('3'), '#ENUM must have been deleted by diw.')
bwipe!
call delete('file.src')


let g:krlKeyWord=0
call writefile(['&ACCESS RVO', 'def file()', '$SYSVAR = #ENUM'], 'file.src')
split file.src
normal diw
let failed_count += assert_equal('ACCESS RVO', getline('1'), 'Only & must have been deleted by diw.')
normal jj0diw
let failed_count += assert_equal('SYSVAR = #ENUM', getline('3'), 'Only $ must have been deleted by diw.')
normal $diw
let failed_count += assert_equal('SYSVAR = #', getline('3'), 'ENUM must have been deleted by diw.')
bwipe!
call delete('file.src')
unlet g:krlKeyWord


filetype plugin indent off
syntax off
