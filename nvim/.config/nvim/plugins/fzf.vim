Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'

let g:fzf_layout = { 'up': '~90%', 'window': { 'width': 0.8, 'height': 0.8, 'yoffset':0.5, 'xoffset': 0.5 } }

 nmap <leader>f :Files<cr>
 nmap <leader>F :GFiles<cr>
 nmap <leader>b :Buffers<cr>
 nmap <leader>h :History<cr>
