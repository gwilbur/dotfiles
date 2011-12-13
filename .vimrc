syntax on
filetype plugin indent on
call pathogen#infect()

colorscheme vividchalk

set noswapfile
set nonumber

"see :help guioptions
set guioptions=gLt

"indentation stuff
set autoindent
set expandtab
set softtabstop=2
set shiftwidth=2

"clear search hilights
nnoremap <leader><space> :nohlsearch<cr>

"movement by window line not file line
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"start find/replace with word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

"quick command for :tabnew
nnoremap <Leader>tn :tabnew<space>

"this is so surround.vim doesn't get rid of this
xnoremap s s

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
nnoremap <C-h> gT
nnoremap <C-l> gt

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

nnoremap <S-h> :exec MoveTabLeft()<CR>
nnoremap <S-l> :exec MoveTabRight()<CR>

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

nnoremap <Leader>pe :exec P4Edit()<CR>

"set font
if has("unix")
  set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
elseif has("win32")
  set guifont=Courier_New:h10:cANSI
elseif has("vms")
  set guifont=-adobe-courier-medium-r-normal-*-12-*-*-*-m-*-iso8859-15
endif
