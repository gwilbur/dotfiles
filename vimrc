set nocompatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'junegunn/vim-easy-align'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'

call vundle#end()
filetype plugin indent on

vmap <Enter> <Plug>(EasyAlign)

"color stuff
set background=dark
colorscheme solarized
syntax on

set noswapfile
set nonumber
set diffopt=filler,vertical

"set formatoptions=croanj

set nojoinspaces

"indentation stuff
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

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

"this is so surround.vim doesn't get rid of this
xnoremap s s

"when changing indentation in visual mode, reselect the same text
vnoremap > >gv
vnoremap < <gv
