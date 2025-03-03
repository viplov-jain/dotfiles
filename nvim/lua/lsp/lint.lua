require('lint').linters_by_ft = {
  markdown = { 'vale' },
  python = { 'dmypy' },
  json = { 'jsonlint' },
  yaml = { 'yamllint' },
}

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  callback = function()
    require('lint').try_lint()
  end,
})
