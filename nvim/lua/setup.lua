-- Highlight yanked text for 150ms
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Autosave on save
vim.api.nvim_create_augroup('__formatter__', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  group = '__formatter__',
  command = ':FormatWrite',
})

-- Setup fzf in telescope
require('telescope').load_extension 'fzf'

-- Setup key maps
require('which-key').add(require('remaps').global_maps)
