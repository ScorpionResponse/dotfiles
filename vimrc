"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:  Paul Moss
" 
" Website: http://scorpionresponse.com/
"
" Version: 1.0 - 2014-10-23
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NeoBundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('vim_starting')
  set nocompatible

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'Shougo/vimshell'
NeoBundle 'rkulla/pydiction'
NeoBundle 'klen/python-mode'
NeoBundle 'vim-scripts/TaskList.vim'
NeoBundle 'scrooloose/syntastic'

" You can specify revision/branch/tag.
" NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Detect, highlight, and indent
syntax on
filetype plugin on
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"colorscheme desert
"colorscheme darkblack
"colorscheme gothic
"colorscheme jhdark
"colorscheme pablo
colorscheme wargrey

set textwidth=79  " lines longer than 79 columns will be broken
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " a hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line

set t_Co=256      " Enable 256 Colors
"set gfn=Droid\ Sans\ Mono\ 10
set viminfo='100,\"50
set history=50    " Remember last 50 commands
set mousemodel=popup
set backspace=indent,eol,start
set showmatch     " highlight the matching bracket/brace
set hlsearch      " highlight the previous search result
set incsearch     " highlight search matches as you type
set ruler         " show line and column number
set showcmd       " shot command list on statusline
runtime macros/matchit.vim
set title         " Set the title of the window
set scrolloff=3   " position where the screen begins to scroll
set rnu           " relative line numbering on
set spell         " spellcheck on
set spelllang=en  " I speak english

" Quick controls for splits on F6
nnoremap <F6> <C-W>w
nnoremap <S-F6> <C-W>W

" Everyone must
set encoding=utf-8

autocmd BufNewFile,BufRead COMMIT_EDITMSG set filetype=gitcommit

set statusline=
set statusline +=%#Identifier#\ %n\ %*                      " buffer number
set statusline +=%#PreProc#%{&ff}%*                         " file format
set statusline +=%#Number#%y%*                              " file type
set statusline +=%#String#\ %<%t%*                          " full path
set statusline +=%#SpecialKey#%m%*                          " modified flag
set statusline +=%#Identifier#%=%5l%*                       " current line
set statusline +=%#SpecialKey#/%L%*                         " total lines
set statusline +=%#Identifier#%4v\ %*                       " virtual column number
set statusline +=%#SpecialKey#0x%04B\ %*                    " character under cursor
