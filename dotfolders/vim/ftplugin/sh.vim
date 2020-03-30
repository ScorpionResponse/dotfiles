" Bash specific settings

setlocal expandtab 
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4

autocmd BufWrite <buffer> :call DeleteTrailingWS()
