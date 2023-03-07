require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "help" },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = {}
  }
}
