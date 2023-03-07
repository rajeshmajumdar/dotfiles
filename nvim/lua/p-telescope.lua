local builtin = require('telescope.builtin')
local keymap = vim.keymap

keymap.set('n', '<leader>f', builtin.find_files, {})
keymap.set('n', '<leader>g', builtin.current_buffer_fuzzy_find, {})
keymap.set('n', '<leader>k', builtin.keymaps, {})
keymap.set('n', '<leader>b', builtin.buffers, {})

keymap.set('n', '<leader>lr', builtin.lsp_references, {})
keymap.set('n', '<leader>lws', builtin.lsp_workspace_symbols, {})
keymap.set('n', '<leader>li', builtin.lsp_implementations, {})
keymap.set('n', '<leader>ld', builtin.lsp_definitions, {})
keymap.set('n', '<leader>ltd', builtin.lsp_type_definitions, {})

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

-- ඞ
