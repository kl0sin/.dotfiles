Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'
Plug 'fannheyward/telescope-coc.nvim'

let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-diagnostic',
    \ 'coc-emmet',
    \ 'coc-eslint',
    \ 'coc-git',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-pairs',
    \ 'coc-phpls',
    \ 'coc-php-cs-fixer',
    \ 'coc-prettier',
    \ 'coc-sh',
    \ 'coc-snippets',
    \ 'coc-sql',
    \ 'coc-svg',
    \ 'https://github.com/rodrigore/coc-tailwind-intellisense',
    \ 'coc-tsserver',
    \ '@yaegassy/coc-volar',
\ ]

set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" GoTo code navigation
nmap <silent> gd :Telescope coc definitions<CR>
nmap <silent> gy :Telescope coc type_definitions<CR>
nmap <silent> gi :Telescope coc implementations<CR>
nmap <silent> gr :Telescope coc references<CR> 

command! -nargs=0 Prettier :CocCommand prettier.formatFile

nnoremap <leader> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>l :CocFzfList<cr>

nmap <leader>af <plug>(coc-fix-current)
nmap <leader>am <plug>(coc-format-selected)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Adding `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
