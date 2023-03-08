vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim"
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    tag = 'nightly'
  }

  -- Movement
  use 'ThePrimeagen/harpoon'
  use 'christoomey/vim-tmux-navigator'
  use 'MattesGroeger/vim-bookmarks'
  use 'tom-anders/telescope-vim-bookmarks.nvim'

  -- Colors & UI
  use 'navarasu/onedark.nvim'
  use 'xiyaowong/nvim-transparent'
  use 'j-hui/fidget.nvim'

  -- Text
  use 'windwp/nvim-autopairs'
  use 'tpope/vim-surround'
  use 'mbbill/undotree'
  use 'folke/todo-comments.nvim'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Selection
  use 'mg979/vim-visual-multi'

  -- Git
  use 'tpope/vim-fugitive'

  -- LSP & DAP
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
    use 'onsails/lspkind-nvim'
  use { 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' }}
  use 'nvim-telescope/telescope-dap.nvim'
  use 'mfussenegger/nvim-dap-python'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'leoluz/nvim-dap-go'

  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
end)
