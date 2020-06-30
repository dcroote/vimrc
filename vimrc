

call plug#begin('~/.vim/plugged')

Plug 'christoomey/vim-tmux-navigator'
Plug 'nvie/vim-flake8'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'editorconfig/editorconfig-vim'
Plug 'rust-lang/rust.vim'
set rtp+=~/.fzf

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

" backspace works on indents
set backspace=indent,eol,start

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

" first, set filetype of snakemake to python
au BufNewFile,BufRead Snakefile set filetype=python
au BufNewFile,BufRead *.snake set filetype=python
au BufNewFile,BufRead *.smk set filetype=python
" now override with snakemake syntax
au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead *.snake set syntax=snakemake
au BufNewFile,BufRead *.smk set syntax=snakemake

" other syntax highlighting
au BufNewFile,BufRead *.fasta set syntax=fasta
au BufNewFile,BufRead *.fa set syntax=fasta

" git commit message spell check
autocmd BufRead COMMIT_EDITMSG setlocal spell spelllang=en_us

" map leader to space
let mapleader=" "

" saving and quitting
nnoremap <leader>s :w<cr>
nnoremap <leader>x :x<cr>
nnoremap <leader>q :q<cr>

" fzf navigation
nmap <leader>b :Buffers<CR>
nmap <leader>f :Files<CR>

" pytest
nmap <leader>p :!pytest<CR>

" lightline
let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'fileencoding']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }

set nofoldenable

hi Search ctermbg=189 ctermfg=Black

" connect to system clipboard on WSL
" https://vi.stackexchange.com/a/16114
" microsoft may need to be capitalized depending on WSL distribution
if system('uname -r') =~ "microsoft"
  augroup Yank
    autocmd!
    autocmd TextYankPost * :call system('clip.exe ',@")
  augroup END
endif
