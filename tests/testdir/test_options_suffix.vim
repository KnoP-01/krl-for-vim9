filetype plugin indent on
syntax on


" Make sure with the first line that the filetype is detected
call writefile(['def file()', 'one', 'file'], 'file.Src')
call writefile(['defdat file', 'one', 'file'], 'file.Dat')

" test 'suffixes'
set filetype=krl
call feedkeys(":e file\<TAB>\<CR>", 'tx')
let failed_count += assert_equal('e file.Src', expand(@:), 'Option suffixes should put .dat to the end.')

" test 'suffixesadd'
split file.Dat
normal jj0gf
let failed_count += assert_equal('file.Src', expand('%'), 'Option suffixesadd should append .Src or at least .src here.')

bwipe!
call delete('file.Src')
call delete('file.Dat')
set filetype<


filetype plugin indent off
syntax off
