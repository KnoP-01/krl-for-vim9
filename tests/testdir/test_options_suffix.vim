filetype plugin indent on
syntax on


" Make sure with the first line that the filetype is detected
call writefile(['def file()', 'one', 'file'], 'file.Src')
call writefile(['defdat file', 'one', 'file'], 'file.Dat')

" test 'suffixes'
set filetype=krl
call feedkeys(":e file\<TAB>\<CR>", 'tx')
let failed_count += assert_equal(expand(@:), 'e file.Src', 'Option suffixes should put .dat to the end.')

" test 'suffixesadd'
edit file.Dat
normal jj0gf
let failed_count += assert_equal('file.Src', expand('%'), 'Option suffixesadd should append .Src or at least .src here.')

call delete('file.Src')
call delete('file.Dat')


filetype plugin indent off
syntax off
