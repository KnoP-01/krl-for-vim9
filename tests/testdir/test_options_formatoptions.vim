filetype plugin indent on
syntax on


" test 'formatoptions'+=ro
" Make sure with the first line that the filetype is detected
call writefile(['def file()', '; a comment'], 'file.src')
split file.src
execute "normal jA" . expand("\<CR>")
let failed_count += assert_equal(';', getline('.'), 'Comment must have been continued after i_<CR>.')
normal O
let failed_count += assert_equal(';', getline('.'), 'Comment must have been continued after O.')
normal o
let failed_count += assert_equal(';', getline('.'), 'Comment must have been continued after o.')
bwipe!
call delete('file.src')


let g:krlAutoComment=0
call writefile(['def file()', '; a comment'], 'file.src')
split file.src
call setline(1, &fo)
execute "normal jA" . expand("\<CR>")
let failed_count += assert_equal('', getline('.'), 'Comment must not have been continued after i_<CR>.')
normal k
normal O
let failed_count += assert_equal('', getline('.'), 'Comment must not have been continued after O.')
normal j
normal o
let failed_count += assert_equal('', getline('.'), 'Comment must not have been continued after o.')
bwipe!
call delete('file.src')
unlet g:krlAutoComment


filetype plugin indent off
syntax off
