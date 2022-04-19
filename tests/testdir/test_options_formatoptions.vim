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


" test 'formatoptions'=<DEFAULT VALUE> 
let g:krlAutoComment=0
call writefile(['def file()', '; a comment'], 'file.src')
split file.src
call setline(1, &fo)
execute "normal jA" . expand("\<CR>")
let failed_count += assert_equal('', getline('.'), 'Comment must not have been continued after i_<CR>.')
normal kO
let failed_count += assert_equal('', getline('.'), 'Comment must not have been continued after O.')
normal jo
let failed_count += assert_equal('', getline('.'), 'Comment must not have been continued after o.')
bwipe!
call delete('file.src')
unlet g:krlAutoComment


" test 'formatoptions'-=t
call writefile(['def file()', 'this is a very long line, about 45 character.'], 'file.src')
split file.src
normal jA And now we make the line even longer. It should not wrap!
let failed_count += assert_equal('this is a very long line, about 45 character. And now we make the line even longer. It should not wrap!', getline('.'), 'Formatting should leave this line untouched.')
bwipe!
call delete('file.src')


" test 'formatoptions'+=l and 'textwidth'=53
call writefile(['def file()', '; This comment is longer than 53 character. It should not get wrapped when we append!'], 'file.src')
split file.src
normal jA Append some more text!
let failed_count += assert_equal('; This comment is longer than 53 character. It should not get wrapped when we append! Append some more text!', getline('.'), 'Formatting should not wrap this line already long line.')
normal gqq
let failed_count += assert_equal('; text!', getline('.'), 'Formatting explicitly triggered with gqq. Now it should wrap at length 53!')
bwipe!
call delete('file.src')


" test 'formatoptions'+=l
set textwidth=10
call writefile(['def file()', '; This is a long line!'], 'file.src')
split file.src
normal jgqq
let failed_count += assert_equal('; line!', getline('.'), 'Line must get wrapped at text width 10.')
bwipe!
call delete('file.src')


" test g:krlFormatComments=0
set textwidth=76
let g:krlFormatComments=0
call writefile(['def file()', 'this is a very long line, about 45 character.'], 'file.src')
split file.src
normal jA And now we make the line even longer. This time it should wrap!
let failed_count += assert_equal('longer. This time it should wrap!', getline('.'), 'Line should get wrapped at column 76 because of default value of formatoptions+=t.')
bwipe!
call delete('file.src')
unlet g:krlFormatComments
set textwidth=0


filetype plugin indent off
syntax off
