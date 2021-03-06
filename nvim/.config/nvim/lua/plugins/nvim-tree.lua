local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
  print 'nvim-tree not found!'
  return
end

vim.g.nvim_tree_git_gl = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_group_empty = 1

nvim_tree.setup {
  ignore_ft_on_setup = { 'dashboard' },
  view = {
    width = 50,
  },
  git = {
    ignore = false,
  },
  filters = {
    custom = { '.git', 'node_modules' }
  },
  actions = {
    open_file = {
      quit_on_open = true
    }
  }
}

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeFindFile<CR>', { silent = true, noremap = true })
