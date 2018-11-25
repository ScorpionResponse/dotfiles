" Elixir specific settings
let g:syntastic_elixir_checkers = ['elixir']
let g:syntastic_enable_elixir_checker = 1

autocmd BufWrite <buffer> :call DeleteTrailingWS()
