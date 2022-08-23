local status, null_ls = pcall(require, 'null-ls')
if not status then
	print("Null-ls is not installed")
	return
end

local builtins = null_ls.builtins

local sources = {
	builtins.formatting.prettierd,
	builtins.diagnostics.eslint_d.with({
		diagnostics_format = '[eslint] #{m}\n(#{c})'
	}),
	builtins.code_actions.gitsigns,
	builtins.code_actions.refactoring,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = sources,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.formatting_sync()
				end,
			})
		end
	end,

})
