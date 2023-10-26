--require('rose-pine').setup({
    --disable_background = true
--})
require("catppuccin").setup {
    flavour = "macchiato", -- mocha, macchiato, frappe, latte
    disable_background = true,
    integrations = {
      nvimtree = true
    }
}

vim.api.nvim_command "colorscheme catppuccin"
vim.api.nvim_command("autocmd Colorscheme * highlight NvimTreeNormal guibg=none guifg=#9da5b3")

function ColorMyPencils(Color)
	--color = color or "rose-pine"
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()

require("transparent").setup({ -- Optional, you don't have to run setup.
  groups = { -- table: default groups
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLineNr', 'EndOfBuffer',
  },
  extra_groups = {}, -- table: additional groups that should be cleared
  exclude_groups = {}, -- table: groups you don't want to clear
})

vim.keymap.set({"n", "v"}, "<leader>tb", ":TransparentToggle<cr>", {noremap = true,  desc = '[T]oggle [B]ackground'});

