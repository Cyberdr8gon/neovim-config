
return {
  -- oil.nvim: modify fileystem from neovim
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  },

  -- nvim-telescope
  -- Setup quick project wide ripgrep
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- vim-sneak
  -- Jump around faster
  {
    "justinmk/vim-sneak",
    dependencies = { 'tpope/vim-repeat' },
  },

  -- vim-dispatch
  -- Allow for compiling in vim
  {
    "tpope/vim-dispatch"
  },

  -- vim-bazel
  -- Enable c++ jump to quickfix error
  {
    "lakshayg/vim-bazel"
  },

}
