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


" test folding VKRC
let g:krlFoldLevel=2
split testdir/resource_Folding/FOLGE128.src

setlocal foldlevel=0
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosedEnd = {'8': 17, '18': 45, '46': 51, '52': 78, '79': 83, '84': 102, '103': 121, '122': 528}
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'VKRC FOLGE128.src test folding close all folds: foldlevel=0')

setlocal foldlevel=1
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosedEnd = {'19': 20, '21': 44, '45': -1, '53': 54, '55': 56, '57': 58, '59': 60, '61': 62, '63': 64, '65': 66, '67': 77, '78': -1, '80': 82, '83': -1, '85': 86, '87': 88, '89': 90, '91': 101, '102': -1, '104': 105, '106': 120, '121': -1, '155': 163, '164': -1, '170': 173, '174': -1, '175': 188, '189': -1, '190': 201, '202': -1, '203': 206, '207': -1, '208': 209, '210': -1, '211': 212, '213': -1, '214': 215, '216': -1, '217': 218, '219': -1, '220': 221, '222': -1, '223': 224, '225': -1, '226': 227, '228': -1, '229': 230, '231': -1, '232': 233, '234': -1, '235': 236, '237': -1, '238': 239, '240': -1, '241': 242, '243': -1, '244': 245, '246': -1, '247': 248, '249': -1, '250': 251, '252': -1, '253': 254, '255': -1, '256': 257, '258': -1, '259': 260, '261': -1, '262': 263, '264': -1, '265': 266, '267': -1, '268': 269, '270': -1, '271': 272, '273': -1, '274': 275, '276': -1, '277': 278, '279': -1, '280': 281, '282': -1, '283': 284, '285': -1, '286': 287, '288': -1, '289': 290, '291': -1, '292': 293, '294': -1, '295': 296, '297': -1, '298': 299, '300': -1, '301': 302, '303': -1, '304': 305, '306': -1, '307': 308, '309': -1, '310': 311, '312': -1, '313': 314, '315': -1, '316': 317, '318': -1, '319': 320, '321': -1, '322': 323, '324': -1, '325': 326, '327': -1, '328': 329, '330': -1, '331': 332, '333': -1, '334': 335, '336': -1, '337': 338, '339': -1, '340': 341, '342': -1, '343': 344, '345': -1, '346': 347, '348': -1, '349': 350, '351': -1, '352': 353, '354': -1, '355': 356, '357': -1, '358': 359, '360': -1, '361': 362, '363': -1, '364': 365, '366': -1, '367': 368, '369': -1, '370': 371, '372': -1, '373': 374, '375': -1, '376': 377, '378': -1, '379': 380, '381': -1, '382': 383, '384': -1, '385': 386, '387': -1, '388': 389, '390': -1, '391': 392, '393': -1, '394': 395, '396': -1, '397': 398, '399': -1, '400': 401, '402': -1, '403': 404, '405': -1, '406': 407, '408': -1, '409': 410, '411': -1, '412': 413, '414': -1, '415': 416, '417': -1, '418': 419, '420': -1, '421': 422, '423': -1, '424': 425, '426': -1, '427': 428, '429': -1, '430': 431, '432': -1, '433': 434, '435': -1, '436': 437, '438': -1, '439': 440, '441': -1, '442': 443, '444': -1, '445': 446, '447': -1, '448': 449, '450': -1, '451': 452, '453': -1, '454': 455, '456': -1, '457': 458, '459': -1, '460': 461, '462': -1, '463': 464, '465': -1, '466': 467, '468': -1, '469': 470, '471': -1, '472': 473, '474': -1, '475': 476, '477': -1, '478': 479, '480': -1, '481': 482, '483': -1, '484': 485, '486': -1, '487': 488, '489': -1, '490': 491, '492': -1, '493': 494, '495': -1, '496': 497, '498': -1, '499': 500, '501': -1, '502': 503, '504': -1, '505': 506, '507': -1, '508': 509, '510': -1, '512': 520, '521': -1}
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'VKRC FOLGE128.src test folding close all folds: foldlevel=1')

