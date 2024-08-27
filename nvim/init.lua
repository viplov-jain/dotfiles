-- Error theme:
vim.cmd("colorscheme habamax")
--0=========================================================================0
-- █▀ █▀▀ ▀█▀ ▀█▀ █ █▄░█ █▀▀ █▀
-- ▄█ ██▄ ░█░ ░█░ █ █░▀█ █▄█ ▄█
--0=========================================================================0

-- Global Settings
vim.g.mapleader = " " -- Setting the leader key

-- Keymap Variables
local remap = vim.keymap.set

-- Terminal and Title Settings
vim.opt.title = true
vim.opt.titlestring = "%t"

-- Indentation and Formatting Settings
vim.opt.autoindent = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smarttab = true
vim.opt.tabstop = 4

-- Display Settings
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.mouse = "a"
vim.opt.showcmd = true
vim.opt.timeoutlen = 300
vim.opt.wildmenu = true
vim.opt.wrap = false
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.updatetime = 50
vim.opt.scrolloff = 5
vim.opt.signcolumn = "yes"

-- List and Match Settings
vim.opt.list = true
vim.opt.listchars = { tab = "  ", leadmultispace = "│   " }
vim.opt.showmatch = true

-- GUI and Encoding Settings
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.encoding = "utf-8"

-- Search and Case Settings
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.smartindent = true

-- Line Number Settings
vim.opt.number = true
--0=========================================================================0
-- █▀█ █▀▀ █▀▄▀█ ▄▀█ █▀█ █▀
-- █▀▄ ██▄ █░▀░█ █▀█ █▀▀ ▄█
--0=========================================================================0
-- QOL:
-- Search centering
remap("n", "n", "nzz")
remap("n", "N", "Nzz")
-- Format pasted line
remap("n", "p", "p==")

-- Save file
remap("n", "<C-s>", ":w<CR>")
-- Move selected lines with alt arrows like in subl
remap("v", "<A-k>", ":m '<-2<CR>gv=gv")
remap("v", "<A-j>", ":m '>+1<CR>gv=gv")
remap("n", "<A-k>", ":m .-2<cr>==")
remap("n", "<A-j>", ":m .+1<cr>==")
-- Indent/Unindent selected text with Tab and Shift+Tab
remap("v", ">", ">gv")
remap("v", "<", "<gv")
-- Remove search HL
remap("n", "<leader>nh", "<Cmd>nohlsearch<CR>")
-- New buffer
remap("n", "<leader>t", ":enew<CR>")
-- Next buffer
remap("n", "<Tab>", "<Cmd>bnext<CR>")
-- Previous buffer
remap("n", "<S-Tab>", "<Cmd>bprevious<CR>")
-- Quit current buffer
remap("n", "<leader>q", "<Cmd>bd<CR>")

-- Autoformat
remap("n", "<leader>f", ":Neoformat<CR>")

