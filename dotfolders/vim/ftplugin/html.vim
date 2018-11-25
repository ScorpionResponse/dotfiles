" HTML file configuration
setlocal textwidth=0
setlocal wrapmargin=0

autocmd BufWrite <buffer> :call DeleteTrailingWS()
