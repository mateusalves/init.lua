vim.g.mapleader = " "

vim.keymap.set("x", "<c-c>", "<esc>")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>j", ":m .+1<CR>==")
vim.keymap.set("n", "<leader>k", ":m .-2<CR>==")

vim.keymap.set("n", "<leader>]", "ddp")
vim.keymap.set("n", "<leader>[", "ddkP")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", "\"_dP")

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "gg\"+yG")
vim.keymap.set("n", "Y", "y$")

vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("x", "<leader>ls", "y:.s/<C-r>\"//g<Left><Left>")
vim.keymap.set("n", "<leader>n", ":/\\<<C-r><C-w>\\><CR>")
vim.keymap.set("v", "<leader>n", "y/\\V<C-r>=escape(@\",'/\\')<CR><CR>")

vim.keymap.set("n", "<leader><leader>", ":so<cr>")

vim.keymap.set("n", "<leader>;", "A;<Esc>")
vim.keymap.set("n", "<leader>ev", ":e $MYVIMRC<cr>")

vim.keymap.set("n", "<c-s>", ":update<cr>")
vim.keymap.set("i", "<c-s>", "<esc>:update<cr>")
vim.keymap.set("n", "<leader>q", ":q!<cr>")

vim.keymap.set("n", "<leader>.", ":bn<cr>")
vim.keymap.set("n", "<leader>,", ":bp<cr>")
vim.keymap.set("n", "<leader>m", ":bd<cr>")

vim.keymap.set("n", "<leader>+", ":resize +5<cr>")
vim.keymap.set("n", "<leader>_", ":resize -5<cr>")
vim.keymap.set("n", "<leader>=", ":vertical resize +5<cr>")
vim.keymap.set("n", "<leader>-", ":vertical resize -5<cr>")
vim.keymap.set("n", "<leader>rp", ":resize 100<cr>")

vim.keymap.set("n", "<leader>gs", ":split G<cr>")
vim.keymap.set("n", "<leader>gds", ":vertical Gdiffsplit<cr>")

vim.keymap.set("i", "<c-h>", "<Left>")
vim.keymap.set("i", "<c-j>", "<Down>")
vim.keymap.set("i", "<c-k>", "<Up>")
vim.keymap.set("i", "<c-l>", "<Right>")

vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", { silent = true })
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", { silent = true })
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", { silent = true })
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", { silent = true })


vim.keymap.set("n", ";sh", ":split<cr>")
vim.keymap.set("n", ";sj", ":vsplit<cr>")

vim.keymap.set("n", ";st", "bistd::<c-c>e", { silent = true}) -- I keep forgetting sometimes

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ${HOME}/.config/nvim/lua/kirch/plugins.lua<CR>");
vim.keymap.set("n", "<leader>vtt", "<cmd>e ${HOME}/.tmux.conf<CR>");

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ${HOME}/bin/tmux-sessionizer<CR>")
vim.keymap.set("n", ";d", "<cmd>silent !tmux splitw -h gdb a.out --tui enable<CR>") -- Need to compile first
