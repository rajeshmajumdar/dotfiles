local opt = vim.opt

opt.list = true
opt.termguicolors = true
opt.listchars:append "eol:↴"

require("indent_blankline").setup {
  show_end_of_line = true,
  show_current_context = false,
  show_trailing_blankline_indent = false,
  char = "│",
  filetype_exclude = {
    "help",
    "neo-tree",
    "Trouble"
  }
}
