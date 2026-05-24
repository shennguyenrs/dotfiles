return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "-" },
        topdelete = { text = "-" },
        changedelete = { text = "~" },
        untracked = { text = "=" },
      },
      on_attach = function(bufnr)
        vim.keymap.set(
          "n",
          "<space>gp",
          require("gitsigns").preview_hunk_inline,
          { buffer = bufnr, desc = "Preview Hunk Inline" }
        )
      end,
    })
  end,
}
