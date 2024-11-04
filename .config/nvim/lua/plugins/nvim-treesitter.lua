return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		highlight = { enable = true },
		-- autotag = { enable = true },
		matchup = { enable = true },
		auto_install = true,
		ensure_installed = {
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
			"sql",
			"svelte",
			"vim",
		},
	},
	-- @param opts TSConfig
	config = function(_, opts)
		if type(opts.ensure_installed) == "table" then
			---@type table<string, boolean>
			local added = {}
			opts.ensure_installed = vim.tbl_filter(function(lang)
				if added[lang] then
					return false
				end
				added[lang] = true
				return true
			end, opts.ensure_installed)
		end

		require("nvim-treesitter.configs").setup(opts)
	end,
}
