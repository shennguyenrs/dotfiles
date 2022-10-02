vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
local colors = require("catppuccin.palettes").get_palette()

require("catppuccin").setup({
	styles = { comments = { "italic" }, keywords = { "italic" } },
	highlight_overrides = {
		all = {
			PmenuSel = { fg = colors.flamingo },
			CursorLine = { bg = colors.base }
		}
	}
})

vim.cmd [[
colo catppuccin
hi Pmenusel gui=bold
hi CursorLine gui=underline
]]
