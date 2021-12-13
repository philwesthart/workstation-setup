syntax on
"colorscheme koehler

filetype indent plugin on

execute pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on

set number
set tabstop=4
set shiftwidth=4
set expandtab
set directory=$HOME/.vim/swapfiles//
set list
set listchars=tab:>-

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


" nerd tree
map <C-b> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree "Launch NERD Tree on start
au VimEnter * wincmd l " Set focus to the right (non-NERDTree) split
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "Close vim if NERDTree is the only remaining split

" Syntastic 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Snippets
nnoremap ,ch :-1read $HOME/.vim/snippets/c_descr<CR>
nnoremap ,pyh :-1read $HOME/.vim/snippets/py_descr<CR>
nnoremap ,shh :-1read $HOME/.vim/snippets/bash_descr<CR>

" Tag list
nnoremap <silent> <C-l> :TlistToggle<CR>
let Tlist_Exit_OnlyWindow = 1
let Tlist_Auto_Update = 1

" ctags
" automatically update ctags on write
autocmd BufWritePost * exe ":UpdateTags"

" Airline
let g:airline_section_b=''
let g:airline_section_y=''
