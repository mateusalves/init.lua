local function enable_interview_mode()
    vim.g.interview_mode = true

    -- Keep useful editor settings
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true

    -- Disable diagnostics noise
    vim.diagnostic.config({
        virtual_text = false,
        signs = false,
        underline = false,
        update_in_insert = false,
    })
    vim.diagnostic.hide()

    -- Disable completion
    pcall(function()
        local cmp = require("cmp")
        cmp.setup({ enabled = false })
        cmp.setup.buffer({ enabled = false })
    end)

    -- Stop active LSP clients
    pcall(function()
        vim.cmd("LspStop")
    end)

    print("Interview mode ON: autocomplete, LSP, and diagnostics disabled")
end

local function disable_interview_mode()
    vim.g.interview_mode = false

    -- Re-enable diagnostics
    vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
    })
    vim.diagnostic.show()

    -- Re-enable completion
    pcall(function()
        local cmp = require("cmp")
        cmp.setup({ enabled = true })
        cmp.setup.buffer({ enabled = true })
    end)

    -- Restart LSP
    pcall(function()
        vim.cmd("LspStart")
    end)

    print("Interview mode OFF: autocomplete, LSP, and diagnostics re-enabled")
end

vim.api.nvim_create_user_command("InterviewMode", enable_interview_mode, {})
vim.api.nvim_create_user_command("InterviewModeOff", disable_interview_mode, {})
