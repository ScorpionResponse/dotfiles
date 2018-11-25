" Javascript specific settings

" Use eslint
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_args = '--config /home/ubuntu/bsa/v4/react-core/eslintrc.json'

autocmd BufWrite <buffer> :call DeleteTrailingWS()
