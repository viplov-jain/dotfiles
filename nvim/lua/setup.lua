require('catppuccin').setup(require 'opts.theme')
vim.cmd.colorscheme 'catppuccin-mocha'

require 'opts.treesitter'
require 'lsp.lspattach'
require 'lsp.lspconfig'
require 'lsp.lint'
require 'opts.formatter'

require 'opts.cmp'
require 'opts.lualine'

require 'opts.telescope'

require 'opts.colorizer'

require('nvim-autopairs').setup {}
require('fidget').setup {}
require('gitsigns').setup {}
require('gitblame').setup { date_format = '%r' }
require('oil').setup {}

-- Highlight yanked text for 150ms
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
})

require('which-key').add(require('remaps').global_maps)
