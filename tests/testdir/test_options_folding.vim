filetype plugin indent on
syntax on

let s:lastFoldClosed    = -1
let s:lastFoldClosedEnd = -1
let s:dictFoldClosed    = {}
let s:dictFoldClosedEnd = {}

function s:InitDicts() abort
  let s:lastFoldClosed    = -1
  let s:lastFoldClosedEnd = -1
  let s:dictFoldClosed    = {}
  let s:dictFoldClosedEnd = {}
endfunction

function s:PopulateDicts() abort
  for i in range(1, line("$"))
    if s:lastFoldClosed != foldclosed(i)
      let s:dictFoldClosed[i] = foldclosed(i)
      let s:lastFoldClosed    = foldclosed(i)
    endif
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
let s:dictChkFoldClosed    = {'4': 4,  '15': 15, '38': -1, '41': 41, '46': 46, '50': -1, '51': 51}
let s:dictChkFoldClosedEnd = {'4': 14, '15': 37, '38': -1, '41': 45, '46': 49, '50': -1, '51': 81}
let failed_count += assert_equal(s:dictChkFoldClosed,    s:dictFoldClosed,    'Result in sps.sub foldclosed()    must be correct at foldlevel=0!')
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'Result in sps.sub foldclosedend() must be correct at foldlevel=0!')

setlocal foldlevel=1
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosed    = {'5': 5, '10': 10, '14': -1, '16': 16, '29': 29, '33': 33, '37': -1, '52': 52, '55': -1, '77': 77, '81': -1}
let s:dictChkFoldClosedEnd = {'5': 9, '10': 13, '14': -1, '16': 28, '29': 32, '33': 36, '37': -1, '52': 54, '55': -1, '77': 80, '81': -1}
let failed_count += assert_equal(s:dictChkFoldClosed,    s:dictFoldClosed,    'Result in sps.sub foldclosed()    must be correct at foldlevel=1!')
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'Result in sps.sub foldclosedend() must be correct at foldlevel=1!')

setlocal foldlevel=2
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosed    = {}
let s:dictChkFoldClosedEnd = {}
let failed_count += assert_equal(s:dictChkFoldClosed,    s:dictFoldClosed,    'Result in sps.sub foldclosed()    must be correct at foldlevel=2!')
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'Result in sps.sub foldclosedend() must be correct at foldlevel=2!')

bwipe!


split testdir/resource_Folding/fahrwege_small.src

setlocal foldlevel=0
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosed    = {'6': 6,  '17': -1, '21': 21, '40': -1, '42': 42, '49': -1, '50': 50, '64': -1, '65': 65, '70': -1, '73': 73, '80': -1, '83': 83, '90': -1, '91': 91, '97': -1, '99': 99,  '106': -1, '107': 107, '114': -1, '115': 115, '122': -1, '123': 123, '131': -1, '133': 133, '140': -1, '141': 141, '149': -1, '154': 154, '165': -1, '172': 172, '179': -1, '180': 180, '187': -1, '189': 189, '196': -1, '197': 197, '210': -1}
let s:dictChkFoldClosedEnd = {'6': 16, '17': -1, '21': 39, '40': -1, '42': 48, '49': -1, '50': 63, '64': -1, '65': 69, '70': -1, '73': 79, '80': -1, '83': 89, '90': -1, '91': 96, '97': -1, '99': 105, '106': -1, '107': 113, '114': -1, '115': 121, '122': -1, '123': 130, '131': -1, '133': 139, '140': -1, '141': 148, '149': -1, '154': 164, '165': -1, '172': 178, '179': -1, '180': 186, '187': -1, '189': 195, '196': -1, '197': 209, '210': -1}
let failed_count += assert_equal(s:dictChkFoldClosed,    s:dictFoldClosed,    'Result in fahrwege_small.src foldclosed()    must be correct at foldlevel=0!')
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'Result in fahrwege_small.src foldclosedend() must be correct at foldlevel=0!')

