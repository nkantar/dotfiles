set nocompatible              " be iMproved, required
filetype off                  " required

imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
"call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/.config/nvim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimfiler.vim'

Plugin 'Valloric/YouCompleteMe'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ntpeters/vim-better-whitespace'

"Plugin 'scrooloose/syntastic'

Plugin 'mileszs/ack.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'easymotion/vim-easymotion'

Plugin 'SirVer/ultisnips'

Plugin 'blindFS/vim-taskwarrior'
Plugin 'terryma/vim-multiple-cursors'

Plugin 'nkantar/Spacegray.vim'

Plugin 'robertmeta/nofrils'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line<Paste>


" general stuff from way before
syntax on
set number
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
set autoindent
set updatetime=250

" split stuff
set splitbelow
set splitright

" Airline
let g:airline_theme='base16_grayscale'

let g:solarized_termcolors=256
colorscheme spacegray

let g:gitgutter_sign_column_always = 1

set autoread

let g:gitgutter_max_signs = 10000

set colorcolumn=100

set clipboard=unnamed

":colo nofrils-dark

let g:UltiSnipsExpandTrigger='<c-\>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'

autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
