-- -std=c++1x #2011 -std=c++1y #2014 -std=c++1z #2017 -std=c++2a #2020
vim.api.nvim_create_autocmd("FileType", {
    pattern = "cpp",
    command = "nnoremap <leader><F4> :w <bar> :FloatermNew --autoclose=0 --title=CPP g++ -std=c++2a -g -Wall % -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && ./a.out<cr><cr>"
    ---o %:t:r -> for name it after the file
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "cpp",
    command = "nnoremap <leader><F5> :w <bar> :FloatermNew! --title=CPP g++ -std=c++2a -g -Wall -Weffc++ % -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG <cr><cr>"
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "cpp",
    command = "nnoremap <leader><F6> :w <bar> :FloatermNew! --title=CPP g++ -std=c++2a -g -Wall -Weffc++ % <cr>"
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "cpp",
    command = "nnoremap <leader><F7> :! g++ -std=c++2a -g -Wall % -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG<CR><CR>"
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "c",
    command = "nnoremap <leader><F4> :w <bar> :FloatermNew  --autoclose=0 --title=C gcc -g -Wall % -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && ./a.out <cr><cr>"
    ---o %:t:r -> for name it after the file
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "c",
    command = "nnoremap <leader><F5> :w <bar> :FloatermNew! --title=C gcc -g -Wall % -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG <cr><cr>"
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "c",
    command = "nnoremap <leader><F6> :w <bar> :FloatermNew! --title=C gcc -g -Wall % <cr>"
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "c",
    command = "nnoremap <leader><F7> :! gcc -g -Wall % -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG<CR><CR>"
    ---o %:t:r -> for name it after the file
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    command = "nnoremap <leader><F5> :w <bar> :FloatermNew! --title=Python python3 % <cr><cr>"
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {"cpp", "c"},
    command = "nnoremap ;h :e %<.h<cr><cr>"
})

local fn = require("kirch.tms")

vim.keymap.set("n", ",c", fn.toggle_comment, { desc = 'toggle [c]omment tms' })
vim.keymap.set("v", ",c", ':lua require("kirch.tms").toggle_comment(true)<CR>', { desc = 'toggle [c]omment tms' })

-- show header file
vim.keymap.set("n", '<leader>r', fn.open_related, { desc = 'open [r]elated files tms' })

-- find with ripgrep
vim.keymap.set("n", '<leader>fr', fn.rg_find, { desc = '[f]ind grep tms' })
vim.keymap.set("n", '<leader>cp', fn.cpp_check, { desc = 'run [cp]p check tms' })
