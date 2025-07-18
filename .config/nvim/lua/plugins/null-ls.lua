-- Install some source from Manson to support for linting and formatting
-- biome
-- prettierd
-- eslint_d
-- stylua
-- goimports
-- gofumpt
-- sql-formatter
-- sqlfluff
-- yapf

return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local builtins = null_ls.builtins

		local sources = {
			builtins.formatting.prettierd,
			-- builtins.formatting.biome,
			builtins.formatting.gofumpt,
			builtins.diagnostics.sqlfluff.with({ extra_args = { "--dialect", "postgres" } }),
			builtins.formatting.stylua,
			builtins.formatting.goimports,
			builtins.code_actions.gitsigns,
			builtins.formatting.sql_formatter,
			builtins.formatting.yapf,
			builtins.formatting.shfmt,
			-- require("none-ls.diagnostics.eslint_d"),
		}

		null_ls.setup({
			sources = sources,
			on_attach = function(client, bufnr)
				if client.server_capabilities.documentFormattingProvider then
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = vim.api.nvim_create_augroup("Format", { clear = true }),
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
		})
	end,
}
