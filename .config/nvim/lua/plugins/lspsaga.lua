return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  config = function()
    require("lspsaga").setup({
      lightbulb = {
        enable = false,
      },
    })
  end,
}
