local keymap = vim.keymap

keymap.set("n", "<leader>gs", vim.cmd.Git)
keymap.set("n", "<leader>gp", "<cmd>G push<cr>")
