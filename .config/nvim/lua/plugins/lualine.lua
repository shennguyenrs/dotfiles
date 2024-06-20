local function show_codeium_status()
	return "{…}" .. vim.fn["codeium#GetStatusString"]()
end

return {
	"hoob3rt/lualine.nvim",
	opts = {
		options = {
			theme = "rose-pine",
			-- theme = 'catppuccin',
			component_separators = "",
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_b = { "branch", { "diff", colored = true } },
			lualine_c = { "filename", "filesize" },
			lualine_x = {
				{ show_codeium_status },
				{ "diagnostics", sources = { "nvim_lsp" } },
				"encoding",
				"fileformat",
				"filetype",
			},
		},
	},
}
