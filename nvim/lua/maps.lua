vim.g.mapleader = ' '
local keymap = vim.keymap

-- Basic mappings for saving and quiting nvim
keymap.set('n', '<leader>q', '<cmd>q<cr>')
keymap.set('n', '<leader>w', '<cmd>w<cr>')
keymap.set('n', '<leader>x', '<cmd>x<cr>')
keymap.set('n', ';', ':')

-- Select all
keymap.set('n', '<c-a>', 'gg<S-v>G')

-- Vertically split neovim
keymap.set('n', '<leader>s', ':vsplit<Return><C-w>w', { silent = true })

-- Keymaps for moving cursor to start and end of the line
keymap.set('n', 'H', '^')
keymap.set('n', 'L', '$')

-- Moving lines up and down
keymap.set('n', '<leader>j', '<cmd>m .+1<cr>==', { noremap = true })
keymap.set('n', '<leader>k', '<cmd>m .-2<cr>==', { noremap = true })
keymap.set('v', '<leader>j', "<cmd>m '>+1<cr>gv=gv", { noremap = true })
keymap.set('v', '<leader>k', "<cmd>m '<-2<cr>gv=gv", { noremap = true })

-- Moving in the file
keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')

-- Search terms in middle
keymap.set('n', 'n', 'nzzzv')
keymap.set('n', 'N', 'Nzzzv')

-- Delete and paste at the current cursor
keymap.set('x', '<leader>p', "\"_dP")

-- "jk" to Esc
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {})

-- Turn the word under cursor to upper case
keymap.set("i", "<C-u>", "<Esc>viwUea")

-- Turn the current word into title case
keymap.set("i", "<C-t>", "<Esc>b~lea")

-- Quick formatting
keymap.set('n', "<leader>f", function()
  vim.lsp.buf.format()
end)

-- Edit and reload nvim config file quickly
keymap.set("n", "<leader>ev", "<cmd>tabnew $MYVIMRC <bar> tcd %:h<CR>", {
  silent = true,
  desc = "open init.lua",
})

keymap.set("n", "<leader>sv", function()
  vim.cmd([[
    update $MYVIMRC
    source $MYVIMRC
  ]])
  vim.notify("Nvim config successfully reloaded!", vim.log.levels.INFO, { title = "nvim-config" })
end, {
    silent = true,
    desc = "reload init.lua"
  }
)

-- Always use very magic mode for searching
keymap.set("n", "/", [[/\v]])
