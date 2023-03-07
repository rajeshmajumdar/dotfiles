require('bufferline').setup({
  highlights = {
    buffer_selected = { bold = true },
    diagnostic_selected = { bold = true },
    info_selected = { bold = true },
    info_diagnostic_selected = { bold = true },
    warning_selected = { bold = true },
    warning_diagnostic_selected = { bold = true },
    error_selected = { bold = true },
    error_diagnostic_selected = { bold = true },
  },
  options = {
    show_close_icon = false,
    diagnostics = 'nvim_lsp',
    max_prefix_length = 8,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      if context.buffer:current() then
        return ''
      end
      return ''
    end,
    custom_filter = function(buf_number, buf_numbers)
      if vim.bo[buf_number].filetype ~= 'oil' then
        return true
      end
    end,
  },
})

local keymap = vim.keymap

keymap.set('n', 'gb', '<cmd>BufferLinePick<cr>')
keymap.set('n', '<leader>c', '<cmd>BufferLinePickClose<cr>')
keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>')
keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>')
keymap.set('n', ']b', '<cmd>BufferLineMoveNext<cr>')
keymap.set('n', '[b', '<cmd>BufferLineMovePrev<cr>')
keymap.set('n', 'gs', '<cmd>BufferLineSortByDirectory<cr>')
