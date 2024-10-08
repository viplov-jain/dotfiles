return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
      require 'lsp.lspattach'
      require 'lsp.lspconfig'
    end,
  },
}
