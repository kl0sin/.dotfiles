local status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')

if not status_ok then
  return
end

lsp_installer.settings({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})

local servers = {
  'sumneko_lua',
  'tsserver',
  'tailwindcss',
  'html',
  'eslint',
  'cssls',
  'html',
  'emmet_ls',
  'bashls',
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. name)
    server:install()
  end
end

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require('plugins/lsp/handlers').on_attach,
    capabilities = require('plugins/lsp/handlers').capabilities
  }

  if server.name == 'sumneko_lua' then
    local sumneko_opts = require('plugins.lsp.sumneko_lua')
    opts = vim.tbl_deep_extend('force', sumneko_opts, opts)
  end

  server:setup(opts)
end)
