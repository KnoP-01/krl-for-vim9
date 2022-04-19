filetype plugin indent on
syntax on


" test 'commentstring'
" Make sure with the first line that the filetype is detected
call writefile(['def file()', 'one', 'another'], 'file.src')
split file.src
setlocal foldmethod=marker
" j to put cursor on line ; one comment
normal jVjzf
let failed_count += assert_equal('one;{{{', getline(2), 'Fold start after comment expected here')
let failed_count += assert_equal('another;}}}', getline(3), 'Fold end after comment expected here')
bwipe!
call delete('file.src')


" test 'comments'
call writefile(['def file()', '; one comment', '; another comment'], 'file.src')
split file.src
normal jJ
let failed_count += assert_equal('; one comment another comment', getline('.'), 'Join lines must deletes comment leader!')
bwipe!
call delete('file.src')


filetype plugin indent off
syntax off
