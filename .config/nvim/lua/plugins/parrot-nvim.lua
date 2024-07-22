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
				anthropic = {
					api_key = os.getenv("ANTHROPIC_API_KEY"),
				},
				gemini = {
					api_key = os.getenv("GEMINI_API_KEY"),
				},
			},
		})
	end,
}
