local ensureInstalled = {
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

local alreadyInstalled = require('nvim-treesitter.config').get_installed()
local parsersToInstall = vim
  .iter(ensureInstalled)
  :filter(function(parser)
    return not vim.tbl_contains(alreadyInstalled, parser)
  end)
  :totable()
require('nvim-treesitter').install(parsersToInstall)
