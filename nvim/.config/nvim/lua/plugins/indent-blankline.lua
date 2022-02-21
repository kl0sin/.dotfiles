local status_ok, indent_blankline = pcall(require, 'indent_blankline')

if not status_ok then
  return
end

vim.cmd([[
  highlight IndentBlanklineJess guifg=#2F313C gui=nocombine
]])

indent_blankline.setup{
  filetype_exclude = {
    'help',
    'dashboard',
    'packer',
    'TelescopePrompt',
    'TelescopeResults',
  },
  show_first_indent_level = false,
  char_highlight_list = {
    'IndentBlanklineJess'
  }
}
