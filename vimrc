

call plug#begin('~/.vim/plugged')

if has("patch-7-4.1578")
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
endif

Plug 'christoomey/vim-tmux-navigator'
Plug 'nvie/vim-flake8'
Plug 'Vimjas/vim-python-pep8-indent'

filetype plugin indent on  " required!

call plug#end()

filetype plugin on
filetype indent on

" set to auto read when a file is changed from the outside
set autoread

colorscheme SlateDark
set term=screen-256color  " for tmux compatibility

" dealing with tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

inoremap jk <ESC>
syntax on
set encoding=utf-8
set hls                             " highlight search matches
set showmatch                       " show bracket match
set ruler                           " show row and column in footer
set laststatus=2                    " always show status bar
set number                          " show line numbers

" relative line numbering, incompatibile with older vim versions
if version >= 703
    set relativenumber
endif

" easier split navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" syntax highlighting
au BufNewFile,BufRead *.fasta set syntax=fasta
au BufNewFile,BufRead *.fa set syntax=fasta

" map leader to space
let mapleader=" "

" saving and quitting
nnoremap <leader>s :w<cr>
nnoremap <leader>x :x<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>fq :q!<cr>

" goto definition
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
