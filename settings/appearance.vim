set nocompatible              " be iMproved, required
syntax on
set number
colorscheme dracula
set background=dark
set hlsearch
set relativenumber
set colorcolumn=80,100
set cursorline

let g:gitgutter_sign_column_always = 1
let g:gitgutter_max_signs = 10000

set laststatus=2

hi User1 ctermfg=242 ctermbg=236 cterm=bold

set statusline=

set statusline+=%1*%{expand('%:h')}/%*
set statusline+=%t
set statusline+=\ 
set statusline+=%y  " filetype
set statusline+=\ 
set statusline+=%m  " modified flag
set statusline+=\ 

set statusline+=%=  " right-align from now on

set statusline+=%v  " column number
set statusline+=\,
set statusline+=%l  " row number
set statusline+=\/
set statusline+=%L  " row total

hi StatusLine ctermfg=248 ctermbg=236
hi StatusLineNC ctermfg=242 ctermbg=236
