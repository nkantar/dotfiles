set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

set laststatus=2
set autoindent

set autoread

" split stuff
set splitbelow
set splitright

set clipboard=unnamed

set updatetime=250

" make backspace work like most other apps
set backspace=2

let g:UltiSnipsExpandTrigger='<c-\>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'

let g:ctrlp_custom_ignore = 'venv'

set completeopt-=preview

set shell=zsh\ -l

" from https://github.com/airblade/dotvim/blob/dd5d7737e39aad5e24c1a4a8c0d115ff2ae7b488/vimrc#L109-L111
set nobackup                      " No backups.
set nowritebackup                 " No backups.
set noswapfile                    " No swap files; more hassle than they're worth.

" Source: http://stackoverflow.com/a/6404246/151007
let i = 1
" If I have more than 9 windows open I have bigger problems :)
while i <= 9
  execute 'nnoremap <Leader>'.i.' :'.i.'wincmd w<CR>'
  let i = i + 1
endwhile
