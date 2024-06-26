vim.keymap.set('n', '<F5>', require('dap').continue, { desc = 'dap continue' })
vim.keymap.set('n', '<F6>', require('dap').step_over, { desc = 'dap step_over' })
vim.keymap.set('n', '<F7>', require('dap').continue, { desc = 'dap continue' })
vim.keymap.set('n', '<F8>', require('dap').step_into, { desc = 'dap step_into' })
vim.keymap.set('n', '<F9>', require('dap').step_out, { desc = 'dap step_out' })
vim.keymap.set('n', '<leader>b', require('dap').toggle_breakpoint, { desc = 'dap toggle breakpoint' })
vim.keymap.set('n', '<leader>B', ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", { desc = 'dap conditional breakpoint'})
vim.keymap.set('n', '<leader>lp', ":lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", { desc = 'dap log point message'})
vim.keymap.set('n', '<leader>dc', require('dap').close, { desc = 'close dap'})
vim.keymap.set('n', '<leader>dbc', require('dap').clear_breakpoints, { desc = '[d]ap [b]reakpoint [c]lear'})
vim.keymap.set('n', '<leader>dr', ":lua require('dapui').open({reset=true})<cr>", { desc = 'reset dap ui'})
vim.keymap.set('n', '<leader>dk', ":lua require('dapui').close()<cr>", { desc = 'close dap ui'})
vim.keymap.set('n', '<Leader>drp', function() require('dap').repl.open() end)

vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end, { desc = 'Dap hover'})
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end, { desc = 'Dap preview'})
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end, { desc = 'Dap frames on centered float'})
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end, { desc = 'Dap stack call on centered float'})

require('telescope').load_extension('dap')

local dap, dapui = require("dap"), require("dapui")

--dap.defaults.fallback.external_terminal = {
  --command = '/usr/bin/alacritty';
  --args = {'-e'};
--}

--dap.adapters.lldb = {
  --type = "executable",
  --command = "/usr/bin/lldb-vscode-11",
  --name = "lldb",
--}

dap.adapters.cppdbg = {
  type = 'executable',
  id = 'cppdbg',
  --command = '/mnt/d/versioning/dotfiles/extension/debugAdapters/bin/OpenDebugAD7',
  command = '/usr/bin/lldb-vscode',
}

dap.adapters.gdb = {
  type = 'executable',
  command = 'gdb',
  --command = '/mnt/d/versioning/dotfiles/extension/debugAdapters/bin/OpenDebugAD7',
  args = {"-i", "dap"}
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    --type = "cppdbg",
    type = "gdb",
    request = "launch",
    setupCommands = {
      {
        text = '-enable-pretty-printing',
        description = 'enable pretty printing',
        ignoreFailures = false
      },
    },
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = false,
  },
  --{
    --name = 'Attach to gdbserver :1234',
    --type = 'cppdbg',
    --request = 'launch',
    --MIMode = 'gdb',
    --miDebuggerServerAddress = 'localhost:1234',
    --miDebuggerPath = '/usr/bin/gdb',
    --cwd = '${workspaceFolder}',
    --setupCommands = {
      --{
        --text = '-enable-pretty-printing',
        --description = 'enable pretty printing',
        --ignoreFailures = false
      --},
    --},
    --program = function()
      --return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    --end,
  --},
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

require('dapui').setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

