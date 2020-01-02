call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/vim-easy-align'
Plug 'kien/ctrlp.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mileszs/ack.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
call plug#end()

" color stuff
set background=dark
colorscheme solarized
syntax on

" vim-jsx-pretty
highlight link jsxBraces javaScriptBraces

" easy-align
vmap <Enter> <Plug>(EasyAlign)

" misc
set laststatus=2
set noswapfile
set nonumber
set diffopt=filler,vertical
set scrolloff=6
set formatoptions=cronbj
set nojoinspaces

" indentation stuff
set autoindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" searching stuff
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
nnoremap <leader><space> :nohlsearch<cr>

" unmap arrow keys
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
noremap  <Up>    <NOP>
noremap  <Down>  <NOP>
noremap  <Left>  <NOP>
noremap  <Right> <NOP>

" make K work like J
noremap K kJ

" swap j/k with gj/gk (movement by window line vs file line)
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k
vnoremap j gj
vnoremap gj j
vnoremap k gk
vnoremap gk k
