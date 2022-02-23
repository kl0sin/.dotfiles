local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  print 'nvim-treesitter not found!'
  return
end


configs.setup {
  ensure_installed = 'maintained',
  sync_install = false,
  autopairs = {
    enable = true,
  },
  autotags = {
    enable = true,
    filetypes = {
      'html',
      'javascript',
      'javascriptreact',
      'typescriptreact',
      'svelte',
      'vue',
    }
  },
  ignore_install = { '' },
  highlight = {
    enable = true,
    lookahead = true,
  },
  context_commentstring = {
    enable = true,
  }
}
