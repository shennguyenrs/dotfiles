local status_ok, lualine = pcall(require, "lualine")
if not status_ok then return end

lualine.setup {
	options = {
		theme = "tokyonight"
	},
	sections = {
		lualine_b = {
			"branch",
			{
				"diff", colored = true
			}
		},
		lualine_x = {
			{ "diagnostics", sources = { "nvim_lsp" } },
			"encoding",
			"fileformat",
			"filetype"
		}
	}
}
