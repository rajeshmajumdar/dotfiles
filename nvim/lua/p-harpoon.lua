require('harpoon').setup{}

vim.keymap.set('n', '<leader>hm', "<cmd>lua require('harpoon.mark').add_file()<cr>", {desc='Harpoon mark'})
vim.keymap.set('n', '<leader>hl', "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", {desc='Harpoon list'})

for i = 1, 5 do
  vim.keymap.set('n', string.format("<space>%s", i), string.format("<cmd>lua require('harpoon.ui').nav_file(%s)<cr>", i), {desc='Harpoon navigation'})
end
