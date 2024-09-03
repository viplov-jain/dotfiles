-- Keyremap Variables
local remap = function(keys, func, desc, mode)
	vim.keymap.set(mode or "n", keys, func, { desc = desc })
end

-- QOL:
-- Search centering
remap("n", "nzz", "Next match")
remap("N", "Nzz", "Previous match")
-- Format pasted line
remap("p", "p==", "Paste")

-- Save file
remap("<C-s>", ":w<CR>", "Save file")
-- Move selected lines with alt arrows like in subl
remap("<A-k>", ":m '<-2<CR>gv=gv", "Move selected lines up", "v")
remap("<A-j>", ":m '>+1<CR>gv=gv", "Move selected lines down", "v")
remap("<A-k>", ":m .-2<cr>==", "Move selected lines up")
remap("<A-j>", ":m .+1<cr>==", "Move selected lines down")

-- Indent/Unindent selected text with Tab and Shift+Tab
remap("<Tab>", ">>", "Indent", { "n", "v" })
remap("<S-Tab>", "<<", "Unindent", { "n", "v" })

-- Comment toggle
remap("?", ":CommentToggle<CR>", "Comment Toggle", { "n", "v" })

-- Tab controls
remap("<leader>bt", ":enew<CR>", "New buffer")
remap("<leader>bn", "<Cmd>bnext<CR>", "Next buffer")
remap("<leader>bp", "<Cmd>bprevious<CR>", "Previous buffer")
remap("<leader>bq", "<Cmd>bd<CR>", "Close buffer")

-- Autoformat
remap("<leader>f", ":Neoformat<CR>", "Autoformat")

-- Directory tree sidebar toggle
remap("<C-n>", ":Neotree toggle<CR>", "Toggle neotree")

-- Filesystem explorer
remap("<leader>o", ":Oil<CR>", "Show filesystem")

-- Fuzzy search
local telescope = require("telescope.builtin")
remap("<leader>sf", telescope.find_files, "Search file")
remap("<leader>sg", telescope.live_grep, "Search grep")
remap("<leader>sb", telescope.buffers, "Search buffers")
remap("<leader>sh", telescope.help_tags, "Search help")

-- Debugger
remap("<leader>db", "<Cmd> DapToggleBreakpoint <CR>", "Toggle breakpoint at line")
remap("<leader>dr", "<cmd> DapContinue <CR>", "Start or continue the debugger")
