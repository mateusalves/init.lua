vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = '[g]it [s]tatus' })
vim.keymap.set("n", "<leader>gds", ":vertical Gdiffsplit<cr>", { desc = '[g]it [d]iffer [s]tatus' })
vim.keymap.set("n", "gh", "<cmd>diffget //2<cr>", {desc = 'get diff from left side'})
vim.keymap.set("n", "gj", "<cmd>diffget //3<cr>", {desc = 'get diff from right side'})

