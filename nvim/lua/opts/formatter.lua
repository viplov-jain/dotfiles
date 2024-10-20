--- @module "conform"
--- @type conform.setupOpts
return {
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'black', 'isort' },
    javascript = { 'prettier' },
  },
  format_on_save = { timeout_ms = 500 },
}
