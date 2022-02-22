local status_ok, which_key = pcall(require, 'which-key')

if not status_ok then
  return
end

vim.o.timeoutlen = 500

which_key.setup{}

which_key.register({
  f = {
    name = 'Telescope',
    f = 'Find Files',
    g = 'Live Grep',
    b = 'Buffers',
    k = 'Key Maps',
  }
}, { prefix = '<leader>'} )
