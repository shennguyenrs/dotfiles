return {
  "kyazdani42/nvim-web-devicons",
  -- Load with lazy
  { "dracula/vim",              name = "dracula",                           lazy = true },
  { "catppuccin/nvim",          name = "catppuccin",                        lazy = true },
  { "folke/tokyonight.nvim",    name = "tokyonight",                        lazy = true },
  -- Load with events
  { "AndrewRadev/tagalong.vim", event = "VeryLazy" },
  { "windwp/nvim-autopairs",    event = "InsertEnter",                      opts = {} },
  { "szw/vim-maximizer",        event = "VeryLazy" },
  { "kylechui/nvim-surround",   version = "*",                              event = "VeryLazy", opts = {} },
  { "numToStr/Comment.nvim",    event = "VeryLazy",                         opts = {} },
  { "folke/trouble.nvim",       event = "VeryLazy" },
  { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }, event = "VeryLazy", opts = {} },
  { "tpope/vim-fugitive",       event = "VeryLazy" },
  {
    "norcalli/nvim-colorizer.lua",
    event = "VeryLazy",
    config = function()
      require("colorizer").setup()
    end,
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
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    event = "VeryLazy",
  },
  {
    "folke/twilight.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "folke/zen-mode.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