setlocal foldlevel=2
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosedEnd = {}
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'VKRC FOLGE128.src test folding close all folds: foldlevel=2')

unlet g:krlFoldLevel
bwipe!


" test folding close all folds
let g:krlFoldLevel=2
split testdir/resource_Folding/sps.sub

setlocal foldlevel=0
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosedEnd = {'4': 14, '15': 37, '38': -1, '41': 45, '46': 49, '50': -1, '51': 81}
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'sps.sub test folding close all folds: foldlevel=0')

setlocal foldlevel=1
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosedEnd = {'5': 9, '10': 13, '14': -1, '16': 28, '29': 32, '33': 36, '37': -1, '52': 54, '55': -1, '77': 80, '81': -1}
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'sps.sub test folding close all folds: foldlevel=1')

setlocal foldlevel=2
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosedEnd = {}
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'sps.sub test folding close all folds: foldlevel=2')

unlet g:krlFoldLevel
bwipe!


let g:krlFoldLevel=2
split testdir/resource_Folding/fahrwege_small.src

setlocal foldlevel=0
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosedEnd = {'6': 16, '17': -1, '21': 39, '40': -1, '42': 48, '49': -1, '50': 63, '64': -1, '65': 69, '70': -1, '73': 79, '80': -1, '83': 89, '90': -1, '91': 96, '97': -1, '99': 105, '106': -1, '107': 113, '114': -1, '115': 121, '122': -1, '123': 130, '131': -1, '133': 139, '140': -1, '141': 148, '149': -1, '154': 164, '165': -1, '172': 178, '179': -1, '180': 186, '187': -1, '189': 195, '196': -1, '197': 209, '210': -1}
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'fahrwege_small.src test folding close all folds: foldlevel=0')

setlocal foldlevel=1
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosedEnd = {'7': 11, '12': 15, '16': -1, '23': 28, '29': -1, '155': 157, '158': -1, '203': 208, '209': -1}
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'fahrwege_small.src test folding close all folds: foldlevel=1')

setlocal foldlevel=2
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosedEnd = {'24': 26, '27': -1, '204': 206, '207': -1}
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'fahrwege_small.src test folding close all folds: foldlevel=2')

setlocal foldlevel=3
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosedEnd = {}
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'fahrwege_small.src test folding close all folds: foldlevel=3')

unlet g:krlFoldLevel
bwipe!


" test folding: close only movement folds
" g:krlFoldLevel defaults to 1
split testdir/resource_Folding/FOLGE128.src

setlocal foldlevel=0
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosedEnd = {'8': 17, '18': -1, '19': 20, '21': 44, '45': -1, '46': 51, '52': -1, '53': 54, '55': 56, '57': 58, '59': 60, '61': 62, '63': 64, '65': 66, '67': 77, '78': -1, '79': 83, '84': -1, '85': 86, '87': 88, '89': 90, '91': 101, '102': -1, '104': 105, '106': 120, '121': -1, '122': 528}
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'VKRC FOLGE128.src test folding close only movement folds: foldlevel=0')

