local M = {}

M.integrations = {}
M.integrations.native_lsp = {
  underlines = {
    errors = { 'undercurl' },
    hints = { 'undercurl' },
    warnings = { 'undercurl' },
    information = { 'undercurl' },
    ok = { 'undercurl' },
  },
}

return M
