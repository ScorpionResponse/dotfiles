" scss specific settings
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab

autocmd BufWrite <buffer> :call DeleteTrailingWS()

let g:prettier#exec_cmd_path = "/home/vagrant/bin/scss-prettier"
autocmd BufWrite <buffer> Prettier
