return {
  "saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets",
    {
      "mikavilpas/blink-ripgrep.nvim",
      version = "*", -- use the latest stable version
    }
  },
  version = "1.*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "ripgrep" },
      providers = {
        -- 👇🏻👇🏻 add the ripgrep provider config below
        ripgrep = {
          module = "blink-ripgrep",
          name = "Ripgrep",
          -- see the full configuration below for all available options
          ---@module "blink-ripgrep"
          ---@type blink-ripgrep.Options
          opts = {},
        },
      },
    },
  },
}
