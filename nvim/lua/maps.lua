vim.g.mapleader = ' '
local keymap = vim.keymap

-- Basic mappings for saving and quiting nvim
keymap.set('n', '<leader>q', '<cmd>q<cr>', {desc='Quit'})
keymap.set('n', '<leader>w', '<cmd>w<cr>', {desc='Write'})
keymap.set('n', '<leader>x', '<cmd>x<cr>', {desc='Save and Quit'})
keymap.set('n', ';', ':')

-- Select all
keymap.set('n', '<c-a>', 'gg<S-v>G', {desc='Select all'})

-- Vertically split neovim
keymap.set('n', '<leader>s', ':vsplit<Return><C-w>w', { silent=true, desc='Vertical split' })

-- Keymaps for moving cursor to start and end of the line
keymap.set('n', 'H', '^', {desc='Move cursor to start of the line'})
keymap.set('n', 'L', '$', {desc='Move cursor to end of the line'})

-- Moving lines up and down
keymap.set('n', '<leader>j', '<cmd>m .+1<cr>==', { noremap = true, desc='Move a line down' })
keymap.set('n', '<leader>k', '<cmd>m .-2<cr>==', { noremap = true, desc='Move a line up' })
keymap.set('v', '<leader>j', "<cmd>m '>+1<cr>gv=gv", { noremap = true, desc='Move lines down' })
keymap.set('v', '<leader>k', "<cmd>m '<-2<cr>gv=gv", { noremap = true, desc='Move lines up' })

-- Moving in the file
keymap.set('n', '<S-s>', '<C-d>zz', {desc='Move down quickly.'})
keymap.set('n', '<S-w>', '<C-u>zz', {desc='Move up quickly'})

-- Search terms in middle
keymap.set('n', 'n', 'nzzzv', {desc='Search term in middles'})
keymap.set('n', 'N', 'Nzzzv', {desc='Search term in middles'})

-- Delete and paste at the current cursor
keymap.set('x', '<leader>p', "\"_dP", {desc='Delete and paste at the current cursor'})

-- "jk" to Esc
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {desc='Replacement for <esc>'})

-- Turn the word under cursor to upper case
keymap.set("i", "<C-u>", "<Esc>viwUea", {desc='Turn the word under cursor to upper-case'})

-- Turn the current word into title case
keymap.set("i", "<C-t>", "<Esc>b~lea", {desc='Turn the word under cursor to title-case'})

-- Quick formatting
keymap.set('n', "<leader>f", function()
  vim.lsp.buf.format()
end, {desc='Code formatting'})

-- Buffer mappings
keymap.set('n', '<Tab>', '<cmd>bnext<cr>', {desc='Next buffer'})
keymap.set('n', '<S-Tab>', '<cmd>bprev<cr>', {desc='Previous buffer'})
keymap.set('n', '<S-x>', '<cmd>bdelete<cr>', {desc='Delete buffer'})

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
keymap.set("n", "/", [[/\v]], {desc='Magic search'})
