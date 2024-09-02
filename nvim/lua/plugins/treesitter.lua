return {
    {
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "rust", "toml", "python" },
				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,
				-- Automatically install missing parsers when entering buffer
				auto_install = false,
				highlight = {
					enable = true,
				},
			})
		end,
	},

}
