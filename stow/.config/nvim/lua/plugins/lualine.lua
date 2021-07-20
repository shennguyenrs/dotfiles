require "lualine".setup {
  options = {
    theme = "tokyonight"
  },
  sections = {
    lualine_b = {
      "branch",
      {"diff", colored = True}
    },
    lualine_x = {
      {"diagnostics", sources = {"nvim_lsp"}},
      "encoding",
      "fileformat",
      "filetype"
    }
  }
}
