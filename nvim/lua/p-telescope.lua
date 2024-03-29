local builtin = require('telescope.builtin')
local keymap = vim.keymap

keymap.set('n', '<leader>f', builtin.find_files, {desc = 'Telescope find files'})
keymap.set('n', '<leader>tbf', builtin.live_grep, {desc = 'Telescope live grep'})

keymap.set('n', '<leader>tk', builtin.keymaps, {desc = 'Telescope keymaps'})
keymap.set('n', '<leader>b', builtin.buffers, {desc = 'Telescope buffers'})

keymap.set('n', '<leader>lr', builtin.lsp_references, {desc = 'Telescope LSP references'})
keymap.set('n', '<leader>lws', builtin.lsp_workspace_symbols, {desc = 'Telescope LSP workspace symbols'})
keymap.set('n', '<leader>li', builtin.lsp_implementations, {desc = 'Telescope LSP implementations'})
keymap.set('n', '<leader>ld', builtin.lsp_definitions, {desc = 'Telescope LSP definitions'})
keymap.set('n', '<leader>ltd', builtin.lsp_type_definitions, {desc = 'Telescope LSP type definitions'})

local actions = require('telescope.actions')

require('nvim-web-devicons').setup({
  override = {},
  default = true
})
require('telescope').setup {
  defaults = {
    path_display = { 'smart' },
    mappings = {
      i = {
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
        ["<esc>"] = actions.close
      }
    }
  },
  layout_config = {
    horizontal = {
      preview_cutoff = 100,
      preview_width = 0.6
    }
  }
}
