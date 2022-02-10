"
"                      _    _  ___      _
"                     | | _| |/ _ \ ___(_)_ __
"                     | |/ / | | | / __| | '_ \
"                     |   <| | |_| \__ \ | | | |
"                     |_|\_\_|\___/|___/_|_| |_|
"
"
"     Personal vim configuration of Mateusz Kłosiński <github.com/kl0sin>
"
" -------------------------------------------------------------------------------
"  General Settings
" -------------------------------------------------------------------------------
set shiftwidth=2
set tabstop=2
set hidden
set relativenumber
set number
set termguicolors
set expandtab
set title
set list
set listchars=tab:▸\ ,trail:·
set mouse=a
set scrolloff=8
set sidescrolloff=8
set splitright
set clipboard=unnamedplus
set updatetime=300
set redrawtime=10000
set encoding=UTF-8
set wildignore+=*/node_modules/**

" -------------------------------------------------------------------------------
"  Key Maps
" -------------------------------------------------------------------------------

let mapleader = "\<space>"

" Quickly excape to normal mode
imap jj <ESC>

" Allow gf to open non-existing files
map gf :edit <cfile><cr>

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>

" Let 'Y' behave like the other capital letters
nnoremap Y y$

" Keeping it centered
nnoremap n nzzzv
nnoremap J mzJ`z
nnoremap N Nzzzv

" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==

" -------------------------------------------------------------------------------
"  Plugins
" -------------------------------------------------------------------------------

call plug#begin()

source ~/.config/nvim/plugins/airline.vim           " Leam & mean status/tabline form vim that's ligh as air.
source ~/.config/nvim/plugins/dracula.vim           " dracula - a dark theme for Vim
source ~/.config/nvim/plugins/nerdtree.vim          " The NERDTree is a file system explorer for the Vim editor.
source ~/.config/nvim/plugins/fzf.vim               " fzf is a general-purpose command-line fuzzy finder.
source ~/.config/nvim/plugins/coc.vim               " Make you Vim/Neovim as smart as VSCode.
source ~/.config/nvim/plugins/commentary.vim        " Comment stuff out.
source ~/.config/nvim/plugins/dashboard.vim         " Nice looking Dashboard.
source ~/.config/nvim/plugins/smooth-scroll.vim     " Smooth Scroll.
source ~/.config/nvim/plugins/cursorline.vim     " Hihglight words and line on the cursor for Neovim. 

call plug#end()

doautocmd User PlugLoaded
