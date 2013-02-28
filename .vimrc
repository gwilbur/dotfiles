"Vundle stuff
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-commentary'
filetype plugin indent on

syntax on
set noswapfile
set nonumber
set nocompatible

if has("gui_running")
  set cursorline
endif

"see :help guioptions
set guioptions=gLt

"indentation stuff
set autoindent
set expandtab
set softtabstop=2
set shiftwidth=2

"searching stuff
set ignorecase
set smartcase
set incsearch
set wrapscan
set scrolloff=4
nnoremap <leader><space> :nohlsearch<cr>

"unmap arrow keys and mouse
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
noremap  <Up>    <NOP>
noremap  <Down>  <NOP>
noremap  <Left>  <NOP>
noremap  <Right> <NOP>
set mouse=

"unmap K
noremap K <NOP>

"movement by window line not file line
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"display list of possible completions
set wildmenu
set wildmode=longest,list

"spelling stuff
if has("unix")
  set spell
  set spelllang=en_us
  set spellsuggest=best,5
  highlight clear SpellBad
  highlight clear SpellCap
  highlight clear SpellRare
  highlight clear SpellLocal
endif

"use marker folds in log files
autocmd BufNewFile,BufRead *.log setlocal foldmethod=marker

"start find/replace with word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

"quick command for :tabedit
nnoremap <Leader>e :tabedit<space>

"mapping for Gundo
nnoremap <Leader>gu :GundoToggle<CR>

"this is so surround.vim doesn't get rid of this
xnoremap s s

"cycle through tabs using C-h and C-l
nnoremap <C-h> gT
nnoremap <C-l> gt

"move tabs left and right using S-h and S-l
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

nnoremap <S-h> mz:exec MoveTabLeft()<CR>`z
nnoremap <S-l> mz:exec MoveTabRight()<CR>`z

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

nnoremap <Leader>pe :exec P4Edit()<CR>:w!<CR>

"set font
if has("gui_running")
  if has("unix")
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
  elseif has("win32")
    set guifont=Courier_New:h10:cANSI
  elseif has("vms")
    set guifont=-adobe-courier-medium-r-normal-*-14-*-*-*-m-*-iso8859-15
  endif
endif
