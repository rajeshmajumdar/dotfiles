vim.g.everforest_diagnostic_line_highlight = 1
vim.cmd('colorscheme everforest')

vim.fn.sign_define({
  {
    name = 'DiagnosticSignError',
    text = 'E',
    texthl = 'DiagnosticSignError',
    linehl = 'ErrorLine'
  },
  {
    name = 'DiagnosticSignWarn',
    text = 'W',
    texthl = 'DiagnosticSignWarn',
    linehl = 'WarningLine'
  },
  {
    name = 'DiagnosticSignInfo',
    text = 'I',
    texthl = 'DiagnosticSignInfo',
    linehl = 'InfoLine'
  },
  {
    name = 'DiagnosticSignHint',
    text = 'H',
    texthl = 'DiagnosticSignHint',
    linehl = 'HintLine'
  },
})

require("transparent").setup({
  enable = true
})
