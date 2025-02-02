local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

local servers = {
  clangd = {
    filetypes = { 'c', 'h', 'cpp', 'hpp', 'objc', 'objcpp', 'cuda' },
  },
  rust_analyzer = {},
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
        diagnostics = { globals = { 'vim' } },
      },
    },
  },
  pyright = {},
  ruff = {},
  ts_ls = {},
  eslint = {},
  nixd = {},
  bashls = {
    filetypes = { 'sh', 'zsh', 'bash' },
  },
}

for server, settings in pairs(servers) do
  settings = vim.tbl_deep_extend('force', {}, { capabilities = capabilities }, settings)
  require('lspconfig')[server].setup(settings)
end
