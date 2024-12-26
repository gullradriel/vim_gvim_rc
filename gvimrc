""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                                  " désactivation de la compatibilité avec vi
set background=dark                               " fond sombre
colorscheme koehler                               " couleur
syntax on                                         " activation de la coloration syntaxique
set number                                        " numérotation des lignes
set autoindent                                    " indentation automatique avancée
set smartindent                                   " indentation plus intelligente
set laststatus=2                                  " ajoute une barre de status
set backspace=indent,eol,start                    " autorisation du retour arrière
set history=50                                    " historique de 50 commandes
set ruler                                         " affiche la position courante au sein du fichier
set showcmd                                       " affiche la commande en cours
set shiftwidth=4                                  " nombre de tabulation pour l'indentation
set tabstop=4									  " nombre d'espace pour une tabulation
set showmatch                                     " vérification présence ([ ou { à la frappe de )] ou }
filetype on 								      " Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype plugin on                                " Enable plugins and load plugin for the detected file type.
filetype indent on                                " Load an indent file for the detected file type.

set fileformats=unix,mac,dos                      " gestion des retours chariot en fonction du type de fichier
set viewdir=~/.vim/saveview/                      " répertoire pour sauvegarder les vues, utiles pour les replis manuels
set cursorline                                    " afficher la ligne courante
hi CursorLine guibg=#4d4d4d                       " couleur de fond pour la ligne courante
set foldcolumn=2                                  " repère visuel pour les folds
let Tlist_Ctags_Cmd = '/usr/bin/ctags'      	  " implémentation de ctags, nécessaire pour le plugin 'taglist'
set guioptions-=T                                 " supprime la barre d'outils
set incsearch                                     " recherche incrémentale
set hlsearch                                      " surligne les résultats de la recherche
set ignorecase                                    " ne pas prendre en compte la casse lors des recherches
set antialias									  " jolies polices
set guifont=Monospace\ Regular\ 14                " police de caractère

set nolist					                      " on n'affiche pas les caractères non imprimables

set lazyredraw									  " quicker display	

""""""""""""""""""""""""""""""""""""""""""""""""""
"Mapping pour désactiver le surlignage des
"résultats d'une recherche
""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <C-N> :noh<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
"Mapping pour naviguer dans les lignes coupées
""""""""""""""""""""""""""""""""""""""""""""""""""
map <A-DOWN> gj
map <A-UP> gk
imap <A-UP> <ESC>gki
imap <A-DOWN> <ESC>gkj

""""""""""""""""""""""""""""""""""""""""""""""""""
"Repositionner le curseur à l'emplacement de la
"dernière édition
""""""""""""""""""""""""""""""""""""""""""""""""""
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

""""""""""""""""""""""""""""""""""""""""""""""""""
" Display a red carret for bad breaking spaces
""""""""""""""""""""""""""""""""""""""""""""""""""
set list
set listchars=nbsp:␣,tab:>·,trail:·
highlight NonText ctermfg=red guifg=red
