syntax on
"colorscheme koehler

filetype indent plugin on

"execute pathogen#infect()

set mouse=a
set number
set tabstop=2
set shiftwidth=2
set expandtab


hi Search cterm=NONE ctermfg=grey ctermbg=blue

" move within paragraph
nnoremap <Up> gk
nnoremap <Down> gj
nnoremap k gk
nnoremap j gj
inoremap <C-k> <C-o>gk
inoremap <C-j> <C-o>gj
inoremap <Up> <C-o>gk
inoremap <Down> <C-o>gj

" jj is escape
inoremap jj <Esc>

" KK is the bracket thing
inoremap KK <Esc>O

" Spell check
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.txt setlocal spell
set spelllang=en_us
hi clear SpellBad
hi SpellBad cterm=underline
hi clear SpellCap
hi SpellCap cterm=underline
hi clear SpellRare
hi SpellRare cterm=underline
hi clear SpellLocal
hi SpellLocal cterm=underline


" And load any vimrc's in the local directory
let g:localrc_filename='vimrc.local'

