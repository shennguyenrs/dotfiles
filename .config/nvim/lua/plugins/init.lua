return {
  { "nvim-tree/nvim-web-devicons", opts = {} },
  -- Load with lazy
  { "dracula/vim",                 name = "dracula",      lazy = true },
  { "catppuccin/nvim",             name = "catppuccin",   lazy = true },
  { "folke/tokyonight.nvim",       name = "tokyonight",   lazy = true },
  { "EdenEast/nightfox.nvim",      name = "nightfox",     lazy = true },
  { "rebelot/kanagawa.nvim",       name = "kanagawa",     lazy = true },
  { "loctvl842/monokai-pro.nvim",  name = "monokai-pro",  lazy = true },
  { "rmehri01/onenord.nvim",       name = "onenord",      lazy = true },
  { "rose-pine/neovim",            name = "rose-pine",    lazy = true },
  -- Load with events
  { "windwp/nvim-autopairs",       event = "InsertEnter", opts = {} },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },
  { "szw/vim-maximizer",     event = "VeryLazy" },
  { "numToStr/Comment.nvim", event = "VeryLazy", opts = {} },
  -- { "folke/trouble.nvim",    event = "VeryLazy" },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    opts = {},
  },
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {},
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {},
  },
}
