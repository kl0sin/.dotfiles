local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  print 'nvim-treesitter not found!'
  return
end

configs.setup {
  ensure_installed = 'maintained',
  indent = {
    enable = true,
  },
  sync_install = false,
  ignore_install = { '' },
  highlight = {
    enable = true,
    lookahead = true,
  },
  context_commentstring = {
    enable = true,
  }
}
