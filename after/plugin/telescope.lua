--local builtin = require('telescope.builtin')

--vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
--vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
--vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
--vim.keymap.set('n', '<leader>ht', builtin.help_tags, {})
--vim.keymap.set('n', '<leader>tk', builtin.keymaps, {})
--vim.keymap.set('n', '<leader>fs', function()
	--builtin.grep_string({search = vim.fn.input("Grep > ")});
--end)


-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
  pickers = {
    live_grep = {
      file_ignore_patterns = { '.git', '.venv' },
      additional_args = function(_)
        return { "--hidden" }
      end
    },
    find_files = {
      file_ignore_patterns = { '.git', '.venv' },
      hidden = true
    }

  },
  extensions = {
    "fzf"
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>tgs', require('telescope.builtin').git_status, { desc = '[T]elescope [G]it [S]tatus' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>ht', require('telescope.builtin').help_tags, { desc = '[H]elp [T]ags' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>lg', require('telescope.builtin').live_grep, { desc = '[L]ive [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' });
vim.keymap.set('n', '<leader>tk', require('telescope.builtin').keymaps, { desc = '[T]elescope [K]eymaps' })

vim.keymap.set('n', '<leader>gr', require('telescope.builtin').lsp_references, { desc = '[G]oto [R]eferences'})
vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, { desc = '[D]ocument [S]ymbols'})
vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc = '[W]orkspace [S]ymbols'})
