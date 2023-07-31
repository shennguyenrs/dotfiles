local status, null_ls = pcall(require, 'null-ls')
if not status then
  print("Null-ls is not installed")
  return
end

local builtins = null_ls.builtins

-- Install some source from Manson to support this Null ls
-- prettierd
-- eslint_d
-- luaformatter
-- goimports
-- gofumpt
-- rustfmt
-- sql-formatter
-- sqlfluff

local sources = {
  builtins.formatting.prettierd,
  builtins.formatting.gofumpt,
  builtins.diagnostics.sqlfluff.with({
    extra_args = { "--dialect", "postgres" }
  }),
  builtins.formatting.lua_format,
  builtins.formatting.goimports,
  builtins.formatting.rustfmt,
  builtins.diagnostics.eslint_d.with({
    diagnostics_format = '[eslint] #{m}\n(#{c})'
  }),
  builtins.code_actions.gitsigns,
  builtins.code_actions.refactoring,
  builtins.formatting.sql_formatter
}

null_ls.setup({
  sources = sources,
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("Format", { clear = true }),
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { async = false }
        end
      })
    end
  end
})
