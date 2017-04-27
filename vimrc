filetype plugin on
filetype indent on

" set to auto read when a file is changed from the outside
set autoread

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

" relative line numbering, compatibile with older vim versions
if version >= 703
    set relativenumber
endif
