
""""""""""""""""""""""""""""""""""""""""""""""""""
" Helpers
""""""""""""""""""""""""""""""""""""""""""""""""""

" Paste mode
nnoremap <F8> :set invpaste paste?<CR>
set pastetoggle=<F8>
set showmode

" Toggle numbers
nmap <ESC>n :set relativenumber!<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""
" Leaders
""""""""""""""""""""""""""""""""""""""""""""""""""

" Change the mapleader from \ to ,
let mapleader=","

" Clear search highlight
map <silent> <leader>/ :nohlsearch<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""
" Improved default editing
""""""""""""""""""""""""""""""""""""""""""""""""""

" Case-insensitive search
nnoremap / /\v
vnoremap / /\v

" Since I never use the ; key anyway
nnoremap ; :

" Quickly get out of insert mode
inoremap jj <Esc>

" Remap j and k to act as expected when used on long, wrapped, lines
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k


""""""""""""""""""""""""""""""""""""""""""""""""""
" Window Navigation
""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap <leader>g <C-w>v<C-w>l  " split window vertically
nnoremap <leader>G <C-w>s<C-w>j  " split window vertically
