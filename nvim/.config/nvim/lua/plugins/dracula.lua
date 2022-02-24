vim.cmd([[
  augroup DraculaOverrides
    autocmd!
      autocmd ColorScheme dracula highlight DraculaComment cterm=italic gui=italic
    augroup end

  colorscheme dracula
]])
