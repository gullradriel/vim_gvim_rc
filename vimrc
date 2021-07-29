colorscheme torte
set encoding=utf8
set autowrite

"GoLang section
autocmd FileType go nmap <C-b> :GoBuild<CR>
autocmd FileType go nmap <C-r> :GoRun<CR>
autocmd FileType go nmap <C-n> :cnext<CR>
autocmd FileType go nmap <C-p> :cnext<CR>

"Some people prefer to use only quickfix though. If you add the following to your vimrc all lists will be of type quickfix:

let g:go_list_type = "quickfix"

"Ajout MikaO pour gestion indentation python
" configure expanding of tabs for various file types
let b:delimitMate_autoclose = 0
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.py let b:delimitMate_autoclose = 1
"
" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
set expandtab           " enter spaces when tab is pressed
"set textwidth=120       " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line

" make backspaces more powerfull
set backspace=indent,eol,start
