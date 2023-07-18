vim.g.mapleader = " "

vim.keymap.set("x", "<c-c>", "<esc>", { desc = 'Remaping ESC' })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = 'Vim builtin file explorer' })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Sent this line down [visual]' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Sent this line up [visual]' })
vim.keymap.set("n", "<leader>j", ":m .+1<CR>==", { desc = 'Sent this line down' })
vim.keymap.set("n", "<leader>k", ":m .-2<CR>==", { desc = 'Sent this line up' })

vim.keymap.set("n", "J", "mzJ`z", { desc = 'Append the line below to this line' })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = 'Down half page but keep in center' })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = 'Up half page but keep in center' })
vim.keymap.set("n", "n", "nzzzv", { desc = 'Search down but keep in center' })
vim.keymap.set("n", "N", "Nzzzv", { desc = 'Search up but keep in center' })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = 'Paste over a text without overwriting the register' })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y", { desc = 'Copy it to register' })
vim.keymap.set("n", "<leader>Y", "gg\"+yG", { desc = 'Copy whole file to register' })
vim.keymap.set("n", "Y", "y$", { desc = 'Copy from this point to the end' })

vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d", { desc = 'Delete it with no yank' })

vim.keymap.set("n", "Q", "<nop>", { desc = 'NOP' })

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = 'Format with LSP' })

vim.keymap.set("n", "q<C-j>", "<cmd>cprev<CR>zz", { desc = '[q]uick fix list previous' })
vim.keymap.set("n", "q<C-k>", "<cmd>cnext<CR>zz", { desc = '[q]uick fix list next' })

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = '[s]ubstitute this word globally' })
vim.keymap.set("n", "<leader>n", ":/\\<<C-r><C-w>\\><CR>", { desc = 'Search this word' })
vim.keymap.set("v", "<leader>n", "y/\\V<C-r>=escape(@\",'/\\')<CR><CR>", { desc = 'Search this selection' })

vim.keymap.set("n", "<leader>so", ":so<cr>", { desc = '[s][o]urce this file' })

vim.keymap.set("n", "<leader>;", "A;<Esc>", { desc = 'Append [;] to the end of this line' })

vim.keymap.set("n", "<c-s>", ":update<cr>", { desc = 'Save file if modified' })
vim.keymap.set("i", "<c-s>", "<esc>:update<cr>", { desc = 'Save file if modified' })
vim.keymap.set("n", "<leader>q", ":q!<cr>", { desc = 'Forced [q]uit without saving' })

vim.keymap.set("n", "<leader>.", ":bn<cr>", { desc = 'next buffer' })
vim.keymap.set("n", "<leader>,", ":bp<cr>", { desc = 'previous buffer' })
vim.keymap.set("n", "<leader>m", ":bd<cr>", { desc = 'close buffer' })

vim.keymap.set("n", "<leader>+", ":resize +5<cr>", { desc = 'Increase window height' })
vim.keymap.set("n", "<leader>_", ":resize -5<cr>", { desc = 'Decrease window height' })
vim.keymap.set("n", "<leader>=", ":vertical resize +5<cr>", { desc = 'Increase window width' })
vim.keymap.set("n", "<leader>-", ":vertical resize -5<cr>", { desc = 'Decrease window Width' })
vim.keymap.set("n", "Zi", "<c-w>_<c-w>|\\|<c-w>\\|", { desc = '[Z]oom [i]n' })
vim.keymap.set("n", "Zo", "<c-w>=", { desc = '[Z]oom [o]ut' })

vim.keymap.set("i", "<c-h>", "<Left>" , { desc = 'Left on insert mode' })
vim.keymap.set("i", "<c-j>", "<Down>" , { desc = 'Down on insert mode' })
vim.keymap.set("i", "<c-k>", "<Up>"   , { desc = 'Up on insert mode' })
vim.keymap.set("i", "<c-l>", "<Right>", { desc = 'Right on insert mode' })

vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", { silent = true }, { desc = 'Left on insert mode' })
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", { silent = true }, { desc = 'Down on insert mode' })
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", { silent = true }, { desc = 'Up on normal mode' })
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", { silent = true }, { desc = 'right on insert mode' })

vim.keymap.set("n", ";sh", ":split<cr>" , { desc = '[s]plit [h]orizontally' })
vim.keymap.set("n", ";sj", ":vsplit<cr>", { desc = '[s]plit vertically' })

vim.keymap.set("n", ";st", "bistd::<c-c>e", { silent = true}, { desc = 'add std:: before a word' }) -- I keep forgetting sometimes

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }, { desc = 'Make the current script executable' })

vim.keymap.set("n", "<leader>ev", ":e $MYVIMRC<cr>", { desc = 'Op[e]n MY[v]IMRC' })
vim.keymap.set("n", "<leader>vpp", "<cmd>e ${HOME}/.config/nvim/lua/kirch/plugins.lua<CR>", { desc = '[v]iew [p]lugins [p]lease? haha' })
vim.keymap.set("n", "<leader>vtt", "<cmd>e ${HOME}/.tmux.conf<CR>", { desc = '[v]iew [t]mux [t]hing haha' })

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ${HOME}/bin/tmux-sessionizer<CR>", { desc = 'Tmux sessionizer dir' })
