return {
    {
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup({
				default_file_explorer = true,
				keymaps = {
					["<C-s>"] = ":w<CR>",
				},
				view_options = { show_hidden = true },
			})
		end,
	},
}
