local M = {}

M.integrations = {
  native_lsp = {
    underlines = {
      errors = { 'undercurl' },
      hints = { 'undercurl' },
      warnings = { 'undercurl' },
      information = { 'undercurl' },
      ok = { 'undercurl' },
    },
  },
  telescope = {
    enabled = true,
  },
  nvimtree = true,
  lsp_trouble = true,
  which_key = true,
}

return M
