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
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    opts = require 'opts.formatter',
  },
  {
    -- Autocomplete
    'hrsh7th/nvim-cmp',
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
  },
  {
    -- File tree
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup()
    end,
  },

  {
    -- LSP
    'neovim/nvim-lspconfig',
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
    -- Diagnostics
    'folke/trouble.nvim',
    cmd = 'Trouble',
    opts = {},
  },
  {
    -- Treesitter
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require 'opts.treesitter'
    end,
  },
  { 'lewis6991/gitsigns.nvim', opts = { current_line_blame = true } },
  { 'stevearc/oil.nvim', opts = {} },
  { 'akinsho/toggleterm.nvim', opts = {} },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && npm install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },
  {
    'NvChad/nvim-colorizer.lua',
    config = function()
      require 'opts.colorizer'
    end,
  },
  'folke/which-key.nvim',
  'kosayoda/nvim-lightbulb',
  'tpope/vim-surround',
  'wellle/targets.vim',
  'folke/zen-mode.nvim',
}
