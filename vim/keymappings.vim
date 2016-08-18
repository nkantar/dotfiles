" necessary for incessant Vim config updates
nnoremap <Leader>s :source ~/.vim/vimrc<CR>

" saving and quitting are very common commands
nnoremap <Leader>ww :write<CR>
nnoremap <Leader>qq :quit<CR>
nnoremap <Leader>qa :quitall<CR>

nnoremap <Leader>p :set invpaste paste?<CR>

" <C-c> over Esc
inoremap <Esc> <Nop>

" hjkl over cursor keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" speaking of hjkl, movce cursor by display lines
noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$

" better movement between splits
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" spacebar makes for a great leader key
nnoremap <Space> <Nop>
map <Space> <Leader>
map <Space><Space> <Leader><Leader>

" find TODO comments
noremap <Leader>r /TODO\:\ Nik\ \-\ remove<CR>
noremap <Leader>n /TODO\:\ Nik<CR>
noremap <Leader>l :nohlsearch<CR>
