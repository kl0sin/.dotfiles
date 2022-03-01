local status_ok, trouble = pcall(require, 'trouble')

if not status_ok then
  return
end

local keymap = require 'lib.utils'.keymap

keymap('n', '<leader>xx', [[<cmd>Trouble<CR>]])

trouble.setup {}
