local map = LazyVim.safe_keymap_set

map({ "n", "x" }, "<leader>t", "<cmd>Neotree toggle<cr>", { desc = "Toggle neotree" })

map("n", "<leader>k", vim.lsp.buf.hover, { desc = "Hover doc" })
