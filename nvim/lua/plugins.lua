return {
  {
    -- Theme
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup(require 'opts.theme')
      vim.cmd.colorscheme 'catppuccin-mocha'
    end,
  },
  {
    -- Formatter
    'stevearc/conform.nvim',
    event = 'BufWritePre',
    cmd = 'ConformInfo',
    opts = require 'opts.formatter',
  },
  {
    -- Autocomplete
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-buffer',
    },
    config = function()
      require 'opts.cmp'
    end,
  },
  {
    -- Auto pairs () {} ...
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },
  {
    -- Bufferline
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup {
        highlights = require('catppuccin.groups.integrations.bufferline').get(),
      }
    end,
  },
  {
    -- Statusline
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = require 'opts.lualine',
  },
  {
    -- Search
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-tree/nvim-web-devicons',
    },
    opts = require 'opts.telescope',
  },
  {
    -- File tree
    'nvim-neo-tree/neo-tree.nvim',
    cmd = { 'Neotree' },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
  },
  {
    -- LSP
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
      require 'lsp.lspattach'
      require 'lsp.lspconfig'
    end,
  },
  {
    'mfussenegger/nvim-lint',
    config = function()
      require 'lsp.lint'
    end,
  },
  {
    -- Treesitter
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
    build = ':TSUpdate',
    config = function()
      require 'opts.treesitter'
    end,
  },
  { 'lewis6991/gitsigns.nvim', event = 'VeryLazy', opts = { current_line_blame = true } },
  { 'stevearc/oil.nvim', cmd = 'Oil', opts = {} },
  {
    'NvChad/nvim-colorizer.lua',
    config = function()
      require 'opts.colorizer'
    end,
  },
  'folke/which-key.nvim',
  'tpope/vim-surround',
  'wellle/targets.vim',
}
