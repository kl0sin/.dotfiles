local status_ok, configs = pcall(require, 'nvim-treesitter.configs')

if not status_ok then
  return
end

configs.setup {
  sync_install = false,
  ignore_install = { '' },
  indent = {
    enable = true,
  },
  highlight = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  }
}
