require('mini.indentscope').setup({
  draw = {
    delay = 100,
    priority = 2,
  },
  mappings = {
    goto_top = '[i',
    goto_bottom = ']i',
  },
  options = {
    border = 'both',
    indent_at_cursor = true,
    try_as_border = true,
  },
  symbol = '╎',
})
