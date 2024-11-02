--- @module "conform"
--- @type conform.setupOpts
return {
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'ruff_fix', 'ruff_organize_imports', 'ruff_format' },
    javascript = { 'prettier' },
  },
  format_on_save = { timeout_ms = 500 },
}