--0=========================================================================0
-- █░░ ▄▀█ ▀█ █▄█
-- █▄▄ █▀█ █▄ ░█░
--0=========================================================================0
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" -- Lazy bootstrap starts here
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath) -- Ends here, this should be left alone.
--0=========================================================================0
-- █▀█ █░░ █░█ █▀▀ █ █▄░█ █▀   █▀ ▀█▀ ▄▀█ █▀█ ▀█▀   █░█ █▀▀ █▀█ █▀▀
-- █▀▀ █▄▄ █▄█ █▄█ █ █░▀█ ▄█   ▄█ ░█░ █▀█ █▀▄ ░█░   █▀█ ██▄ █▀▄ ██▄
--0=========================================================================0
require("lazy").setup({
	{
		"folke/tokyonight.nvim", -- this is the theme
		config = function()
			vim.cmd("colorscheme tokyonight-night") -- this applies the theme
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	{
		"terrortylor/nvim-comment",
		config = function()
			-- remaps
			remap("n", "?", ":CommentToggle<CR>")
			remap("v", "?", ":CommentToggle<CR>")
			require("nvim_comment").setup()
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		config = function()
			remap("n", "<C-n>", ":Neotree toggle<CR>")
		end,
	},
	--0=============================================================================================0
	-- ▀█▀ █▀▀ █░░ █▀▀ █▀ █▀▀ █▀█ █▀█ █▀▀
	-- ░█░ ██▄ █▄▄ ██▄ ▄█ █▄▄ █▄█ █▀▀ ██▄
	--0=============================================================================================0
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			-- remaps
			local builtin = require("telescope.builtin")
			remap("n", "<leader>ff", builtin.find_files)
			remap("n", "<leader>fg", builtin.live_grep)
			remap("n", "<leader>fb", builtin.buffers)
			remap("n", "<leader>fh", builtin.help_tags)
			-- telescope's setup
			require("telescope").setup({
				defaults = {
					sorting_strategy = "ascending",
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_width = 0.5,
							results_width = 0.5,
							height = 0.8,
							preview_cutoff = 120,
						},
					},
				},
			})
		end,
	},
	--0=============================================================================================0
	-- █▀█ █ █░░
	-- █▄█ █ █▄▄
	--0=============================================================================================0
	{
		"stevearc/oil.nvim",
		config = function()
			-- remaps
			remap("n", "<leader>o", ":Oil<CR>")
			require("oil").setup({
				default_file_explorer = true,
				keymaps = {
					["<C-s>"] = ":w<CR>",
				},
				view_options = { show_hidden = true },
			})
		end,
	},
	--0=============================================================================================0
	-- █▄▄ █░█ █▀▀ █▀▀ █▀▀ █▀█ █░░ █ █▄░█ █▀▀
	-- █▄█ █▄█ █▀░ █▀░ ██▄ █▀▄ █▄▄ █ █░▀█ ██▄
	--0=============================================================================================0
	{
		"akinsho/bufferline.nvim",
		version = "*",
		config = function()
			require("bufferline").setup()
		end,
	},
	--0=============================================================================================0
	-- ▀█▀ █▀█ █▀▀ █▀▀ █▀ █░█ █ ▀█▀ ▀█▀ █▀▀ █▀█
	-- ░█░ █▀▄ ██▄ ██▄ ▄█ █▀█ █ ░█░ ░█░ ██▄ █▀▄
	--0=============================================================================================0
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust", "toml", "python" },
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
	--0=============================================================================================0
	-- █░░ █░█ ▄▀█ █░░ █ █▄░█ █▀▀
	-- █▄▄ █▄█ █▀█ █▄▄ █ █░▀█ ██▄
	--0=============================================================================================0
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			vim.o.showmode = false
			require("lualine").setup({
				options = {
					icons_enabled = true,
					-- theme = 'dracula',
				},
				-- this part shows full path, helps navigate in Oil.
				sections = {
					lualine_c = { { "filename", path = 2 } },
				},
			})
		end,
	},
	--0=============================================================================================0
	-- █░░ █▀ █▀█
	-- █▄▄ ▄█ █▀▀
	--0=============================================================================================0
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
	},
	{
		-- Foramtter
		"sbdchd/neoformat",
	},
	{
		-- Rust LSP tools
		"mrcjkb/rustaceanvim",
	},
	{ -- Linting
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				markdown = { "markdownlint" },
			}
			-- To allow other plugins to add linters to require('lint').linters_by_ft,
			-- instead set linters_by_ft like this:
			-- lint.linters_by_ft = lint.linters_by_ft or {}
			-- lint.linters_by_ft['markdown'] = { 'markdownlint' }
			--

			-- Create autocommand which carries out the actual linting
			-- on the specified events.
			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
	--0=============================================================================================0
	-- █▀▀ █▀▄▀█ █▀█
	-- █▄▄ █░▀░█ █▀▀
	--0=============================================================================================0
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
			-- Other:
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			local cmp_ap = require("nvim-autopairs.completion.cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup({})
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				}),
			})
			-- bracket completion for lua
			cmp.event:on("confirm_done", cmp_ap.on_confirm_done())
		end,
	},
}, {
	ui = {
		border = "rounded",
	},
})

--
--0=========================================================================0
-- █▀█ █░░ █░█ █▀▀ █ █▄░█ █▀   █▀▀ █▄░█ █▀▄   █░█ █▀▀ █▀█ █▀▀
-- █▀▀ █▄▄ █▄█ █▄█ █ █░▀█ ▄█   ██▄ █░▀█ █▄▀   █▀█ ██▄ █▀▄ ██▄
--0=========================================================================0
--0=========================================================================0
-- ▄▀█ █░█ ▀█▀ █▀█ █▀▀ █▀▄▀█ █▀▄
-- █▀█ █▄█ ░█░ █▄█ █▄▄ █░▀░█ █▄▀
--0=========================================================================0
-- Highlight yanked text for 150ms
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})
