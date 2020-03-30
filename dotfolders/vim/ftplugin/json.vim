" JSON specific settings

autocmd BufWrite <buffer> :call DeleteTrailingWS()

let g:prettier#exec_cmd_path = "/home/vagrant/bin/json-prettier"
autocmd BufWrite <buffer> Prettier
