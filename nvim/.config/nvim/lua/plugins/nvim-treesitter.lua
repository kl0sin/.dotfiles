require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  indent = {
    enable = true,
  },
  sync_install = false,
  highlight = {
    enable = true,
    lookahead = true,
  },
}
