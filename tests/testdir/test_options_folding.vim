filetype plugin indent on
syntax on

let s:lastFoldClosedEnd = -1
let s:dictFoldClosedEnd = {}

function s:InitDicts() abort
  let s:lastFoldClosedEnd = -1
  let s:dictFoldClosedEnd = {}
endfunction

function s:PopulateDicts() abort
  for i in range(1, line("$"))
    if s:lastFoldClosedEnd != foldclosedend(i)
      let s:dictFoldClosedEnd[i] = foldclosedend(i)
      let s:lastFoldClosedEnd    = foldclosedend(i)
    endif
  endfor
endfunction


" test folding close all folds
split testdir/resource_Folding/sps.sub

setlocal foldlevel=0
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosedEnd = {'4': 14, '15': 37, '38': -1, '41': 45, '46': 49, '50': -1, '51': 81}
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'Result in sps.sub foldclosedend() must be correct at foldlevel=0!')

setlocal foldlevel=1
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosedEnd = {'5': 9, '10': 13, '14': -1, '16': 28, '29': 32, '33': 36, '37': -1, '52': 54, '55': -1, '77': 80, '81': -1}
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'Result in sps.sub foldclosedend() must be correct at foldlevel=1!')

setlocal foldlevel=2
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosedEnd = {}
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'Result in sps.sub foldclosedend() must be correct at foldlevel=2!')

bwipe!


split testdir/resource_Folding/fahrwege_small.src

setlocal foldlevel=0
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosedEnd = {'6': 16, '17': -1, '21': 39, '40': -1, '42': 48, '49': -1, '50': 63, '64': -1, '65': 69, '70': -1, '73': 79, '80': -1, '83': 89, '90': -1, '91': 96, '97': -1, '99': 105, '106': -1, '107': 113, '114': -1, '115': 121, '122': -1, '123': 130, '131': -1, '133': 139, '140': -1, '141': 148, '149': -1, '154': 164, '165': -1, '172': 178, '179': -1, '180': 186, '187': -1, '189': 195, '196': -1, '197': 209, '210': -1}
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'Result in fahrwege_small.src foldclosedend() must be correct at foldlevel=0!')

setlocal foldlevel=1
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosedEnd = {'7': 11, '12': 15, '16': -1, '23': 28, '29': -1, '155': 157, '158': -1, '203': 208, '209': -1}
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'Result in fahrwege_small.src foldclosedend() must be correct at foldlevel=1!')

setlocal foldlevel=2
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosedEnd = {'24': 26, '27': -1, '204': 206, '207': -1}
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'Result in fahrwege_small.src foldclosedend() must be correct at foldlevel=2!')

setlocal foldlevel=3
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosedEnd = {}
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'Result in fahrwege_small.src foldclosedend() must be correct at foldlevel=3!')

bwipe!


" test folding: close only movement folds
let g:krlFoldLevel=1
split testdir/resource_Folding/fahrwege_small.src

setlocal foldlevel=0
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosedEnd = {'24': 26, '27': -1, '42': 48, '49': -1, '73': 79, '80': -1, '83': 89, '90': -1, '99': 105, '106': -1, '107': 113, '114': -1, '115': 121, '122': -1, '133': 139, '140': -1, '154': 164, '165': -1, '172': 178, '179': -1, '180': 186, '187': -1, '189': 195, '196': -1, '204': 206, '207': -1}
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'Result only move folds in fahrwege_small.src foldclosedend() must be correct at foldlevel=0!')

setlocal foldlevel=1
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosedEnd = {'155': 157, '158': -1}
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'Result only move folds in fahrwege_small.src foldclosedend() must be correct at foldlevel=1!')

setlocal foldlevel=2
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosedEnd = {}
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'Result only move folds in fahrwege_small.src foldclosedend() must be correct at foldlevel=2!')

bwipe!
unlet g:krlFoldLevel


filetype plugin indent off
syntax off
" vim: sw=2 sts=2 et
