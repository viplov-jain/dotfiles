local niv = { 'n', 'i', 'v' }
local nv = { 'n', 'v' }
local telescope = require 'telescope.builtin'
local gitsigns = require 'gitsigns'

M = {}
M.global_maps = {
  -- Remappings
  -- Match centering
  { 'n', 'nzz', desc = 'Next Match' },
  { 'N', 'Nzz', desc = 'Previous match' },
  -- Format on paste
  { 'p', 'p==', desc = 'Paste' },

  { '<leader>n', '<Cmd>NvimTreeToggle<CR>', desc = 'Nvim Tree toggle', mode = nv },

  -- Alt key
  -- Move lines
  { '<C-k>', ":m '<-2<CR>gv=gv", desc = 'Move selected lines up', mode = 'v' },
  { '<C-k>', ':m .-2<cr>==', desc = 'Move selected lines up' },
  { '<C-j>', ":m '>+1<CR>gv=gv", desc = 'Move selected lines down', mode = 'v' },
  { '<C-j>', ':m .+1<cr>==', desc = 'Move selected lines down' },
  -- Bufferline controls
  { '<C-n>', '<Cmd>enew<CR>', desc = 'New buffer', mode = niv },
  { '<C-l>', '<Cmd>bnext<CR>', desc = 'Next buffer', mode = niv },
  { '<C-h>', '<Cmd>bprevious<CR>', desc = 'Previous buffer', mode = niv },
  { '<C-q>', '<Cmd>bd<CR>', desc = 'Close buffer', mode = niv },

  -- Indent/Unindent with Tab/Shift+Tab
  { '<Tab>', '>>', desc = 'Indent', mode = nv },
  { '<S-Tab>', '<<', desc = 'Unindent', mode = nv },

  { '<leader>f', group = '[F]ind', icon = '' },
  { '<leader>t', group = '[T]rouble', icon = '' },

  -- Search
  { '<leader>ff', telescope.find_files, desc = '[F]ind [f]ile' },
  { '<leader>fg', telescope.live_grep, desc = '[F]ind [g]rep' },
  { '<leader>fb', telescope.buffers, desc = '[F]ind [b]uffers' },
  { '<leader>fh', telescope.help_tags, desc = '[F]ind [h]elp' },
  {
    '<leader>fs',
    function()
      telescope.grep_string { shorten_path = true, word_match = '-w', only_sort_text = true, search = '' }
    end,
    desc = '[F]ind [S]tring fuzzy',
  },

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

  { '<leader>h', group = 'Git [H]unk', icon = '󰊢' },
  -- Actions
  { '<leader>hr', gitsigns.reset_hunk, desc = '[R]eset' },
  {
    '<leader>hr',
    function()
      gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
    end,
    desc = '[R]eset',
    mode = 'v',
  },
  { '<leader>hR', gitsigns.reset_buffer, desc = '[R]eset buffer' },
  { '<leader>hp', gitsigns.preview_hunk, desc = '[P]review' },
  {
    '<leader>hb',
    function()
      gitsigns.blame_line { full = true }
    end,
    desc = '[B]lame',
  },
  { '<leader>hd', gitsigns.diffthis, desc = '[D]iff' },
  {
    '<leader>hD',
    function()
      gitsigns.diffthis '~'
    end,
    desc = '[D]iff ~',
  },

  -- Text object
  { 'ih', ':<C-U>Gitsigns select_hunk<CR>', desc = '[H]unk text object', mode = { 'o', 'x' } },
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
  map('<leader>k', '<Cmd>Lspsaga hover_doc<CR>', 'Hover doc')
  map('<leader>lf', '<Cmd>Lspsaga finder<CR>', '[L]sp [F]ind')

  map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
  map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  map('<leader>rn', '<Cmd>Lspsaga rename<CR>', '[R]e[n]ame')
  map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

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
