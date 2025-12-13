vim.cmd [[source $HOME/.config/nvim/settings.vim]]

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim' -- Lazy bootstrap starts here
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath) -- Ends here, this should be left alone.

require('lazy').setup('plugins', { ui = { border = 'rounded' }, lockfile = '~/.nvim-lazy-lock.json' })

require 'setup'
