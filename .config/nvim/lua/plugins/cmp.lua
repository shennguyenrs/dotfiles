local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- local lsp_symbols = {
--     Text = "   (Text) ",
--     Method = "   (Method)",
--     Function = "   (Function)",
--     Constructor = "   (Constructor)",
--     Field = " ﴲ  (Field)",
--     Variable = "[] (Variable)",
--     Class = "   (Class)",
--     Interface = " ﰮ  (Interface)",
--     Module = "   (Module)",
--     Property = " 襁 (Property)",
--     Unit = "   (Unit)",
--     Value = "   (Value)",
--     Enum = " 練 (Enum)",
--     Keyword = "   (Keyword)",
--     Snippet = "   (Snippet)",
--     Color = "   (Color)",
--     File = "   (File)",
--     Reference = "   (Reference)",
--     Folder = "   (Folder)",
--     EnumMember = "   (EnumMember)",
--     Constant = " ﲀ  (Constant)",
--     Struct = " ﳤ  (Struct)",
--     Event = "   (Event)",
--     Operator = "   (Operator)",
--     TypeParameter = "   (TypeParameter)"
-- }

return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"SirVer/ultisnips",
		"quangnguyen30192/cmp-nvim-ultisnips",
		"rafamadriz/friendly-snippets",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"mlaursen/vim-react-snippets",
	},
	config = function()
		local luasnip = require("luasnip")
		local cmp = require("cmp")
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")

		require("cmp_nvim_ultisnips").setup({})

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			formatting = {
				format = function(entry, item)
					-- item.kind = lsp_symbols[item.kind]
					item.menu = ({
						nvim_lsp = "[LSP]",
						ultisnips = "[Ulti]",
						luasnip = "[LuaS]",
						buffer = "[Buff]",
						path = "[Path]",
					})[entry.source.name]

					return item
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = {
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "ultisnips" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
			enabled = function()
				-- disable completion in comments
				local context = require("cmp.config.context")
				-- keep command mode completion enabled when cursor is in a comment
				if vim.api.nvim_get_mode().mode == "c" then
					return true
				else
					return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
				end
			end,
		})

		vim.cmd([[
                set completeopt=menuone,noinsert,noselect
            ]])

		-- If you want insert `(` after select function or method item
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
