local function lsp_status()
  local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
  local clients = vim.lsp.get_clients()
  local attached_lsps = {}
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      table.insert(attached_lsps, client.name)
    end
  end
  if next(attached_lsps) == nil then
    return "No Active LSP"
  end
  return " LSP: " .. table.concat(attached_lsps, ", ")
end

return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts["sections"] = {
      lualine_a = { "mode" },
      lualine_b = { { "filename", path = 1 }, "searchcount" },
      lualine_c = { "%=", lsp_status },

      lualine_x = { "diagnostics" },
      lualine_y = { "branch", "diff" },
      lualine_z = { "location" },
    }
  end,
}
