" Ruby specific settings
setlocal expandtab 
setlocal shiftwidth=2 
setlocal softtabstop=2 
setlocal tabstop=2

" Use rubocop for ruby
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_ruby_rubocop_args = '-c /home/ubuntu/bsa/v4/core/config/rubocop.yml'

autocmd BufWrite <buffer> :call DeleteTrailingWS()
