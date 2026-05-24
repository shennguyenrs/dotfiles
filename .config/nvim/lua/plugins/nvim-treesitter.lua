return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({
			"bash",
			"css",
			"scss",
			"html",
			"javascript",
			"typescript",
			"tsx",
			"json",
			"lua",
			"python",
			"go",
			"regex",
			"yaml",
			"dockerfile",
			"markdown",
			"markdown_inline",
			"sql",
			"svelte",
			"vim",
		})

		-- Enable syntax highlighting automatically via native Neovim API
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})
	end,
}
