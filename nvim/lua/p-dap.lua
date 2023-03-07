require('dap-python').setup('/usr/local/bin/python3')
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

vim.fn.sign_define('DapBreakpoint', {text='ඞ', texthl='', linehl='', numhl=''})

local keymap = vim.keymap

keymap.set('n', '<leader>dc', "<cmd>lua require'dap'.continue()<cr>")
keymap.set('n', '<leader>dl', "<cmd>lua require'dap'.step_over()<cr>")
keymap.set('n', '<leader>dj', "<cmd>lua require'dap'.step_into()<cr>")
keymap.set('n', '<leader>dk', "<cmd>lua require'dap'.step_out()<cr>")
keymap.set('n', '<leader>db', "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
keymap.set('n', '<leader>dB', "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
keymap.set('n', '<leader>dm', "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
keymap.set('n', '<leader>dr', "<cmd>lua require'dap'.repl.open()<cr>")
