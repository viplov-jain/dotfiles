local function lsp_status()
  local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
  local clients = vim.lsp.get_clients()
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      return ' LSP: ' .. client.name
    end
  end
  return 'No Active LSP'
end
return {
  options = {
    component_separators = '',
    section_separators = '',
    globalstatus = true,
    theme = 'catppuccin',
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { { 'filename', path = 1 }, 'searchcount' },
    lualine_c = { '%=', lsp_status },

    lualine_x = { 'diagnostics' },
    lualine_y = { 'branch', 'diff' },
    lualine_z = { 'location' },
  },
  extensions = { 'nvim-tree', 'lazy', 'nvim-dap-ui', 'oil', 'toggleterm', 'trouble' },
}
