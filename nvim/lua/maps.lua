vim.g.mapleader = ' '
local keymap = vim.keymap

keymap.set('n', '<leader>q', '<cmd>q<cr>')
keymap.set('n', '<leader>w', '<cmd>w<cr>')
keymap.set('n', '<leader>x', '<cmd>x<cr>')
keymap.set('n', ';', ':')

keymap.set('n', '<c-a>', 'gg<S-v>G')

keymap.set('n', '<leader>s', ':vsplit<Return><C-w>w', { silent = true })

keymap.set('n', 'H', '^')
keymap.set('n', 'L', '$')

keymap.set('n', '<leader>j', '<cmd>m .+1<cr>==', { noremap = true })
keymap.set('n', '<leader>k', '<cmd>m .-2<cr>==', { noremap = true })
keymap.set('v', '<leader>j', "<cmd>m '>+1<cr>gv=gv")
keymap.set('v', '<leader>k', "<cmd>m '<-2<cr>gv=gv")

vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {})
