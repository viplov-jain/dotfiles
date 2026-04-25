local function add(spec)
  local function parse(s)
    -- If it's a shorthand (no http/git prefix and contains a slash), expand it
    if type(s) == 'string' and not s:find '^%w+://' and s:find '/' then
      return 'https://github.com/' .. s
    end
    return s
  end

  if type(spec) == 'table' then
    for i, v in ipairs(spec) do
      if type(v) == 'string' then
        spec[i] = parse(v)
      elseif type(v) == 'table' and v.src then
        v.src = parse(v.src)
      end
    end
  else
    spec = parse(spec)
  end

  vim.pack.add(spec)
end

add {
  { src = 'catppuccin/nvim', name = 'catppuccin' },

  -- Dependencies
  'nvim-tree/nvim-web-devicons',
  'nvim-lua/plenary.nvim',
  'j-hui/fidget.nvim',

  'nvim-treesitter/nvim-treesitter',
  'neovim/nvim-lspconfig',
  'mfussenegger/nvim-lint',
  'stevearc/conform.nvim',

  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'L3MON4D3/LuaSnip',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-buffer',
  'rafamadriz/friendly-snippets',
  'windwp/nvim-autopairs',

  'akinsho/bufferline.nvim',

  'nvim-lualine/lualine.nvim',

  { src = 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  'nvim-telescope/telescope.nvim',

  'MunifTanjim/nui.nvim',
  'nvim-neo-tree/neo-tree.nvim',

  'lewis6991/gitsigns.nvim',
  'f-person/git-blame.nvim',
  'stevearc/oil.nvim',
  'NvChad/nvim-colorizer.lua',
  'folke/which-key.nvim',
  'nvim-pack/nvim-spectre',
  'tpope/vim-surround',
  'wellle/targets.vim',
}

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
