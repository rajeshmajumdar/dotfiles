require('dap-python').setup('/usr/local/bin/python3')
require('dap-go').setup()
require('nvim-dap-virtual-text').setup()
require('dapui').setup()

local dap, dapui = require('dap'), require('dapui')

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
    args = { "--port", "${port}" },
  }
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function ()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  }
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

vim.fn.sign_define('DapBreakpoint', {text='ඞ', texthl='', linehl='', numhl=''})

local keymap = vim.keymap

keymap.set('n', '<leader>dc', "<cmd>lua require'dap'.continue()<cr>", {desc='Debug continue'})
keymap.set('n', '<leader>dl', "<cmd>lua require'dap'.step_over()<cr>", {desc='Debug step-over'})
keymap.set('n', '<leader>dj', "<cmd>lua require'dap'.step_into()<cr>", {desc='Debug step-into'})
keymap.set('n', '<leader>dk', "<cmd>lua require'dap'.step_out()<cr>", {desc='Debug step-out'})
keymap.set('n', '<leader>db', "<cmd>lua require'dap'.toggle_breakpoint()<cr>", {desc='Toggle breakpoints'})
keymap.set('n', '<leader>dB', "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", {desc='Set breakpoints with condition'})
keymap.set('n', '<leader>dm', "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", {desc='Set breakpoints with log'})
keymap.set('n', '<leader>dr', "<cmd>lua require'dap'.repl.open()<cr>", {desc='Debug repl open'})