setlocal foldlevel=1
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosedEnd = {'80': 82, '83': -1, '155': 163, '164': -1, '170': 173, '174': -1, '175': 188, '189': -1, '190': 201, '202': -1, '203': 206, '207': -1, '208': 209, '210': -1, '211': 212, '213': -1, '214': 215, '216': -1, '217': 218, '219': -1, '220': 221, '222': -1, '223': 224, '225': -1, '226': 227, '228': -1, '229': 230, '231': -1, '232': 233, '234': -1, '235': 236, '237': -1, '238': 239, '240': -1, '241': 242, '243': -1, '244': 245, '246': -1, '247': 248, '249': -1, '250': 251, '252': -1, '253': 254, '255': -1, '256': 257, '258': -1, '259': 260, '261': -1, '262': 263, '264': -1, '265': 266, '267': -1, '268': 269, '270': -1, '271': 272, '273': -1, '274': 275, '276': -1, '277': 278, '279': -1, '280': 281, '282': -1, '283': 284, '285': -1, '286': 287, '288': -1, '289': 290, '291': -1, '292': 293, '294': -1, '295': 296, '297': -1, '298': 299, '300': -1, '301': 302, '303': -1, '304': 305, '306': -1, '307': 308, '309': -1, '310': 311, '312': -1, '313': 314, '315': -1, '316': 317, '318': -1, '319': 320, '321': -1, '322': 323, '324': -1, '325': 326, '327': -1, '328': 329, '330': -1, '331': 332, '333': -1, '334': 335, '336': -1, '337': 338, '339': -1, '340': 341, '342': -1, '343': 344, '345': -1, '346': 347, '348': -1, '349': 350, '351': -1, '352': 353, '354': -1, '355': 356, '357': -1, '358': 359, '360': -1, '361': 362, '363': -1, '364': 365, '366': -1, '367': 368, '369': -1, '370': 371, '372': -1, '373': 374, '375': -1, '376': 377, '378': -1, '379': 380, '381': -1, '382': 383, '384': -1, '385': 386, '387': -1, '388': 389, '390': -1, '391': 392, '393': -1, '394': 395, '396': -1, '397': 398, '399': -1, '400': 401, '402': -1, '403': 404, '405': -1, '406': 407, '408': -1, '409': 410, '411': -1, '412': 413, '414': -1, '415': 416, '417': -1, '418': 419, '420': -1, '421': 422, '423': -1, '424': 425, '426': -1, '427': 428, '429': -1, '430': 431, '432': -1, '433': 434, '435': -1, '436': 437, '438': -1, '439': 440, '441': -1, '442': 443, '444': -1, '445': 446, '447': -1, '448': 449, '450': -1, '451': 452, '453': -1, '454': 455, '456': -1, '457': 458, '459': -1, '460': 461, '462': -1, '463': 464, '465': -1, '466': 467, '468': -1, '469': 470, '471': -1, '472': 473, '474': -1, '475': 476, '477': -1, '478': 479, '480': -1, '481': 482, '483': -1, '484': 485, '486': -1, '487': 488, '489': -1, '490': 491, '492': -1, '493': 494, '495': -1, '496': 497, '498': -1, '499': 500, '501': -1, '502': 503, '504': -1, '505': 506, '507': -1, '508': 509, '510': -1, '512': 520, '521': -1}
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'VKRC FOLGE128.src test folding close only movement folds: foldlevel=1')

setlocal foldlevel=2
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosedEnd = {}
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'VKRC FOLGE128.src test folding close only movement folds: foldlevel=2')

bwipe!


split testdir/resource_Folding/sps.sub

setlocal foldlevel=0
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosedEnd = {}
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'sps.sub test folding close only movement folds: foldlevel=0')

bwipe!


split testdir/resource_Folding/fahrwege_small.src

setlocal foldlevel=0
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosedEnd = {'24': 26, '27': -1, '42': 48, '49': -1, '73': 79, '80': -1, '83': 89, '90': -1, '99': 105, '106': -1, '107': 113, '114': -1, '115': 121, '122': -1, '133': 139, '140': -1, '154': 164, '165': -1, '172': 178, '179': -1, '180': 186, '187': -1, '189': 195, '196': -1, '204': 206, '207': -1}
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'fahrwege_small.src test folding: close only movement folds: g:krlFoldLevel=1 foldlevel=0')

setlocal foldlevel=1
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosedEnd = {'155': 157, '158': -1}
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'fahrwege_small.src test folding: close only movement folds: g:krlFoldLevel=1 foldlevel=1')

setlocal foldlevel=2
call s:InitDicts()
call s:PopulateDicts()
let s:dictChkFoldClosedEnd = {}
let failed_count += assert_equal(s:dictChkFoldClosedEnd, s:dictFoldClosedEnd, 'fahrwege_small.src test folding: close only movement folds: g:krlFoldLevel=1 foldlevel=2')

bwipe!


filetype plugin indent off
syntax off
" vim: sw=2 sts=2 et
