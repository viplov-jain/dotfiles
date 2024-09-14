return {
	{
		-- Foramtter
		"mhartington/formatter.nvim",
    version = "*",
    cmd = { "Format", "FormatWrite" },
    config = function ()
      vim.api.nvim_create_augroup("__formatter__", { clear = true })
      vim.api.nvim_create_autocmd("BufWritePost", {
	      group = "__formatter__",
	      command = ":FormatWrite",
      })
      
      require("formatter").setup({
        logging = true,
			  -- Set the log level
			  log_level = vim.log.levels.ERROR,
        filetype = {
          lua = {require("formatter.filetypes.lua").stylua,},
          cpp = {require("formatter.filetypes.lua").clangformat,},
          javascript = {require("formatter.filetypes.javascript").prettier,},
          python = {require("formatter.filetypes.python").black,},
          rust = {require("formatter.filetypes.rust").rustfmt},
        }
      })
    end
	},
}
