local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'clangd',
    'rust_analyzer'
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
    --local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, {buffer = bufnr, remap = false, desc = '[g]o to [d]efinition' })
    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, {buffer = bufnr, remap = false, desc = '[g]o to [D]declaration' })
    vim.keymap.set("n", "gtd", function() vim.lsp.buf.type_definition() end, {buffer = bufnr, remap = false, desc = '[g]o to [t]ype [d]efinition' })
    vim.keymap.set("n", "gI", function() vim.lsp.buf.implementation() end, {buffer = bufnr, remap = false, desc = '[g]o to [I]mplementation' })
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, {buffer = bufnr, remap = false, desc = 'Hover' })
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, {buffer = bufnr, remap = false, desc = '[v]iew [w]orkspace [s]ymbols' })
    --vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    --vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    --vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, {buffer = bufnr, remap = false, desc = '[v]im [c]ode [a]ctions' })
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, {buffer = bufnr, remap = false, desc = '[v]im [r]efe[r]ences' })
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, {buffer = bufnr, remap = false, desc = '[v]im [r]e[n]ame' })
    vim.keymap.set("n", "<leader>sh", function() vim.lsp.buf.signature_help() end, {buffer = bufnr, remap = false, desc = '[v]im [s]ignature [h]elp' })
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

local diagnostics_active = true -- toggle diagnostics
vim.keymap.set('n', '<leader>D', function()
    diagnostics_active = not diagnostics_active
    if diagnostics_active then
        vim.diagnostic.show()
    else
        vim.diagnostic.hide()
    end
end, { desc = 'toogle [D]iagnostics' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>od', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
