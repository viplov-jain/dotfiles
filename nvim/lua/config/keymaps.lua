local map = LazyVim.safe_keymap_set

map("n", "<leader>k", vim.lsp.buf.hover, { desc = "Hover doc" })
