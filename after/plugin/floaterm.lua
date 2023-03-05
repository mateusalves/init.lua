vim.keymap.set("n", "<leader>ft", ':FloatermToggle<CR>')
vim.keymap.set("t", "<leader>ft", '<C-\\><C-n>:FloatermToggle<CR>')
vim.keymap.set("n", "<leader>bft", ":FloatermNew! --tittle=workdir cd %:p:h<cr>")

vim.keymap.set("n", "<leader>dft", ":FloatermNew! --tittle=dotfiles cd ${HOME}/versioning/dotfiles<cr>")


