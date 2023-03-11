--require('rose-pine').setup({
    --disable_background = true
--})
require("catppuccin").setup {
    flavour = "macchiato", -- mocha, macchiato, frappe, latte
    disable_background = true
}

vim.api.nvim_command "colorscheme catppuccin"

function ColorMyPencils(Color)
	--color = color or "rose-pine"
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()

