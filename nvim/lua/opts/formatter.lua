require('conform').setup {
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'ruff_fix', 'ruff_organize_imports', 'ruff_format' },
    rust = { 'rustfmt' },
    c = { 'clang-format' },
    cpp = { 'clang-format' },
    h = { 'clang-format' },
    hpp = { 'clang-format' },

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
