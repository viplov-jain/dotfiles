require('catppuccin').setup(require 'opts.theme')
vim.cmd.colorscheme 'catppuccin-mocha'

require 'opts.treesitter'
require 'lsp.lspattach'
require 'lsp.lspconfig'
require 'lsp.lint'
require('conform').setup(require 'opts.formatter')

require 'opts.cmp'
require 'opts.lualine'

require 'opts.telescope'
require 'opts.colorizer'
-- Highlight yanked text for 150ms
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Setup key maps
require('which-key').add(require('remaps').global_maps)
require('telescope').load_extension 'fzf'
