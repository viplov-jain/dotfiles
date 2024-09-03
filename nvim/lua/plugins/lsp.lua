return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"williamboman/mason.nvim",
				lazy = false,
				opts = {
					ensure_installed = {
						"ast-grep",
						"clangd",
						"clang-format",
						"codelldb",
						"delve",
						"deno",
						"lua-language-server",
						"stylua",
						"mdformat",
						"prettier",
						"python-lsp-server",
						"rust-analyzer",
					},
				},
			},
			{
				"williamboman/mason-lspconfig.nvim",
				lazy = false,
				opts = {
					auto_install = true,
				},
			},
		},
		config = function()
			require("lsp.lspattach")
			require("lsp.lspconfig")
		end,
	},
}
