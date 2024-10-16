require('formatter').setup {
  logging = true,
  log_level = vim.log.levels.ERROR,
  filetype = {
    lua = { require('formatter.filetypes.lua').stylua },
    cpp = { require('formatter.filetypes.lua').clangformat },
    javascript = { require('formatter.filetypes.javascript').prettier },
    python = { require('formatter.filetypes.python').black },
    rust = { require('formatter.filetypes.rust').rustfmt },
  },
}
