local ensure_installed = {
  'query',
  --'c',
  --'cpp',
  'haskell',
  'nix',
  'rust',
  'go',
  --'zig',
  'kotlin',
  'odin',
  'python',

  'lua',
  'vim',
  'vimdoc',

  'json',
  'toml',
  'xml',
  'yaml',
  'csv',
  'markdown',
  'markdown_inline',
  'proto',
  'thrift',
  'cmake',
  'yuck',

  'dockerfile',
  'nginx',
  'terraform',

  'sql',

  'javascript',
  'typescript',
  'tsx',
  'html',
  'css',
  'graphql',

  'bash',
  'ruby',
  'perl',

  'diff',
  'git_config',
  'git_rebase',
  'gitattributes',
  'gitcommit',
  'gitignore',
}

require('nvim-treesitter.configs').setup {
  ensure_installed = ensure_installed,
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
  },
}
