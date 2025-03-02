--- @module "conform"
--- @type conform.setupOpts
return {
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'ruff_fix', 'ruff_organize_imports', 'ruff_format' },

    typescript = { 'prettier' },
    typescriptreact = { 'prettier' },
    javascript = { 'prettier' },
    json = { 'prettier' },
    yaml = { 'prettier' },

    nix = { 'nixfmt' },
    toml = { 'taplo' },

    sh = { 'shfmt' },
    zsh = { 'shfmt' },
    bash = { 'shfmt' },
  },
  format_on_save = { timeout_ms = 1000 },
}