setlocal foldlevel=1
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosed    = {'7': 7,  '12': 12, '16': -1, '23': 23, '29': -1, '155': 155, '158': -1, '203': 203, '209': -1}
let s:dictChkFoldClosedEnd = {'7': 11, '12': 15, '16': -1, '23': 28, '29': -1, '155': 157, '158': -1, '203': 208, '209': -1}
let failed_count += assert_equal(s:dictChkFoldClosed,    s:dictFoldClosed,    'Result in fahrwege_small.src foldclosed()    must be correct at foldlevel=1!')
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'Result in fahrwege_small.src foldclosedend() must be correct at foldlevel=1!')

setlocal foldlevel=2
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosed    = {'24': 24, '27': -1, '204': 204, '207': -1}
let s:dictChkFoldClosedEnd = {'24': 26, '27': -1, '204': 206, '207': -1}
let failed_count += assert_equal(s:dictChkFoldClosed,    s:dictFoldClosed,    'Result in fahrwege_small.src foldclosed()    must be correct at foldlevel=2!')
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'Result in fahrwege_small.src foldclosedend() must be correct at foldlevel=2!')

setlocal foldlevel=3
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosed    = {}
let s:dictChkFoldClosedEnd = {}
let failed_count += assert_equal(s:dictChkFoldClosed,    s:dictFoldClosed,    'Result in fahrwege_small.src foldclosed()    must be correct at foldlevel=3!')
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'Result in fahrwege_small.src foldclosedend() must be correct at foldlevel=3!')

bwipe!


" test folding: close only movement folds
let g:krlFoldLevel=1
split testdir/resource_Folding/fahrwege_small.src

setlocal foldlevel=0
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosed    = {'24': 24, '27': -1, '42': 42, '49': -1, '73': 73, '80': -1, '83': 83, '90': -1, '99': 99,  '106': -1, '107': 107, '114': -1, '115': 115, '122': -1, '133': 133, '140': -1, '154': 154, '165': -1, '172': 172, '179': -1, '180': 180, '187': -1, '189': 189, '196': -1, '204': 204, '207': -1}
let s:dictChkFoldClosedEnd = {'24': 26, '27': -1, '42': 48, '49': -1, '73': 79, '80': -1, '83': 89, '90': -1, '99': 105, '106': -1, '107': 113, '114': -1, '115': 121, '122': -1, '133': 139, '140': -1, '154': 164, '165': -1, '172': 178, '179': -1, '180': 186, '187': -1, '189': 195, '196': -1, '204': 206, '207': -1}
let failed_count += assert_equal(s:dictChkFoldClosed,    s:dictFoldClosed,    'Result only move folds in fahrwege_small.src foldclosed()    must be correct at foldlevel=0!')
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'Result only move folds in fahrwege_small.src foldclosedend() must be correct at foldlevel=0!')

setlocal foldlevel=1
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosed    = {'155': 155, '158': -1}
let s:dictChkFoldClosedEnd = {'155': 157, '158': -1}
let failed_count += assert_equal(s:dictChkFoldClosed,    s:dictFoldClosed,    'Result only move folds in fahrwege_small.src foldclosed()    must be correct at foldlevel=1!')
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'Result only move folds in fahrwege_small.src foldclosedend() must be correct at foldlevel=1!')

setlocal foldlevel=2
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosed    = {}
let s:dictChkFoldClosedEnd = {}
let failed_count += assert_equal(s:dictChkFoldClosed,    s:dictFoldClosed,    'Result only move folds in fahrwege_small.src foldclosed()    must be correct at foldlevel=2!')
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'Result only move folds in fahrwege_small.src foldclosedend() must be correct at foldlevel=2!')

bwipe!
unlet g:krlFoldLevel


filetype plugin indent off
syntax off
" vim: sw=2 sts=2 et
