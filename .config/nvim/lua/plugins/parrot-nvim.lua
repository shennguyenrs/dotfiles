return {
  "frankroeder/parrot.nvim",
  event = "BufEnter",
  dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
  config = function()
    require("parrot").setup({
      providers = {
        openai = {
          api_key = os.getenv("OPENAI_API_KEY"),
        },
        custom = {
          style = "openai",
          api_key = os.getenv("OPENROUTER_API_KEY"),
          endpoint = "https://openrouter.ai/api/v1/chat/completions",
          models = {
            "anthropic/claude-3.7-sonnet",
            "openrouter/optimus-alpha",
            "google/gemini-2.5-pro-exp-03-25"
          },
          topic = {
            model = "google/gemini-2.0-flash-exp:free",
            params = { max_completion_tokens = 64 },
          },
          params = {
            chat = { temperature = 1.1, top_p = 1 },
            command = { temperature = 1.1, top_p = 1 },
          },
        },
      },
    })
  end,
}
