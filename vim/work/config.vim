" Prettier
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 1
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue PrettierAsync
nnoremap <Leader>pp :Prettier<CR>

let g:prettier#config#single_quote = 'false'
let g:prettier#config#bracket_spacing = 'false'
let g:prettier#config#parser = 'babylon'
let g:prettier#config#trailing_comma = 'es5'
let g:prettier#config#arrow_parens = 'avoid'


" Quramy/tsuquyomi
let g:tsuquyomi_disable_quickfix = 1


" hashivim/vim-terraform
let g:terraform_align = 1
