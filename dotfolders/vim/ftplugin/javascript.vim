" Javascript specific settings

" Use eslint
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_eslint_args = '--config /home/ubuntu/bsa/v4/react-core/eslintrc.json'
let g:ale_javascript_eslint_executable = '/home/vagrant/bin/js-linter'

autocmd BufWrite <buffer> :call DeleteTrailingWS()

let g:prettier#exec_cmd_path = "/home/vagrant/bin/js-prettier"
autocmd BufWrite <buffer> Prettier
setlocal formatprg=/home/vagrant/bin/rb-prettier
