local map = LazyVim.safe_keymap_set

map({"n", "x"}, "<leader>t", "<cmd>Neotree toggle<cr>", {desc = "Toggle neotree"})
