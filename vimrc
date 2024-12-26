colorscheme torte
set encoding=utf8
set autowrite
set paste
set nowrap

syntax on

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

"Performance improvements
set synmaxcol=200 "Don't bother highlighting anything over 200 chars columns
let loaded_matchparen = 1 "highlighting matching pairs so slow
let g:matchparen_timeout = 1 "match parenthesis timeout
let g:matchparen_insert_timeout = 1 "match parent insert timeout
set timeoutlen=1000
set ttimeoutlen=0
set lazyredraw "When this option is set, the screen will not be redrawn while executing macros, registers and other commands that have not been typed. Also, updating the window title is postponed
set nocompatible  " Disable compatibility with vi which can cause unexpected issues.
filetype on " Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype plugin on  " Enable plugins and load plugin for the detected file type.
filetype indent on  " Load an indent file for the detected file type.
set re=1            "use old regexp engine
set modelines=0     " dont need modelines and the potential security hazard
set scrolloff=2     " The scrolloff setting is the number of lines of context to keep above and below the cursor when scrolling to the very top and bottom of the screen. 
set visualbell      " don't beep
set noerrorbells    " don't beep

" close any hidden buffers
function! CloseHiddenBuffers()
    " >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    " close any buffers hidden
    " <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    let open_buffers = []

    for i in range(tabpagenr('$'))
        call extend(open_buffers, tabpagebuflist(i + 1))
    endfor

    for num in range(1, bufnr("$") + 1)
        if buflisted(num) && index(open_buffers, num) == -1
            exec "bdelete ".num
        endif
    endfor
endfunction

au BufEnter * call CloseHiddenBuffers()


" Add this to your vimrc to get a minimalist autocomplete pop
" Or use as a plugin : https://github.com/maxboisvert/vim-simple-complete

" Minimalist-TabComplete-Plugin
inoremap <expr> <Tab> TabComplete()
fun! TabComplete()
    if getline('.')[col('.') - 2] =~ '\K' || pumvisible()
        return "\<C-P>"
    else
        return "\<Tab>"
    endif
endfun

" Minimalist-AutoCompletePop-Plugin
set completeopt=menu,menuone,noinsert
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
autocmd InsertCharPre * call AutoComplete()
fun! AutoComplete()
    if v:char =~ '\K'
        \ && getline('.')[col('.') - 4] !~ '\K'
        \ && getline('.')[col('.') - 3] =~ '\K'
        \ && getline('.')[col('.') - 2] =~ '\K' " last char
        \ && getline('.')[col('.') - 1] !~ '\K'

        call feedkeys("\<C-P>", 'n')
    end
endfunc

" don't use tag and don't follow input files
set complete-=t
set complete-=i

" Highlight non-breaking spaces
set list
set listchars=nbsp:␣,tab:>·,trail:·
highlight NonText ctermfg=red
