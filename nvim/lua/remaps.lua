local niv = { "n", "i", "v" }
local telescope = require("telescope.builtin")

local mapping = {
	-- Remappings
	-- Match centering
	{ "n", "nzz", desc = "Next Match" },
	{ "N", "Nzz", desc = "Previous match" },
	-- Format on paste
	{ "p", "p==", desc = "Paste" },

	-- Control key
	{ "<C-s>", "<Cmd>w<CR>", desc = "Save file", mode = niv },
	{ "<C-n>", "<Cmd>Neotree toggle<CR>", desc = "Toggle [N]eotree", mode = niv },
	{ "<C-f>", "<Cmd>lua require('conform').format({ async = true })<CR>", desc = "[F]ormat buffer", mode = niv },
	{ "<C-z>", "<Cmd>ZenMode<CR>", desc = "Toggle Zen Mode", mode = niv },

	-- Alt key
	-- Move lines
	{ "<A-k>", ":m '<-2<CR>gv=gv", desc = "Move selected lines up", mode = "v" },
	{ "<A-k>", ":m .-2<cr>==", desc = "Move selected lines up" },
	{ "<A-j>", ":m '>+1<CR>gv=gv", desc = "Move selected lines down", mode = "v" },
	{ "<A-j>", ":m .+1<cr>==", desc = "Move selected lines down" },
	-- Bufferline controls
	{ "<A-t>", "<Cmd>enew<CR>", desc = "New buffer", mode = niv },
	{ "<A-Tab>", "<Cmd>bnext<CR>", desc = "Next buffer", mode = niv },
	{ "<A-S-Tab>", "<Cmd>bprevious<CR>", desc = "Previous buffer", mode = niv },
	{ "<A-q>", "<Cmd>bd<CR>", desc = "Close buffer", mode = niv },

	-- Indent/Unindent with Tab/Shift+Tab
	{ "<Tab>", ">>", desc = "Indent", mode = { "n", "v" } },
	{ "<S-Tab>", "<<", desc = "Unindent", mode = { "n", "v" } },

	-- Comment toggle
	{ "?", "<Cmd>CommentToggle<CR>", desc = "Comment Toggle", mode = { "n", "v" } },

	{ "<leader>oo", "<Cmd>Oil<CR>", desc = "File explorer" },

	-- ░█▀▀░█▀▄░█▀█░█░█░█▀█░█▀▀
	-- ░█░█░█▀▄░█░█░█░█░█▀▀░▀▀█
	-- ░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀░░░▀▀▀

	{ "<leader>s", group = "[S]earch", icon = "" },
	{ "<leader>d", group = "[D]ebugger", icon = "" },
	{ "<leader>t", group = "[T]rouble", icon = "" },
	{ "t", group = "[T]erminal", icon = "" },

	-- Search
	{ "<leader>sf", telescope.find_files, desc = "Search file" },
	{ "<leader>sg", telescope.live_grep, desc = "Search grep" },
	{ "<leader>sb", telescope.buffers, desc = "Search buffers" },
	{ "<leader>sh", telescope.help_tags, desc = "Search help" },

	-- Debugger
	{ "<leader>db", "<Cmd> DapToggleBreakpoint <CR>", desc = "Toggle breakpoint at line" },
	{ "<leader>dr", "<Cmd> DapContinue <CR>", desc = "Start or continue the debugger" },

	-- Terminal
	{ "tg", "<Cmd> lua _LAZYGIT_TOGGLE() <CR>", desc = "Toggle lazygit" },
	{ "tb", "<Cmd> lua _BTOP_TOGGLE() <CR>", desc = "Toggle btop" },

	-- Trouble
	{ "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
	{ "<leader>tT", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
	{ "<leader>ts", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
	{
		"<leader>tl",
		"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
		desc = "LSP Definitions / references / ... (Trouble)",
	},
	{ "<leader>tL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
	{ "<leader>tQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
}

require("which-key").add(mapping)
