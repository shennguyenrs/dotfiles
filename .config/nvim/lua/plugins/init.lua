return {
	"kyazdani42/nvim-web-devicons",
	-- Load with lazy
	{ "dracula/vim", name = "dracula", lazy = true },
	{ "catppuccin/nvim", name = "catppuccin", lazy = true },
	{ "folke/tokyonight.nvim", name = "tokyonight", lazy = true },
	-- Load with events
	{ "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		opts = {},
	},
	{ "szw/vim-maximizer", event = "VeryLazy" },
	{ "numToStr/Comment.nvim", event = "VeryLazy", opts = {} },
	{ "folke/trouble.nvim", event = "VeryLazy" },
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VeryLazy",
		opts = {},
	},
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
}
