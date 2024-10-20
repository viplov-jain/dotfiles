local niv = { 'n', 'i', 'v' }
local telescope = require 'telescope.builtin'

M = {}
M.global_maps = {
  -- Remappings
  -- Match centering
  { 'n', 'nzz', desc = 'Next Match' },
  { 'N', 'Nzz', desc = 'Previous match' },
  -- Format on paste
  { 'p', 'p==', desc = 'Paste' },

  { '<D-s>', '<Cmd>w<CR>', desc = 'Save file', mode = niv },
  { '<D-m>', '<Cmd>NvimTreeToggle<CR>', desc = 'Nvim Tree toggle', mode = niv },

  { '<D-i>', '<Cmd>Lspsaga hover_doc<CR>', desc = 'Hover doc', mode = 'n' },

  -- Alt key
  -- Move lines
  { '<C-k>', ":m '<-2<CR>gv=gv", desc = 'Move selected lines up', mode = 'v' },
  { '<C-k>', ':m .-2<cr>==', desc = 'Move selected lines up' },
  { '<C-j>', ":m '>+1<CR>gv=gv", desc = 'Move selected lines down', mode = 'v' },
  { '<C-j>', ':m .+1<cr>==', desc = 'Move selected lines down' },
  -- Bufferline controls
  { '<D-n>', '<Cmd>enew<CR>', desc = 'New buffer', mode = niv },
  { '<D-Tab>', '<Cmd>bnext<CR>', desc = 'Next buffer', mode = niv },
  { '<D-S-Tab>', '<Cmd>bprevious<CR>', desc = 'Previous buffer', mode = niv },
  { '<D-q>', '<Cmd>bd<CR>', desc = 'Close buffer', mode = niv },

  -- Indent/Unindent with Tab/Shift+Tab
  { '<Tab>', '>>', desc = 'Indent', mode = { 'n', 'v' } },
  { '<S-Tab>', '<<', desc = 'Unindent', mode = { 'n', 'v' } },

  { '<leader>f', group = '[F]ind', icon = '' },
  { '<leader>t', group = '[T]rouble', icon = '' },

  -- Search
  { '<leader>ff', telescope.find_files, desc = '[F]ind [f]ile' },
  { '<leader>fg', telescope.live_grep, desc = '[F]ind [s]tring' },
  { '<leader>fb', telescope.buffers, desc = '[F]ind [b]uffers' },
  { '<leader>fh', telescope.help_tags, desc = '[F]ind [h]elp' },

  -- Trouble
  { '<leader>tt', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (Trouble)' },
  { '<leader>tT', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer Diagnostics (Trouble)' },
  { '<leader>ts', '<cmd>Trouble symbols toggle focus=false<cr>', desc = 'Symbols (Trouble)' },
  {
    '<leader>tl',
    '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
    desc = 'LSP Definitions / references / ... (Trouble)',
  },
  { '<leader>tL', '<cmd>Trouble loclist toggle<cr>', desc = 'Location List (Trouble)' },
  { '<leader>tQ', '<cmd>Trouble qflist toggle<cr>', desc = 'Quickfix List (Trouble)' },
}

M.lsp_remaps = function(event)
  local map = function(keys, func, desc, mode)
    mode = mode or 'n'
    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
  end

  -- Jump to the definition of the word under your cursor.
  --  This is where a variable was first declared, or where a function is defined, etc.
  --  To jump back, press <C-t>.
  map('gd', '<Cmd>Lspsaga goto_definition<CR>', '[G]oto [D]efinition')
  map('ggd', '<Cmd>Lspsaga peek_definition<CR>', 'Peek [D]efinition')
  map('<leader>e', vim.diagnostic.open_float, 'Floating [E]rror')

  map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
  map('<leader>D', '<Cmd>Lspsaga goto_type_definition<CR>', 'Type [D]efinition')
  map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
  map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

  -- The following code creates a keymap to toggle inlay hints in your
  -- code, if the language server you are using supports them
  --
  -- This may be unwanted, since they displace some of your code
  local client = vim.lsp.get_client_by_id(event.data.client_id)
  if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
    map('<leader>th', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
    end, '[T]oggle Inlay [H]ints')
  end
end

return M
