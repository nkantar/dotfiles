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

set statusline=%F\ %y\ %m\ %=%v\,%l/%L(%P)
