set nocompatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
call vundle#end()
filetype plugin indent on

"color stuff
set t_Co=16
set background=dark
colorscheme solarized
syntax on

set noswapfile
set nonumber
set cursorline
set diffopt=filler,vertical

set formatoptions=croanj

"airline stuff
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

"indentation stuff
set autoindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

"searching stuff
set ignorecase
set smartcase
set incsearch
set wrapscan
set scrolloff=6
set hlsearch
nnoremap <leader><space> :nohlsearch<cr>

"unmap arrow keys
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
noremap  <Up>    <NOP>
noremap  <Down>  <NOP>
noremap  <Left>  <NOP>
noremap  <Right> <NOP>

"make K work like J
noremap K kJ

"swap j/k with gj/gk (movement by window line vs file line)
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k
vnoremap j gj
vnoremap gj j
vnoremap k gk
vnoremap gk k

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

"diff accept left or right then move to next diff
nnoremap [m :diffget //2<CR>:diffupdate<CR>]czz
nnoremap ]m :diffget //3<CR>:diffupdate<CR>]czz

"quick command for :tabedit
nnoremap <Leader>e :tabedit<space>

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
