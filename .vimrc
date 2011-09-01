syntax on
colorscheme evening
set noswapfile

if has("win32")
  set nonumber
else
  set number
endif

"folding stuff
set foldmethod=indent
set foldlevelstart=99

"see :help guioptions
set guioptions=egLt

"indentation stuff
set autoindent
set expandtab
set softtabstop=2
set shiftwidth=2

if has("win32")
  set concealcursor=nc
endif

"autocommands
if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  "add $ to comments for dcl
  au BufEnter *.com set comments=n:$,n:! formatoptions+=r
  "use tabs not spaces in makefiles
  au BufEnter Makefile set noexpandtab
  au BufEnter Makefile set noexpandtab softtabstop=0
  au BufEnter *.wiki set textwidth=80
endif

"automatically close (), {}, and [].
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>

"typing a ), }, or ] when currently on that character won't add a new one
function! ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endf

inoremap ) <c-r>=ClosePair(')')<CR>
inoremap } <c-r>=ClosePair('}')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>

"deleting the first of an empty pair will delete the other
func! InAnEmptyPair()
  let cur = strpart(getline('.'),getpos('.')[2]-2,2)
  for pair in (split(&matchpairs,',') + ['":"',"':'"])
    if cur == join(split(pair,':'),'')
      return 1
    endif
  endfor
  return 0
endfunc

func! DeleteEmptyPairs()
  if InAnEmptyPair()
    return "\<Left>\<Del>\<Del>"
  else
    return "\<BS>"
  endif
endfunc

inoremap <expr> <BS> DeleteEmptyPairs()

"auto indent after pressing return in an empty pair.
func! IndentEmptyPair()
  if InAnEmptyPair()
    return "\<CR>\<CR>\<Up>\<Tab>"
  else
    return "\<CR>"
  endif
endfunc

inoremap <expr> <CR> IndentEmptyPair()

"cycle through tabs using C-h and C-l
nmap <C-h> gT
nmap <C-l> gt

"move tabs left and right using C-S-h and C-S-l
func! MoveTabLeft()
  let tab_n = tabpagenr() - 1
  if tab_n == 0
    exec "tabm" tabpagenr('$') - 1
  else
    exec "tabm" tab_n - 1
  endif
endfunc

func! MoveTabRight()
  let tab_n = tabpagenr() - 1
  let last_tab = tabpagenr('$') - 1
  if tab_n == last_tab
    exec "tabm" 0
  else
    exec "tabm" tab_n + 1
  endif
endfunc

nmap <S-h> :exec MoveTabLeft()<CR>
nmap <S-l> :exec MoveTabRight()<CR>

"when changing indentation in visual mode, reselect the same text
vnoremap > >gv
vnoremap < <gv

"automatically perf edit
function! P4Edit()
  if has("vms")
    return '!perf edit %'
  elseif has("unix")
    return '!p4 edit %'
  else
    return ''
  endif
endfunc

nmap <Leader>pe :exec P4Edit()<CR>

"set font
if has("unix")
  set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
elseif has("win32")
  set guifont=Courier_New:h10:cANSI
endif

"make sure backspace works
set backspace=2

"vimwiki stuff
if has("win32")
  filetype plugin on
  let g:vimwiki_auto_export = 1
  let g:vimwiki_badsyms     = ' '
endif

