return {
  "jackMort/ChatGPT.nvim",
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  event = "VeryLazy",
  opts = {
    openai_params = {
      model = "gpt-3.5-turbo-1106",
      max_tokens = 8000,
    },
    openai_edit_params = {
      model = "gpt-3.5-turbo-1106",
    },
  },
}
