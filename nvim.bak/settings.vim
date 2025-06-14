let mapleader = ' '
let maplocalleader = ' '

set title
set titlestring=%t

set autoindent
set shiftwidth=4
set softtabstop=4
set smarttab
set tabstop=4
set expandtab

set cursorline
set showcmd
set wildmenu
set wildmode=longest:list,full
set wrap
set linebreak
set completeopt=menu,menuone,noselect
set scrolloff=10
set signcolumn=yes

set showmatch

set termguicolors
set clipboard=unnamedplus
set encoding=utf-8

set hlsearch
set ignorecase
set incsearch
set smartcase
set smartindent
set number
set noshowmode

set mouse=a
set mousemodel=extend

if has('nvim')
    finish
endif

if empty(glob('~/.vim/autoload/plug.vim'))
    silent execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'preservim/nerdtree'
call plug#end()

colorscheme catppuccin_mocha
nnoremap <leader>n :NERDTreeToggle<CR>
