local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

local keymap = require 'lib.utils'.keymap

keymap('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
keymap('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]])
keymap('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
keymap('n', '<leader>km', [[<cmd>lua require('telescope.builtin').keymaps()<CR>]])

telescope.setup {
  defaults = {
    color_devicons = true,
    prompt_prefix = '   ',
    selection_caret = '  ',
    path_display = { 'smart' },
    layout_config = {
      prompt_position = 'top',
    },
    file_ignore_patterns = { '.git/', 'node_modules/' },
    sorting_strategy = 'ascending',
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
  },
  pickers = {
    sort_lastused = true,
    find_files = {
      previewer = false,
      theme = 'dropdown',
      hidden = true,
      layout_config = {
        width = 100
      }
    },
  },
}

telescope.load_extension 'fzf'
