vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_gl = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_group_empty = 1

require('nvim-tree').setup {
  auto_close = true,
  ignore_ft_on_setup = { 'dashboard' },
  view = {
    width = 50
  },
  git = {
    ignore = false,
  },
  filters = {
    custom = { '.git', 'node_modules' }
  }
}

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true, noremap = true })
