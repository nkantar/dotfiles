" Prettier
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue PrettierAsync

let g:prettier#config#single_quote = 'false'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#parser = 'babylon'
let g:prettier#config#trailing_comma = 'es5'
let g:prettier#config#arrow_parens = 'avoid'


" hashivim/vim-terraform
let g:terraform_align = 1
