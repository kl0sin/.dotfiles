local keymap = require 'lib.utils'.keymap

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Exit insert mode
keymap('i', 'jj', '<ESC>')

-- Allow gf to open non-existent files
keymap('', 'gf', ':edit <cfile><CR>')

-- Moving text lines up and down
keymap('n', 'J', ':m .+1<CR>==')
keymap('n', 'K', ':m .-2<CR>==')
keymap('x', 'J', ":m '>+1<CR>gv=gv")
keymap('x', 'K', ":m '<-2<CR>gv=gv")
