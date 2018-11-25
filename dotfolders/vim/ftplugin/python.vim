" Python specific settings

" Turn off rope
let g:pymode_rope = 0

" Path to pydiction dictionary
let g:pydiction_location = '/home/user/.vim/bundle/pydiction/complete-dict'

autocmd BufWrite <buffer> :call DeleteTrailingWS()
