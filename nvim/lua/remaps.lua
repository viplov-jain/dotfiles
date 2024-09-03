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
	{ "<C-s>", "<Esc><Cmd>w<CR>", desc = "Save file", mode = niv },
	{ "<C-n>", "<Esc><Cmd>Neotree toggle<CR>", desc = "Toggle neotree", mode = niv },
	{ "<C-f>", "<Esc><Cmd>Neoformat<CR>", desc = "Autoformat", mode = niv },
	{ "<C-o>", "<Esc><Cmd>Oil<CR>", desc = "File explorer", mode = niv },

	-- Alt key
	-- Move lines
	{ "<A-k>", ":m '<-2<CR>gv=gv", desc = "Move selected lines up", mode = "v" },
	{ "<A-k>", ":m .-2<cr>==", desc = "Move selected lines up" },
	{ "<A-j>", ":m '>+1<CR>gv=gv", desc = "Move selected lines down", mode = "v" },
	{ "<A-j>", ":m .+1<cr>==", desc = "Move selected lines down" },
	-- Bufferline controls
	{ "<A-t>", "<Esc><Cmd>enew<CR>", desc = "New buffer", mode = niv },
	{ "<A-Tab>", "<Esc><Cmd>bnext<CR>", desc = "Next buffer", mode = niv },
	{ "<A-S-Tab>", "<Esc><Cmd>bprevious<CR>", desc = "Previous buffer", mode = niv },
	{ "<A-q>", "<Esc><Cmd>bd<CR>", desc = "Close buffer", mode = niv },

	-- Indent/Unindent with Tab/Shift+Tab
	{ "<Tab>", ">>", desc = "Indent", mode = { "n", "v" } },
	{ "<S-Tab>", "<<", desc = "Unindent", mode = { "n", "v" } },

	-- Comment toggle
	{ "?", "<Cmd>CommentToggle<CR>", desc = "Comment Toggle", mode = { "n", "v" } },

	-- ░█▀▀░█▀▄░█▀█░█░█░█▀█░█▀▀
	-- ░█░█░█▀▄░█░█░█░█░█▀▀░▀▀█
	-- ░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀░░░▀▀▀

	{ "<leader>s", group = "[S]earch" },
	{ "<leader>d", group = "[D]ebugger" },
	{ "t", group = "[T]erminal" },

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
}

require("which-key").add(mapping)
