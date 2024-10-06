return {
  {
    'folke/tokyonight.nvim', -- this is the theme
    config = function()
      vim.cmd 'colorscheme tokyonight-night' -- this applies the theme
    end,
  },
}
