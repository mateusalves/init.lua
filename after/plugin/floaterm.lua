vim.keymap.set("n", "<leader>ft", ':FloatermToggle<CR>', { desc = 'Toggle Float Terminal' })
vim.keymap.set("t", "<leader>ft", '<C-\\><C-n>:FloatermToggle<CR>', { desc = 'Toggle Float Terminal' })

vim.keymap.set("n", "<leader>bft", ":FloatermNew! --title=workdir cd %:p:h<cr>", { desc = 'Toggle Float Terminal in buffer location' })
vim.keymap.set("n", "<leader>dft", ":FloatermNew! --title=dotfiles cd ${HOME}/versioning/dotfiles<cr>", { desc = 'Toggle Float Terminal in dotfiles repo location' })

--Cmake related
vim.keymap.set("n", "<leader>cg", ":FloatermNew --title=CMakeGenerate --autoclose=0 cd %:p:h && cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=1<cr><cr>", { desc = 'Cmake generate' })
vim.keymap.set("t", "<leader>cg", "cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=1<cr>", { desc = 'Cmake generate' })
vim.keymap.set("n", "<leader>cb", ":FloatermNew --title=CMakeBuild --autoclose=0 cd %:p:h/build && cmake --build .<cr><cr>", { desc = 'Cmake build' })
vim.keymap.set("t", "<leader>cb", "cmake --build .<cr>", { desc = 'Cmake build' })
vim.keymap.set("n", "<leader>cr", ":FloatermNew! --title=CMakeRun cd %:p:h/build<cr>", { desc = 'Cmake run' })
vim.keymap.set("n", "<leader>ct", ":FloatermNew --title=CMakeTests --autoclose=0 cd %:p:h/build && ctest<cr><cr>", { desc = 'Cmake tests' })
vim.keymap.set("n", "<leader>cc", ":FloatermNew --title=CMakeClean --autoclose=0 cd %:p:h && sudo rm -r build<cr><cr>", { desc = 'Cmake clean' })



