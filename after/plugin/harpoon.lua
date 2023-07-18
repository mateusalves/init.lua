local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = '[a]dd file to harpoon' })
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = 'toggle harpoon menu' })

vim.keymap.set("n", "<leader>7", function() ui.nav_file(1) end, { desc = 'Quick open file in position 1' })
vim.keymap.set("n", "<leader>8", function() ui.nav_file(2) end, { desc = 'Quick open file in position 2' })
vim.keymap.set("n", "<leader>9", function() ui.nav_file(3) end, { desc = 'Quick open file in position 3' })
vim.keymap.set("n", "<leader>0", function() ui.nav_file(4) end, { desc = 'Quick open file in position 4' })
