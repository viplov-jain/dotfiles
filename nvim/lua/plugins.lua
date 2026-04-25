local gh = function(x)
  return 'https://github.com/' .. x
end
vim.pack.add {
  { src = gh 'catppuccin/nvim', name = 'catppuccin' },

  -- Dependencies
  gh 'nvim-tree/nvim-web-devicons',
  gh 'nvim-lua/plenary.nvim',
  gh 'j-hui/fidget.nvim',

  gh 'nvim-treesitter/nvim-treesitter',
  gh 'neovim/nvim-lspconfig',
  gh 'mfussenegger/nvim-lint',
  gh 'stevearc/conform.nvim',

  gh 'hrsh7th/nvim-cmp',
  gh 'hrsh7th/cmp-nvim-lsp',
  gh 'L3MON4D3/LuaSnip',
  gh 'hrsh7th/cmp-cmdline',
  gh 'hrsh7th/cmp-buffer',
  gh 'rafamadriz/friendly-snippets',
  gh 'windwp/nvim-autopairs',

  gh 'akinsho/bufferline.nvim',

  gh 'nvim-lualine/lualine.nvim',

  gh 'nvim-telescope/telescope.nvim',

  gh 'MunifTanjim/nui.nvim',
  gh 'nvim-neo-tree/neo-tree.nvim',

  gh 'lewis6991/gitsigns.nvim',
  gh 'f-person/git-blame.nvim',
  gh 'stevearc/oil.nvim',
  gh 'NvChad/nvim-colorizer.lua',
  gh 'folke/which-key.nvim',
  gh 'nvim-pack/nvim-spectre',
  gh 'tpope/vim-surround',
  gh 'wellle/targets.vim',
}
