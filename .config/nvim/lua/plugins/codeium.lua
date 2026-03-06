return {
	"Exafunction/codeium.vim",
	event = "BufEnter",
	keys = {
		{
			"<A-l>",
			function()
				return vim.fn["codeium#Accept"]()
			end,
			mode = "i",
			expr = true,
			silent = true,
		},
		{
			"<A-;>",
			function()
				return vim.fn["codeium#CycleCompletions"](1)
			end,
			mode = "i",
			expr = true,
			silent = true,
		},
		{
			"<A-,>",
			function()
				return vim.fn["codeium#CycleCompletions"](-1)
			end,
			mode = "i",
			expr = true,
			silent = true,
		},
		{
			"<A-x>",
			function()
				return vim.fn["codeium#Clear"]()
			end,
			mode = "i",
			expr = true,
			silent = true,
		},
	},
	config = function()
		vim.g.codeium_disable_bindings = 1
		vim.cmd([[
      let g:codeium_filetypes = {
        \ "markdown": v:false,
        \ "zsh": v:false,
        \ "json": v:false,
        \ "sh": v:false,
        \ "text": v:false,
      \ }
    ]])
	end,
}
