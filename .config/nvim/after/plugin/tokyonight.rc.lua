require("tokyonight").setup({
	style = "night",
	styles = {
		comments = { italic = true },
		keywords = { italic = true }
	},
	on_highlights = function(hl, c)
		hl.PmenuSel = {
			fg = c.hint
		}
		hl.CursorLine = {
			bg = c.bg
		}
	end
})

vim.cmd [[
colo tokyonight
hi PmenuSel gui=bold
hi CursorLine gui=underline
]]
